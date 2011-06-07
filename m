Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p578t7HH029120
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 04:55:07 -0400
Received: from mail-px0-f176.google.com (mail-px0-f176.google.com
	[209.85.212.176])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p578t6cY001353
	for <linux-lvm@redhat.com>; Tue, 7 Jun 2011 04:55:06 -0400
Received: by pxi11 with SMTP id 11so2626248pxi.35
	for <linux-lvm@redhat.com>; Tue, 07 Jun 2011 01:55:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTincWCwYQohG4D6uCU9JTZheV9w-wA@mail.gmail.com>
References: <BANLkTincWCwYQohG4D6uCU9JTZheV9w-wA@mail.gmail.com>
From: Andreas Schild <andreas@soulboarder.net>
Date: Tue, 7 Jun 2011 10:54:46 +0200
Message-ID: <BANLkTi=cqPm=a0CiTWKEAT-2eLNZRufQFw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=bcaec5215e775b376804a51b6093
Subject: Re: [linux-lvm] LVM label lost / system does not boot
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
To: linux-lvm@redhat.com

--bcaec5215e775b376804a51b6093
Content-Type: text/plain; charset=UTF-8

Thanks to a link from Ger (and a lot of googling) I am a couple of steps
ahead:
I was able to recover the Volume Group Configuration and use it to do a
"vgcfgrestore", which worked (!)
next was a vgchange:
vgchange -a y
  device-mapper: resume ioctl failed: Invalid argument
  Unable to resume cmain-data (252:4)
  5 logical volume(s) in volume group "cmain" now active

dmesg showed:
device-mapper: table: 252:4: md0 too small for target: start=2390753664,
len=527835136, dev_size=2918584320

I tried to mount the other volumes, but this did not work either: classical
"specify file system type" (xfs for me) and then the error about bad
superblock etc. xfs_check did not help either.

I went one step back and looked at the superblocks of the two old harddisks
(which are not longer part of the array). I realized one difference: The
Chunk Size for the "old" RAID array was 64K, for the new array this is 512K.

Could this be a reason lvm is off and looks at the wrong place?

Current situation is this: 2 old disks and 2 new disks constitute a clean(?)
RAID 5 array with chunk size 512K with the problems described.
I do have the two old drives, but the file system content has changed during
the step up. My guess is I cannot just hook together everything as it was
and be happy. (I would probably have to zero the superblocks of the two old
HDs (the ones that were in the new array) but would probably end up with the
same problems).

Any ideas? or is this the point where I am in the wrong mailing list?

Thanks so far, I already learned a lot.
Andreas



On Sun, Jun 5, 2011 at 14:47, Andreas Schild <andreas@soulboarder.net>wrote:

> Hi
> The first part might sound like I am in the wrong group, but bear with
> me...
> (I probably am, but I googled up and down RAID and LVM lists and I am still
>  stuck):
> I have a software RAID 5 with 4 disks and LVM on top. I had one volume
> group with two logical volumes (for root and data).
> I wanted to upgrade capacity and started by failing a drive, replacing it
> with a bigger one and let the RAID resync. Worked fine for the first disk.
> The second disk apparently worked (resynced, all looked good), but after a
> reboot the system hung.
> After some back and forth with superblocks (on the devices, never on the
> array) I was able to re-assemble the array clean.
> The system still does not reboot though: "Volume group "cmain" not found".
>
> I booted a live cd, assembled the array and did a pvck on the array
> (/dev/md0):
> "Could not find LVM label on /dev/md0"
> pvdisplay /dev/md0 results in:
>   No physical volume label read from /dev/md0
>   Failed to read physical volume "/dev/md0"
>
> I do not have a backup of my /etc/ and therefore no details regarding the
> configuration of the LVM setup (yes, I know...)
> All I have of the broken system is the /boot partition with its content
>
> Several questions arise:
> - Is it possible to "reconstitute" the LVM with what I have?
> - Is the RAID array really ok, or is it possibly corrupt to begin with (and
> the reason no LVM labels are around)?
> - Should I try to reconstruct with pvcreate/vgcreate? (I shied away from
> any *create commands to not make things worse.)
> - If all is lost, what did I do wrong and what would I need to backup for a
> next time?
>
> Any ideas on how I could get the data back would greatly be appreciated. I
> am in way over my head, so if somebody knowledgeable tells me: "you lost,
> move on" would be bad, but at least would save me some time...
>
> Thanks,
> Andreas
>
>

