MIME-Version: 1.0
In-Reply-To: <56A25434.6030002@redhat.com>
References: <CAD=NvSb8TsprJPuOTwCPALPiv9+LRCECy0WUNPx-iobCK5EJUg@mail.gmail.com>
	<56A25434.6030002@redhat.com>
Date: Tue, 26 Jan 2016 22:43:20 +0000
Message-ID: <CAD=NvSZFkSbOGs1avyGs_PdxoxU3B0T_sR9weuaxxrcOu5y53w@mail.gmail.com>
From: Daniel Leong <daniel.leong@gmail.com>
Content-Type: multipart/alternative; boundary=001a114020628bb3ed052a44690d
Subject: Re: [linux-lvm] Accessing LVM cache origin
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Marian Csontos <mcsontos@redhat.com>
Cc: linux-lvm@redhat.com

--001a114020628bb3ed052a44690d
Content-Type: text/plain; charset=UTF-8

Thank you very much! That worked a treat.

Slightly scary process, but fortune favours the bold and backed-up ;) In
all fairness cache device redundancy is mentioned in lvmcache(7), and I
consider this to have been a worthy experiment.

Thanks again,
Dan



On Fri, Jan 22, 2016 at 4:09 PM, Marian Csontos <mcsontos@redhat.com> wrote:

> On 01/20/2016 12:23 AM, Daniel Leong wrote:
>
>> Hello,
>>
>> I'm struggling to find information about lvmcache recovery after the cache
>> fails. Is it possible to access an LVcache origin if the PV for the cache
>> has failed?
>>
>> If I try partial mode :
>>    lvchange -a y -P fedora/home
>>
>> Then it just hangs.
>>
>> If I try the home_corig directly :
>>    lvchange -a y -P fedora/home_corig
>>
>>    "Unable to change internal LV home_corig directly"
>>
>> I can see the LVs with :
>>     lvs -a -o +devices fedora
>>
>> The home_corig is still on /dev/sdb3 so I can probably find the blocks if
>> needed ... but that seems like hard work!
>>
>> At the moment [cache_cdata] and [cache_cmeta] are on "unknown device"
>> because it failed. Can I just extend to a new PV for the cache?
>>
>
> Hi, this is a known limitation. There is a Bug 1131777 - "LVM cache: If
> writethrough, allow abandoning cachepool if it has failed".
>
> https://bugzilla.redhat.com/show_bug.cgi?id=1131777
>
> In any case if you were using cache in writeback mode be ready for havoc
> in the filesystem as it is likely many "hot" filesystem metadata blocks
> were kept in cache and not written to HDD.
>
> THIS IS A DANGEROUS OPERATION!
> Any readers here, check the BZ above first if LVM already has a better
> solution.
>
> Proceed with extreme care! And better double check steps on #lvm IRC
> channel on freenode.
>
> First rule is:
> *Backup first.*
>
> Second rule is:
> Do not try to use --force/-f with lvm commands - many of them cause
> irrevocable damage.
> You want to check the man pages, and better ask before using the force.
>
> Now the steps:
>
> At the moment the only way is to edit metadata manually by using
> vgcfgbackup (or file from /etc/lvm/backup/) and vgcfgrestore.
>
> Ideally you will work on a copy of the disk. (You do have the backup,
> right?)
>
> If you have a system to test the steps "dry" run it there!
> Simulate device failure using:
>
>   echo 1 > /sys/block/DEV/device/delete
>
> Run the below steps on the test system and check the results.
> If in doubt ask. If everything went well, and you still have the backup,
> then you are safe to proceed.
>
> Run
>
>     vgcfgbackup -f FILE VG
>
> If the LV is active, I had to deactivate LVs before proceeding. I used
>
>     vgchange -an VG
>
> This hangs as it is trying to check the cache-pool. ^C will stop the check.
>
> Then I had to run:
>
>     vgreduce --removemissing VG
>
> Now editing the file FILE:
>
> 1. Replace segments in home by those from home_corig. If necessary adjust
> segment_count.
>
> 2. Remove home_corig, CACHE_cdata, CACHE_cmeta and CACHE.
>
> 2.1 You may want to remove lvol0_pmspare if there are no thin-pools and no
> more cache pools in the system.
>
> 3. Remove the missing PV - the one where device is unknown device:
>
>                         device = "unknown device"       # Hint only
>
>                         status = ["ALLOCATABLE"]
>                         flags = ["MISSING"]
>
> Then run:
>
>     vgcfgrestore -f FILE VG
>
> After the backup try proceeding with fsck.
>
> If anything went wrong, return to backup.
>
> -- Martian
>
>
>> Thanks for any tips, and apologies if I'm being stupid.
>>
>> Dan
>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>

