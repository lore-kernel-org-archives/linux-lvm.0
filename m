Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9BM9Vik017055
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 18:09:31 -0400
Received: from mtain01-winn.ispmail.ntl.com (mtain01-winn.ispmail.ntl.com
	[81.103.221.41])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9BM99DJ019900
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 18:09:13 -0400
Received: from aamtaout02-winn.ispmail.ntl.com ([81.103.221.35])
	by mtain01-winn.ispmail.ntl.com
	(InterMail vM.7.08.04.00 201-2186-134-20080326) with ESMTP id
	<20101011220909.JOQK3077.mtain01-winn.ispmail.ntl.com@aamtaout02-winn.ispmail.ntl.com>
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 23:09:09 +0100
Received: from [192.168.1.100] (really [86.2.245.5])
	by aamtaout02-winn.ispmail.ntl.com
	(InterMail vG.3.00.04.00 201-2196-133-20080908) with ESMTP id
	<20101011220908.QGAZ6697.aamtaout02-winn.ispmail.ntl.com@[192.168.1.100]>
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 23:09:08 +0100
From: Mike Reed <lists@amadron.com>
Date: Mon, 11 Oct 2010 23:09:01 +0100
Message-ID: <1286834941.5515.4.camel@MobileOne>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't mount LV on fakeraid mirror
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,
I was using a fakeraid mirror with LVM for backups (don't ask) and after
an upgrade from ubuntu 8.10 to ubuntu 9.04, the switch to grub2 broke my
system.
Before doing anything I wanted to check I could still see my backups on
the mirror.
I'm using Ubuntu 10.04 Live CD. I boot up and:

# sudo su
# apt-get install lvm2
...

So far so good. Then

# lvdisplay
--- Logical volume ---
LV Name /dev/VolGroup01/LogVol02
VG Name VolGroup01
LV UUID tyP51S-EMOO-UCfE-4MSy-TA9f-xaJh-SMMnk9
LV Write Access read/write
LV Status NOT available
LV Size 465.76 GiB
Current LE 119234
Segments 1
Allocation inherit
Read ahead sectors auto

Hmmm... it says "NOT available" and indeed, I can't mount it.

# mkdir home
# mount /dev/VolGroup01/LogVol02 home
mount: special device /dev/VolGroup01/LogVol02 does not exist

I checked the raid sets:

# dmraid -s pdc_bbbad
/dev/sdb: "sil" and "pdc" formats discovered (using pdc)!
/dev/sdc: "sil" and "pdc" formats discovered (using pdc)!
*** Active Set
name : pdc_bbbad
size : 976562432
stride : 128
type : mirror
status : ok
subsets: 0
devs : 2
spares : 0

It says "ok". I also check through dmsetup:

# dmsetup info pdc_bbbad
Name: pdc_bbbad
State: ACTIVE
Read Ahead: 256
Tables present: LIVE
Open count: 0
Event number: 1
Major, minor: 252, 0
Number of targets: 1
UUID: DMRAID-pdc_bbbad

It says "ACTIVE" and the tables present are "LIVE". Why is my logical
volume not available?

I then tried:

# partprobe
Error: Can't have a partition outside the disk!
Warning: Unable to open /dev/sr0 read-write (Read-only file
system). /dev/sr0 has been opened read-only.

Now that first error I'd seen a while back even when I could mount the
LV. Now:

# lvdisplay
--- Logical volume ---
LV Name /dev/VolGroup01/LogVol02
VG Name VolGroup01
LV UUID tyP51S-EMOO-UCfE-4MSy-TA9f-xaJh-SMMnk9
LV Write Access read/write
LV Status suspended
# open 0
LV Size 465.76 GiB
Current LE 119234
Segments 1
Allocation inherit
Read ahead sectors auto
- currently set to 256
Block device 252:4

Status is "suspended". Hmmm, looks slightly more hopefule, but:

# lvm lvchange -ay /dev/VolGroup01/LogVol02
device-mapper: resume ioctl failed: Invalid argument
Unable to resume VolGroup01-LogVol02 (252:4)

Before I tried to mount my LV with the backups I knew little about LV (I
remember using some graphical tool to set it up years ago and hadn't
touched it since), and new nothing about dmraid or dmsetup so now I'm
stuck.
Really want to check my backup mirror LV before doing anything else so
would really appreciate if someone can give me some pointers as to what
to do next.

Thanks,
Mike.
