Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2BNCla8027421
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 19:12:47 -0400
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2BNCjkd015644
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 19:12:46 -0400
Received: by wesw62 with SMTP id w62so12670951wes.0
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 16:12:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2134825.VZEVSUbKJK@libor-nb>
References: <2134825.VZEVSUbKJK@libor-nb>
From: Premchand Gupta <gpremchand@gmail.com>
Date: Thu, 12 Mar 2015 04:42:24 +0530
Message-ID: <CABshL3=6XNnvNF1jgyHMpxbL3jKp=QS6FGyk2xqcyR5RT5uOOw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=f46d04447e9fa6c72f05110b6797
Subject: Re: [linux-lvm] Removing disk from raid LVM
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

--f46d04447e9fa6c72f05110b6797
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi ,

if software raid is configure over the lvm, then follow below step.
step 1) fail and remove the device from raid 5 with command mdamd
step 2) removed disk form lv, vg then pv
step 3) delete it from system with echo command







*Thanks & RegardsPremchand S. Gupta09820314487*

On Mon, Mar 9, 2015 at 4:51 PM, Libor Klep=C3=A1=C4=8D <libor.klepac@bcom.c=
z> wrote:

>  Hello,
>
> web have 4x3TB disks in LVM for backups and I setup per customer/per
> "task" LV type raid5 on it.
>
> Last week, smartd started to alarm us, that one of the disk will soon go
> away.
>
> So we shut down the computer, replaced disk and then i used vgcfgrestore
> on new disk to restore metadata.
>
> Result was, that some LVs came up with damaged filesystem, some didn't
> came up at all with messages like (one of rimage and rmeta was "wrong",
> when i used KVPM util, it was type "virtual"
>
> ----
>
> [123995.826650] mdX: bitmap initialized from disk: read 4 pages, set 1 of
> 98312 bits
>
> [124071.037501] device-mapper: raid: Failed to read superblock of device
> at position 2
>
> [124071.055473] device-mapper: raid: New device injected into existing
> array without 'rebuild' parameter specified
>
> [124071.055969] device-mapper: table: 253:83: raid: Unable to assemble
> array: Invalid superblocks
>
> [124071.056432] device-mapper: ioctl: error adding target to table
>
> ----
>
> After that, i tried several combinations of
>
> lvconvert --repair
>
> and
>
> lvchange -ay --resync
>
>
>
> Without success. So i saved some data and than created new empty LV's and
> started backups from scratch.
>
>
>
> Today, smartd alerted on another disk.
>
> So how can i safely remove disk from VG?
>
> I tried to simulate it on VM
>
>
>
> echo 1 > /sys/block/sde/device/delete
>
> vgreduce -ff vgPecDisk2 /dev/sde #doesn't allow me to remove
>
> vgreduce --removemissing vgPecDisk2 #doesn't allow me to remove
>
> vgreduce --removemissing --force vgPecDisk2 #works, alerts me about rimag=
e
> and rmeta LVS
>
>
>
> vgchange -ay vgPecDisk2 #works but LV isn't active, only rimage and rmeta
> LV show up.
>
>
>
> So how to safely remove soon-to-be-bad-drive and insert new drive to arra=
y?
>
> Server has no more physical space for new drive, so we cannot use pvmove.
>
>
>
> Server is debian wheezy, but kernel is 2.6.14.
>
> Lvm is in version 2.02.95-8 , but i have another copy i use for raid
> operations, which is in version 2.02.104
>
>
>
> With regards
>
> Libor
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--f46d04447e9fa6c72f05110b6797
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi ,<div><br></div><div>if software raid is configure over=
 the lvm, then follow below step.</div><div>step 1) fail and remove the dev=
ice from raid 5 with command mdamd</div><div>step 2) removed disk form lv, =
vg then pv</div><div>step 3) delete it from system with echo command</div><=
div><br></div></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div =
class=3D"gmail_signature"><strong><font color=3D"#999999"><font face=3D"gar=
amond,serif">Thanks &amp; Regards<br><br><span>Premchand</span> S. Gupta<sp=
an></span><span></span><br>09820314487<br></font><br></font></strong></div>=
</div>
<br><div class=3D"gmail_quote">On Mon, Mar 9, 2015 at 4:51 PM, Libor Klep=
=C3=A1=C4=8D <span dir=3D"ltr">&lt;<a href=3D"mailto:libor.klepac@bcom.cz" =
target=3D"_blank">libor.klepac@bcom.cz</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><u></u>
<div style=3D"font-family:&#39;DejaVu Sans&#39;;font-size:9pt;font-weight:4=
00;font-style:normal">
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">Hello,</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">web have 4x3TB disks in LVM for backups and I setup per=
 customer/per &quot;task&quot; LV type raid5 on it.</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">Last week, smartd started to alarm us, that one of the =
disk will soon go away.<br><br>So we shut down the computer, replaced disk =
and then i used vgcfgrestore on new disk to restore metadata.</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">Result was, that some LVs came up with damaged filesyst=
em, some didn&#39;t came up at all with messages like (one of rimage and rm=
eta was &quot;wrong&quot;, when i used KVPM util, it was type &quot;virtual=
&quot;</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">----</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">[123995.826650] mdX: bitmap initialized from disk: read=
 4 pages, set 1 of 98312 bits</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">[124071.037501] device-mapper: raid: Failed to read sup=
erblock of device at position 2</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">[124071.055473] device-mapper: raid: New device injecte=
d into existing array without &#39;rebuild&#39; parameter specified</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">[124071.055969] device-mapper: table: 253:83: raid: Una=
ble to assemble array: Invalid superblocks</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">[124071.056432] device-mapper: ioctl: error adding targ=
et to table</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">----</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">After that, i tried several combinations of</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">lvconvert --repair </p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">and</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">lvchange -ay --resync</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">=C2=A0</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">Without success. So i saved some data and than created =
new empty LV&#39;s and started backups from scratch.</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">=C2=A0</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">Today, smartd alerted on another disk.</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">So how can i safely remove disk from VG?</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">I tried to simulate it on VM</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">=C2=A0</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">echo 1 &gt; /sys/block/sde/device/delete</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">vgreduce -ff vgPecDisk2 /dev/sde #doesn&#39;t allow me =
to remove</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">vgreduce --removemissing vgPecDisk2 #doesn&#39;t allow =
me to remove</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">vgreduce --removemissing --force vgPecDisk2 #works, ale=
rts me about rimage and rmeta LVS</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">=C2=A0</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">vgchange -ay vgPecDisk2 #works but LV isn&#39;t active,=
 only rimage and rmeta LV show up.</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">=C2=A0</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">So how to safely remove soon-to-be-bad-drive and insert=
 new drive to array?</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">Server has no more physical space for new drive, so we =
cannot use pvmove.</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">=C2=A0</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">Server is debian wheezy, but kernel is 2.6.14.</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">Lvm is in version 2.02.95-8 , but i have another copy i=
 use for raid operations, which is in version 2.02.104</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">=C2=A0</p>
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">With regards</p><span class=3D"HOEnZb"><font color=3D"#=
888888">
<p style=3D"margin-top:0px;margin-bottom:0px;margin-left:0px;margin-right:0=
px;text-indent:0px">Libor</p></font></span></div><br>______________________=
_________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>=
</div>

--f46d04447e9fa6c72f05110b6797--
