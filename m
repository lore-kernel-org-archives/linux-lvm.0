Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0IIn3131968
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 13:49:03 -0500
Received: from desktopmusicindustry.desktopmusicindustry.com
	(desktopmusicindustry.desktopmusicindustry.com [66.70.153.192])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0IIn0Bm011112
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 13:49:00 -0500
Received: from support (adsl-69-227-240-142.dsl.pltn13.pacbell.net
	[69.227.240.142]) (authenticated bits=0)
	by desktopmusicindustry.desktopmusicindustry.com (8.12.10/8.12.10) with
	ESMTP id k0IImpUw028780
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 10:48:52 -0800
From: "Dan Elder" <isbeen@izmedia.com>
Subject: RE: [linux-lvm] Lost all logical volumes in two volume groups?
Message-ID: <POEPJKKIACNHGGMFNPNPOEGLGOAA.isbeen@izmedia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <115501c61bc3$c4afb520$0a01000a@knuth>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Wed, 18 Jan 2006 18:49:04 -0000
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

I received this info when I posted a similar question, perhaps this will be
useful.
----------------------

hi, i found your message in the redhat lvm-mailinglist doing a google
resarch about exactly that same problem.

because i'm not member of the mailing list i prefer to write directly to
tell you what i found after days of resarch and as my last resort facing the
fact to lose everything on a single 750gb array ;)

preface: i had only one(!) lv spanning the whole 750gb vg. i think this is
pretty important for the following procedure - especially if the exact
parameters are not known (in my case because the whole system was set up
trough a 3rd party linux-based NAS)

1) i simply recreated that one lv with lvcreate (my luck it was initially
set up using all standards and max. possible size)

2) now there was no filsystem (as i supposed). but a filesystemrepair
(xfs_repair in my case) did the magic. it found the 2nd superblock intact
and after a short while everything was in place again.

3) feels like winning the lottery.

4) i'm a true linux-novice and to me that procedure felt extreme risky, but
i found nothing, absolutely nothing else that comes any near just a little
help in such a case; no tools, no how-tos, nothing. so i tried it, at last
considering this isn't totally out of logic.


bye & greetings from vienna,
gerald gstaltner

-----Original Message-----
From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]On Behalf Of Jimisola Laursen
Sent: Tuesday, January 17, 2006 4:12 PM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Lost all logical volumes in two volume groups?


Hi!

I made the post below a almost a month ago, but I never received any
replies.

I would really appreciate some help on this matter since I haven't been able
to
solve it.

Kindly,
Jimisola

----- Original Message -----
From: "Jimisola Laursen" <public@jimisola.com>
To: <linux-lvm@redhat.com>
Sent: Thursday, December 22, 2005 11:36 AM
Subject: [linux-lvm] Lost all logical volumes in two volume groups?


> Hi!
>
> After a failed Mandriva upgrade I can no longer use my two LVM (vg01 and
> vg02).
> When the upgrade failed I unplugged my disks after two-three boots where
> ReiserFS found errors until I had reinstalled my system (with OpenSuse).
>
> I just plugged in my disks again and the LVM partitions are recognized,
but
> there are no LVs!
> Is there anyway for me to fix this?
>
> I have an old copy of /etc/lvm with archive and backup directories
including
> vg01_00000.vg and vg01_00001.vg.
> No .vg files for vg02 though, but that VG is less important than the vg01
one.
>
> VG system: current OpenSuse system
> VG vg01: shows no LV (have .vg files)
> VG vg02: shows no LV (have no .vg files)
>
> All partitions are ReiserFS.
>
> Regards,
> Jimisola
>
> fermat:/scratch # vgchange -ay
>  0 logical volume(s) in volume group "vg02" now active
>  5 logical volume(s) in volume group "system" now active
>  0 logical volume(s) in volume group "vg01" now active
> fermat:/scratch # vgdisplay
>  --- Volume group ---
>  VG Name               vg02
>  System ID
>  Format                lvm2
>  Metadata Areas        1
>  Metadata Sequence No  3
>  VG Access             read/write
>  VG Status             resizable
>  MAX LV                255
>  Cur LV                0
>  Open LV               0
>  Max PV                255
>  Cur PV                1
>  Act PV                1
>  VG Size               45.90 GB
>  PE Size               4.00 MB
>  Total PE              11750
>  Alloc PE / Size       0 / 0
>  Free  PE / Size       11750 / 45.90 GB
>  VG UUID               crHchE-236z-G24u-AGhW-MgDd-nTxD-1MnxHn
>
>  --- Volume group ---
>  VG Name               system
>  System ID
>  Format                lvm2
>  Metadata Areas        1
>  Metadata Sequence No  7
>  VG Access             read/write
>  VG Status             resizable
>  MAX LV                0
>  Cur LV                5
>  Open LV               5
>  Max PV                0
>  Cur PV                1
>  Act PV                1
>  VG Size               97.66 GB
>  PE Size               4.00 MB
>  Total PE              25001
>  Alloc PE / Size       11506 / 44.95 GB
>  Free  PE / Size       13495 / 52.71 GB
>  VG UUID               qMe8jO-4Qyl-Weno-k09t-n2Pd-Jo5G-Co7kpn
>
>  --- Volume group ---
>  VG Name               vg01
>  System ID
>  Format                lvm2
>  Metadata Areas        1
>  Metadata Sequence No  12
>  VG Access             read/write
>  VG Status             resizable
>  MAX LV                255
>  Cur LV                0
>  Open LV               0
>  Max PV                255
>  Cur PV                1
>  Act PV                1
>  VG Size               232.88 GB
>  PE Size               4.00 MB
>  Total PE              59618
>  Alloc PE / Size       0 / 0
>  Free  PE / Size       59618 / 232.88 GB
>  VG UUID               YowUTE-awQj-OyKP-0UGH-nwkD-MZzt-e8P0kK
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
