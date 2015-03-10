Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2A9NClZ003319
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 05:23:12 -0400
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2A9N9tE006465
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 05:23:10 -0400
Received: by oibg201 with SMTP id g201so191982oib.10
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 02:23:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2134825.VZEVSUbKJK@libor-nb>
References: <2134825.VZEVSUbKJK@libor-nb>
Date: Tue, 10 Mar 2015 10:23:08 +0100
Message-ID: <CAE7pJ3B1oSS1WvfKH7e9zux4kbTVL9WvA2-uWsgpsxF17-dK4Q@mail.gmail.com>
From: emmanuel segura <emi2fast@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

echo 1 > /sys/block/sde/device/delete #this is wrong from my point of
view, you need first try to remove the disk from lvm

vgreduce -ff vgPecDisk2 /dev/sde #doesn't allow me to remove

vgreduce --removemissing vgPecDisk2 #doesn't allow me to remove

vgreduce --removemissing --force vgPecDisk2 #works, alerts me about
rimage and rmeta LVS


1: remove the failed device physically not from lvm and insert the new device
2: pvcreate --uuid "FmGRh3-zhok-iVI8-7qTD-S5BI-MAEN-NYM5Sk"
--restorefile /etc/lvm/archive/VG_00050.vg /dev/sdh1 #to create the pv
with OLD UUID of remove disk
3: now you can restore the vg metadata


https://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/mdatarecover.html

2015-03-09 12:21 GMT+01:00 Libor Klepáč <libor.klepac@bcom.cz>:
> Hello,
>
> web have 4x3TB disks in LVM for backups and I setup per customer/per "task"
> LV type raid5 on it.
>
> Last week, smartd started to alarm us, that one of the disk will soon go
> away.
>
> So we shut down the computer, replaced disk and then i used vgcfgrestore on
> new disk to restore metadata.
>
> Result was, that some LVs came up with damaged filesystem, some didn't came
> up at all with messages like (one of rimage and rmeta was "wrong", when i
> used KVPM util, it was type "virtual"
>
> ----
>
> [123995.826650] mdX: bitmap initialized from disk: read 4 pages, set 1 of
> 98312 bits
>
> [124071.037501] device-mapper: raid: Failed to read superblock of device at
> position 2
>
> [124071.055473] device-mapper: raid: New device injected into existing array
> without 'rebuild' parameter specified
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
> vgreduce --removemissing --force vgPecDisk2 #works, alerts me about rimage
> and rmeta LVS
>
>
>
> vgchange -ay vgPecDisk2 #works but LV isn't active, only rimage and rmeta LV
> show up.
>
>
>
> So how to safely remove soon-to-be-bad-drive and insert new drive to array?
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
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
esta es mi vida e me la vivo hasta que dios quiera
