Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with SMTP id iBE3Ovf09706
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 22:24:57 -0500
Received: from mail.stabat.com (dsl-210-15-214-74.VIC.netspace.net.au
	[210.15.214.74])
	by mx2.redhat.com (8.12.11/8.12.11) with SMTP id iBE3WOvV027318
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 22:33:00 -0500
Received: from amavis by mail.stabat.com with scanned-ok (Exim 3.35 #1
	(Debian)) id 1Ce3GW-00025a-00
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2004 14:22:20 +1100
Received: from juno ([10.0.0.79])
	by mail.stabat.com with esmtp (Exim 3.35 #1 (Debian))
	id 1Ce3GV-00025Q-00
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2004 14:22:19 +1100
Message-ID: <41BE5C6B.80404@stabat.com>
Date: Tue, 14 Dec 2004 14:22:19 +1100
From: Lucas Barbuto <lucas@stabat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Strange LVM2 on RAID Behaviour
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi All,

I'm having a weird problem with LVM2 on top of Linux software RAID-1.
I've installed Debian Sarge recently, using the new Debian Installer and
I've configured it with LVM2 on top of RAID-1.

I'm running the 2.6.8-1 kernel from the Sarge installer with their
initrd.  I've got two 80GB SATA hard drives, partitioned as in [1].
I've got /boot on it's own RAID-1 device (md0 = sda1 + sdb1), becuase
GRUB didn't support kernel on an LV (and still doesn't without patches
AFAIK).  Then I've got md1 (= sda2 + sdb2) and md2 (= sda3 + sdb3)
combined to for a volume group, vg0.  Then I've got md3 (= sda4 + sdb4)
which is used by vg1.  I've created all my logical volumes including
root and swap in vg0.  In vg1 I've got a single LV using up the entire VG.

So here's the problem:  When I boot my system, everything works great,
except that md3 comes up degraded, missing sda4.  dmesg contains the
following:

> devfs_mk_dir: invalid argument.<4>devfs_mk_dev: could not append to parent for /disc

repeated 112 times right at the top (I don't think this has anything to
do with it, but I don't know), and:

> md: md3 stopped.
> md: bind<sdb4>
> md: could not lock unknown-block(8,4).
> md: md_import_device returned -16
> raid1: raid set md3 active with 1 out of 2 mirrors
> md: md0 stopped.
> md: bind<sdb1>
> md: bind<sda1>
> raid1: raid set md0 active with 2 out of 2 mirrors

It doesn't mention md1 and md2.  When I try to hot-add sda4 into md3 I
get more "could not lock" errors:

> lbarbuto@saturn:~$ sudo mdadm /dev/md3 -a /dev/sda4
> md: trying to hot-add unknown-block(8,4) to md3 ...
> md: could not lock unknown-block(8,4).
> md: md_import_device returned -16

If I remove the LV from vg1, I can now hot-add the RAID member device
back in and it happily starts syncing.

So, I'm obviously not an expert on this stuff, but I assume that LVM is
scanning devices on boot and taking over sda4 before the RAID starts.
So I tried adding a filter to /etc/lvm/lvm.conf:

> filter = [ "a|^/dev/md|", "r|.*|" ]

To ignore all but md devices --- this makes no difference.  So now I am
stuck and I don't know what else to try.  Can someone give me some
advice?  This is the third list I've tried posting on, sorry if you've
read this before.

[1] partitions

> lbarbuto@saturn:~$ cat /proc/partitions
> major minor  #blocks  name
> 
>    8     0  117220824 sda
>    8     1      32098 sda1
>    8     2   39062047 sda2
>    8     3   39062047 sda3
>    8     4   39062047 sda4
>    8    16  117220824 sdb
>    8    17      32098 sdb1
>    8    18   39062047 sdb2
>    8    19   39062047 sdb3
>    8    20   39062047 sdb4
>    9     1   39061952 md1
>    9     2   39061952 md2
>    9     0      32000 md0
>    9     3   39061952 md3
>  253     1    4194304 dm-1
>  253     2    4194304 dm-2
>  253     3    1048576 dm-3
>  253     4    4194304 dm-4
>  253     5    2097152 dm-5
>  253     6    4194304 dm-6
>  253     7   16777216 dm-7
>  253     8   16777216 dm-8
>  253     9   24641536 dm-9

Thanks,

-- 
Lucas