--bcaec5215e775b376804a51b6093
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks to a link from Ger (and a lot of googling) I am a couple of steps ah=
ead:<div>I was able to recover the Volume Group Configuration and use it to=
 do a &quot;vgcfgrestore&quot;, which worked (!)</div><div>next was a vgcha=
nge:</div>


<div>vgchange -a y</div><div><div>=C2=A0 device-mapper: resume ioctl failed=
: Invalid argument</div><div>=C2=A0 Unable to resume cmain-data (252:4)</di=
v><div>=C2=A0 5 logical volume(s) in volume group &quot;cmain&quot; now act=
ive</div></div>


<div><br></div><div>dmesg showed:</div><div>device-mapper: table: 252:4: md=
0 too small for target: start=3D2390753664, len=3D527835136, dev_size=3D291=
8584320</div><div><br></div><div>I tried to mount the other volumes, but th=
is did not work either: classical &quot;specify file system type&quot; (xfs=
 for me) and then the error about bad superblock etc. xfs_check did not hel=
p either.</div>


<div><br></div><div>I went one step back and looked at the superblocks of t=
he two old harddisks (which are not longer part of the array). I realized o=
ne difference: The Chunk Size for the &quot;old&quot; RAID array was 64K, f=
or the new array this is 512K.</div>


<div><br></div><div>Could this be a reason lvm is off and looks at the wron=
g place?</div><div><br></div><div>Current situation is this: 2 old disks an=
d 2 new disks constitute a clean(?) RAID 5 array with chunk size 512K with =
the problems described.</div>

<div>I do have the two old drives, but the file system content has changed =
during the step up. My guess is I cannot just hook together everything as i=
t was and be happy. (I would probably have to zero the superblocks of the t=
wo old HDs (the ones that were in the new array) but would probably end up =
with the same problems).</div>

<div><br></div><div>Any ideas? or is this the point where I am in the wrong=
 mailing list?</div><div><br></div><div>Thanks so far, I already learned a =
lot.</div><div>Andreas</div><div><br></div><div><br><br><div class=3D"gmail=
_quote">

On Sun, Jun 5, 2011 at 14:47, Andreas Schild <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andreas@soulboarder.net" target=3D"_blank">andreas@soulboarder.n=
et</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi<div>The first part might sound like I am =
in the wrong group, but bear with me...</div><div>(I probably am, but I goo=
gled up and down RAID and LVM lists and I am still =C2=A0stuck):</div>


<div>I have a=C2=A0software RAID 5 with 4 disks and LVM on top. I had one v=
olume group with two logical volumes (for root and data).</div>
<div>I wanted to upgrade capacity and started by failing a drive, replacing=
 it with a bigger one and let the RAID resync. Worked fine for the first di=
sk. The second disk apparently worked (resynced, all looked good), but afte=
r a reboot the system hung.</div>



<div>After some back and forth with superblocks (on the devices, never on t=
he array) I was able to re-assemble the array clean.</div><div>The system s=
till does not reboot though: &quot;Volume group &quot;cmain&quot; not found=
&quot;.</div>



<div><br></div><div>I booted a live cd, assembled the array and did a pvck =
on the array (/dev/md0):</div><div>&quot;Could not find LVM label on /dev/m=
d0&quot;</div><div><div>pvdisplay /dev/md0 results in:</div><div>=C2=A0 No =
physical volume label read from /dev/md0</div>



<div>=C2=A0 Failed to read physical volume &quot;/dev/md0&quot;</div></div>=
<div><br></div><div>I do not have a backup of my /etc/ and therefore no det=
ails regarding the configuration of the LVM setup (yes, I know...)</div><di=
v>



All I have of the broken system is the /boot partition with its content</di=
v><div><br></div><div>Several questions arise:</div><div>- Is it possible t=
o &quot;reconstitute&quot; the LVM with what I have?</div><div>- Is the RAI=
D array really ok, or is it possibly corrupt to begin with (and the reason =
no LVM labels are around)?</div>



<div>- Should I try to reconstruct with pvcreate/vgcreate? (I shied away fr=
om any *create commands to not make things worse.)</div><div>- If all is lo=
st, what did I do wrong and what would I need to backup for a next time?</d=
iv>



<div><br></div><div>Any ideas on how I could get the data back would greatl=
y be appreciated. I am in way over my head, so if somebody knowledgeable te=
lls me: &quot;you lost, move on&quot; would be bad, but at least would save=
 me some time...</div>



<div><br></div><div>Thanks,</div><div>Andreas</div><font color=3D"#888888">=
<div><br></div>
</font></blockquote></div><br></div>

--bcaec5215e775b376804a51b6093--
