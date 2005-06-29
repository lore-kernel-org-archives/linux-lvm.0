Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5TH4lu09840
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 13:04:47 -0400
Received: from postfix1-c.free.fr (postfix1-c.free.fr [213.228.0.79])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5TH4b5M021531
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 13:04:37 -0400
Received: from postfix3-1.free.fr (postfix3-1.free.fr [213.228.0.44])
	by postfix1-c.free.fr (Postfix) with ESMTP id F20D3F19F6C
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 18:59:05 +0200 (CEST)
Received: from lns-vlq-18f-81-56-213-72.adsl.proxad.net (unknown
	[81.56.213.72])
	by postfix3-1.free.fr (Postfix) with ESMTP id 7DC39173568
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 18:58:58 +0200 (CEST)
From: Marc Cousin <cousinmarc@free.fr>
Subject: Re: [linux-lvm] Issues with md RAID-1, LVM, and snapshots
Date: Wed, 29 Jun 2005 19:00:14 +0200
References: <4244A203.2050304@eorbit.net>
In-Reply-To: <4244A203.2050304@eorbit.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200506291900.14672.cousinmarc@free.fr>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I've got exactly the same problem here. Raid1(md)+LVM2 (2.6.11, Xen Domain0), 
can't snapshot correctly. In dmesg, I've got :

attempt to access beyond end of device
dm-30: rw=0, want=1905355624, limit=1228800
attempt to access beyond end of device
dm-30: rw=0, want=1905357216, limit=1228800
attempt to access beyond end of device
dm-30: rw=0, want=8390664, limit=1228800

As soon as I remove the Raid1, the problem disappears.

Is it a known problem ? Is there a workaround ?

On Saturday 26 March 2005 00:42, Kevin Murphy wrote:
> I'm having trouble with snapshot volumes when combining software RAID-1
> with LVM2 striping.
>
> I have a server with four 18GB drives. I would like to combine them into
> two RAID-1 mirrors and then stripe across them with LVM, with the  goal
> of data redundancy and the ability to make hot backups via snapshots.
>
> System:
> Suse Linux Enterprise Server 9 for x86_64
> kernel 2.6.5-7.147-smp
> lvm2-2.00.15-0.8
>
> When I set up the drives in one big volume group (no RAID), snapshots
> work correctly:
>
> pvcreate /dev/sdc1
> pvcreate /dev/sdd1
> pvcreate /dev/sdf1
> pvcreate /dev/sde1
> vgcreate -M2 vg1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1
> lvcreate -i4 -I64 -L32G -n lv1 vg1
> mkfs.ext2 /dev/vg1/lv1
> mount /dev/vg1/lv1 /mnt/bigdisk
> {put some data in /mnt/bigdisk}
> lvcreate -L1G -s -n snap1 /dev/vg1/lv1
> mount /dev/vg1/snap1 /mnt/backup
> find /mnt/backup | cpio -ovHnewc > /tmp/backup.cpio
>
> This works fine. However, if I set up two RAID-1 volumes and stripe
> across them with LVM, I get errors when reading from a snapshot:
>
> mdadm --create -l1 -n2 /dev/sdc1 /dev/sdd1 /dev/md2
> mdadm --create -l1 -n2 /dev/sde1 /dev/sdf1 /dev/md3
> pvcreate /dev/md2
> pvcreate /dev/md3
> vgcreate -M2 vg1 /dev/md2 /dev/md3
> lvcreate -i2 -I64 -L32G -n lv1 vg1
> mkfs.ext2 /dev/vg1/lv1
> mount /dev/vg1/lv1 /mnt/bigdisk
> {put some data in /mnt/bigdisk}
> lvcreate -L1G -s -n snap1 /dev/vg1/lv1
> mount /dev/vg1/snap1 /mnt/backup
>
> I get this error:
> cpio: Read error at byte 2129920 in file /mnt/backup/file1, padding with
> zeros
>
> dmesg says:
> attempt to access beyond end of device
> dm-3: rw=0, want=17060337672, limit=67108864
> attempt to access beyond end of device
> dm-3: rw=0, want=134226096, limit=67108864
> attempt to access beyond end of device
> dm-3: rw=0, want=3499657224, limit=67108864
> attempt to access beyond end of device
> dm-3: rw=0, want=3094910976, limit=67108864
> attempt to access beyond end of device
> dm-3: rw=0, want=8894171864, limit=67108864
> attempt to access beyond end of device
> dm-3: rw=0, want=17060337672, limit=67108864
>
> When I extract the archive, file1 is corrupted.
>
> Is there any special magic that needs to be done with LVM+MD, or have I
> hit a bug?
>
> --
> Kevin Murphy
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
