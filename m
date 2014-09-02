Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s82EBLJJ003483
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2014 10:11:21 -0400
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s82EBDR3001679
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 2 Sep 2014 10:11:14 -0400
Received: by mail-yk0-f178.google.com with SMTP id q200so4082769ykb.23
	for <linux-lvm@redhat.com>; Tue, 02 Sep 2014 07:11:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <540588A0.50402@redhat.com>
References: <CAAN_kG2zBvS1iVhdqO2zvQ2+QW-SpyM2PhHG2j+zhSFZbOmnRg@mail.gmail.com>
	<540588A0.50402@redhat.com>
Date: Tue, 2 Sep 2014 07:11:13 -0700
Message-ID: <CAAN_kG1HmmoXzZscxvqScULvUaqv=Ay-b6BLADiH+A=u-r2-vg@mail.gmail.com>
From: Timur Alperovich <timur@maginatics.com>
Content-Type: multipart/alternative; boundary=001a11c2c2b42926f6050215b12f
Subject: Re: [linux-lvm] Data percentage too large after thin_dump
	--repair/thin_restore
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--001a11c2c2b42926f6050215b12f
Content-Type: text/plain; charset=UTF-8

Thanks for the reply Zdenek!

I realized that the biggest confusion for me is that I'm using LVM2 tools
2.02.98-6 (which is the latest version in Ubuntu) and the swapping support
was added in 2.02.98-9 (I'm curious why they didn't pick the latest of
2.02.98).

On Tue, Sep 2, 2014 at 2:06 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 1.9.2014 v 20:13 Timur Alperovich napsal(a):
>
>  Hi there,
>>
>> I'm using LVM 2.02.98 and encountered a metadata corruption issue. To
>> recover
>> from it, I attempted to perform the following steps:
>> 1. thin_check /dev/mapper/pool_tmeta
>> 2. thin_dump /dev/mapper/pool_tmeta > /tmp/metadata
>>
>
> Hi
>
> NEVER EVER use _tmeta device from running active thin-pool volume.
> It's the very same case like you would be running  'fsck' on
> a mounted filesystem.

 3. dd if=/dev/zero of=/dev/mapper/pool_tmeta
>> 4. thin_restore -i /tmp/metadata -o /dev/mapper/pool_tmeta
>>
>> All of the above steps have succeeded, however, when attempting to list
>> the
>> _metadata\_percent_ field, I get an error:
>>
>
> I'm surprised you've not got kernel OOPS after such brutal destruction
> of life metadata device (i.e. almost equal to zeroing your root volume).
>
>
>  Is this a known issue and is there a workaround? I need to be able to
>> examine
>> the _metadata\_percent_ field to make sure we don't exhaust the metadata
>> space.
>>
>>
> Normal way -
>
> lvconvert --repair vg/pool
>

I believe this was added in 2.02.102. Unfortunately, upgrading LVM2 is a
bit tricky on Ubuntu (will need to build the package from source).


>
>
> If this is not working - then you can 'swap' metadata out of your thin-pool
> using following sequence-
>
> - make sure pool is not active.
> - build temporary local LV   (lvcreate -l1 vg -n temp)
> - swap this LV with metadata of to-be-repaired pool
>   (lvconvert --thinpool vg/fixpool --poolmetadata temp)
>

This command fails, as --poolmetadata is not a valid option. I found that
the swapping was not supported until 2.02.98-9 and I'm using 2.02.98-6 (in
2.02.98-9 changelog: "Add lvconvert support to swap thin pool metadata
volume."). Is there a way to do this without the swapping support? I guess
I should be able to do it with dmsetup? I'm not sure how painful that would
be.

I'll look into upgrading the version, as well (which is probably the right
thing to do).

- activate 'temp' LV now with pool's metadata

  (lvchange -ay vg/temp)
> - repair metadata
>   (you may need other 'bigger' volume to restore fixed metadata)
>   (i.e.  thin_restore -i /dev/vg/temp -o /dev/vg/biggertemp)
> - thin_check restored volume
> - thin_dump - and compare  vgcfgrestore & this dump are at the same
>   transaction_id state (look at lvm2 metadata for thin pool)
> - deactivate again related volumes
> - swap repaired LV back
>   (lvconvert --thinpool vg/fixpool --poolmetadata repairedtemp)
> - try to active repaired thin pool
> - remove unneeded volumes from vg....
>
>
> Zdenek
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

Timur

