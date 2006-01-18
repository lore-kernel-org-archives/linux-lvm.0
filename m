Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0I0Bx104262
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2006 19:11:59 -0500
Received: from av9-2-sn2.hy.skanova.net (av9-2-sn2.hy.skanova.net
	[81.228.8.180])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0I0BnxX004455
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2006 19:11:50 -0500
Received: from smtp4-1-sn2.hy.skanova.net (smtp4-1-sn2.hy.skanova.net
	[81.228.8.92])
	by av9-2-sn2.hy.skanova.net (Postfix) with ESMTP id 5362537F3F
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 01:11:44 +0100 (CET)
Received: from knuth (h128n1-m-sp-gr100.ias.bredband.telia.com
	[81.236.184.128])
	by smtp4-1-sn2.hy.skanova.net (Postfix) with SMTP id 3E55E37E69
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 01:11:44 +0100 (CET)
Message-ID: <115501c61bc3$c4afb520$0a01000a@knuth>
From: "Jimisola Laursen" <public@jimisola.com>
References: <00bb01c606e3$a29f75a0$0a01000a@knuth>
Subject: Re: [linux-lvm] Lost all logical volumes in two volume groups?
Date: Wed, 18 Jan 2006 01:11:45 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: linux-lvm@redhat.com

Hi!

I made the post below a almost a month ago, but I never received any replies.

I would really appreciate some help on this matter since I haven't been able to 
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
> I just plugged in my disks again and the LVM partitions are recognized, but 
> there are no LVs!
> Is there anyway for me to fix this?
>
> I have an old copy of /etc/lvm with archive and backup directories including 
> vg01_00000.vg and vg01_00001.vg.
> No .vg files for vg02 though, but that VG is less important than the vg01 one.
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