--001a114020628bb3ed052a44690d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you very much!=C2=A0That worked a treat.<div><br></d=
iv><div>Slightly scary process, but fortune favours the bold and backed-up =
;) In all fairness cache device redundancy is mentioned in lvmcache(7), and=
 I consider this to have been a worthy experiment.</div><div><br></div><div=
>Thanks again,</div><div>Dan<br><div><br></div><div><br></div></div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jan 22, 20=
16 at 4:09 PM, Marian Csontos <span dir=3D"ltr">&lt;<a href=3D"mailto:mcson=
tos@redhat.com" target=3D"_blank">mcsontos@redhat.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">On 01/20/2016 12:23 AM,=
 Daniel Leong wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello,<br>
<br>
I&#39;m struggling to find information about lvmcache recovery after the ca=
che<br>
fails. Is it possible to access an LVcache origin if the PV for the cache<b=
r>
has failed?<br>
<br>
If I try partial mode :<br>
=C2=A0 =C2=A0lvchange -a y -P fedora/home<br>
<br>
Then it just hangs.<br>
<br>
If I try the home_corig directly :<br>
=C2=A0 =C2=A0lvchange -a y -P fedora/home_corig<br>
<br>
=C2=A0 =C2=A0&quot;Unable to change internal LV home_corig directly&quot;<b=
r>
<br>
I can see the LVs with :<br>
=C2=A0 =C2=A0 lvs -a -o +devices fedora<br>
<br>
The home_corig is still on /dev/sdb3 so I can probably find the blocks if<b=
r>
needed ... but that seems like hard work!<br>
<br>
At the moment [cache_cdata] and [cache_cmeta] are on &quot;unknown device&q=
uot;<br>
because it failed. Can I just extend to a new PV for the cache?<br>
</blockquote>
<br></span>
Hi, this is a known limitation. There is a Bug 1131777 - &quot;LVM cache: I=
f writethrough, allow abandoning cachepool if it has failed&quot;.<br>
<br>
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1131777" rel=3D"no=
referrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D1=
131777</a><br>
<br>
In any case if you were using cache in writeback mode be ready for havoc in=
 the filesystem as it is likely many &quot;hot&quot; filesystem metadata bl=
ocks were kept in cache and not written to HDD.<br>
<br>
THIS IS A DANGEROUS OPERATION!<br>
Any readers here, check the BZ above first if LVM already has a better solu=
tion.<br>
<br>
Proceed with extreme care! And better double check steps on #lvm IRC channe=
l on freenode.<br>
<br>
First rule is:<br>
*Backup first.*<br>
<br>
Second rule is:<br>
Do not try to use --force/-f with lvm commands - many of them cause irrevoc=
able damage.<br>
You want to check the man pages, and better ask before using the force.<br>
<br>
Now the steps:<br>
<br>
At the moment the only way is to edit metadata manually by using vgcfgbacku=
p (or file from /etc/lvm/backup/) and vgcfgrestore.<br>
<br>
Ideally you will work on a copy of the disk. (You do have the backup, right=
?)<br>
<br>
If you have a system to test the steps &quot;dry&quot; run it there!<br>
Simulate device failure using:<br>
<br>
=C2=A0 echo 1 &gt; /sys/block/DEV/device/delete<br>
<br>
Run the below steps on the test system and check the results.<br>
If in doubt ask. If everything went well, and you still have the backup, th=
en you are safe to proceed.<br>
<br>
Run<br>
<br>
=C2=A0 =C2=A0 vgcfgbackup -f FILE VG<br>
<br>
If the LV is active, I had to deactivate LVs before proceeding. I used<br>
<br>
=C2=A0 =C2=A0 vgchange -an VG<br>
<br>
This hangs as it is trying to check the cache-pool. ^C will stop the check.=
<br>
<br>
Then I had to run:<br>
<br>
=C2=A0 =C2=A0 vgreduce --removemissing VG<br>
<br>
Now editing the file FILE:<br>
<br>
1. Replace segments in home by those from home_corig. If necessary adjust s=
egment_count.<br>
<br>
2. Remove home_corig, CACHE_cdata, CACHE_cmeta and CACHE.<br>
<br>
2.1 You may want to remove lvol0_pmspare if there are no thin-pools and no =
more cache pools in the system.<br>
<br>
3. Remove the missing PV - the one where device is unknown device:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 device =3D &quot;unknown device&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
# Hint only<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status =3D [&quot;ALLOCATABLE&quot;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 flags =3D [&quot;MISSING&quot;]<br>
<br>
Then run:<br>
<br>
=C2=A0 =C2=A0 vgcfgrestore -f FILE VG<br>
<br>
After the backup try proceeding with fsck.<br>
<br>
If anything went wrong, return to backup.<br>
<br>
-- Martian<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
<br>
Thanks for any tips, and apologies if I&#39;m being stupid.<br>
<br>
Dan<br>
<br>
<br>
<br></span>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
</blockquote>
<br>
</blockquote></div><br></div>

--001a114020628bb3ed052a44690d--