--001a11c2c2b42926f6050215b12f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the reply Zdenek!<div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">I realized that the biggest confusion for=
 me is that I&#39;m using LVM2 tools 2.02.98-6 (which is the latest version=
 in Ubuntu) and the swapping support was added in 2.02.98-9 (I&#39;m curiou=
s why they didn&#39;t pick the latest of 2.02.98).</div>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Sep 2, 20=
14 at 2:06 AM, Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mailto:zkabe=
lac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex">
Dne 1.9.2014 v 20:13 Timur Alperovich napsal(a):<div class=3D""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Hi there,<br>
<br>
I&#39;m using LVM 2.02.98 and encountered a metadata corruption issue. To r=
ecover<br>
from it, I attempted to perform the following steps:<br>
1. thin_check /dev/mapper/pool_tmeta<br>
2. thin_dump /dev/mapper/pool_tmeta &gt; /tmp/metadata<br>
</blockquote>
<br></div>
Hi<br>
<br>
NEVER EVER use _tmeta device from running active thin-pool volume.<br>
It&#39;s the very same case like you would be running=C2=A0 &#39;fsck&#39; =
on<br>
a mounted filesystem.=C2=A0</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rg=
b(204,204,204);border-left-style:solid;padding-left:1ex"><div class=3D"">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
3. dd if=3D/dev/zero of=3D/dev/mapper/pool_tmeta<br>
4. thin_restore -i /tmp/metadata -o /dev/mapper/pool_tmeta<br>
<br>
All of the above steps have succeeded, however, when attempting to list the=
<br>
_metadata\_percent_ field, I get an error:<br>
</blockquote>
<br></div>
I&#39;m surprised you&#39;ve not got kernel OOPS after such brutal destruct=
ion<br>
of life metadata device (i.e. almost equal to zeroing your root volume).<di=
v class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Is this a known issue and is there a workaround? I need to be able to exami=
ne<br>
the _metadata\_percent_ field to make sure we don&#39;t exhaust the metadat=
a space.<br>
<br>
</blockquote>
<br></div>
Normal way -<br>
<br>
lvconvert --repair vg/pool<br></blockquote><div><br></div><div>I believe th=
is was added in 2.02.102. Unfortunately, upgrading LVM2 is a bit tricky on =
Ubuntu (will need to build the package from source).</div><div>=C2=A0</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
<br>
<br>
If this is not working - then you can &#39;swap&#39; metadata out of your t=
hin-pool<br>
using following sequence-<br>
<br>
- make sure pool is not active.<br>
- build temporary local LV=C2=A0 =C2=A0(lvcreate -l1 vg -n temp)<br>
- swap this LV with metadata of to-be-repaired pool<br>
=C2=A0 (lvconvert --thinpool vg/fixpool --poolmetadata temp)<br></blockquot=
e><div><br></div><div>This command fails, as --poolmetadata is not a valid =
option. I found that the swapping was not supported until 2.02.98-9 and I&#=
39;m using 2.02.98-6 (in 2.02.98-9 changelog: &quot;<span style=3D"font-siz=
e:14px;color:rgb(102,102,102);font-family:Cantarell,sans-serif">Add lvconve=
rt support to swap thin pool metadata volume.&quot;)</span>. Is there a way=
 to do this without the swapping support? I guess I should be able to do it=
 with dmsetup? I&#39;m not sure how painful that would be.</div>
<div><br></div><div>I&#39;ll look into upgrading the version, as well (whic=
h is probably the right thing to do).</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

- activate &#39;temp&#39; LV now with pool&#39;s metadata=C2=A0</blockquote=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">

=C2=A0 (lvchange -ay vg/temp)<br>
- repair metadata<br>
=C2=A0 (you may need other &#39;bigger&#39; volume to restore fixed metadat=
a)<br>
=C2=A0 (i.e.=C2=A0 thin_restore -i /dev/vg/temp -o /dev/vg/biggertemp)<br>
- thin_check restored volume<br>
- thin_dump - and compare=C2=A0 vgcfgrestore &amp; this dump are at the sam=
e<br>
=C2=A0 transaction_id state (look at lvm2 metadata for thin pool)<br>
- deactivate again related volumes<br>
- swap repaired LV back<br>
=C2=A0 (lvconvert --thinpool vg/fixpool --poolmetadata repairedtemp)<br>
- try to active repaired thin pool<br>
- remove unneeded volumes from vg....<br>
<br>
<br>
Zdenek<br>
<br>
<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote></div><br></div><div class=3D"gmail_extra">Timur</div></div>

--001a11c2c2b42926f6050215b12f--
