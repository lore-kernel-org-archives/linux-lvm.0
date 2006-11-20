Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAKILsgO009143
	for <linux-lvm@redhat.com>; Mon, 20 Nov 2006 13:21:54 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAKILhHY026732
	for <linux-lvm@redhat.com>; Mon, 20 Nov 2006 13:21:44 -0500
Date: Mon, 20 Nov 2006 19:21:37 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] my PV's disappearing
Message-ID: <20061120182137.GC18439@percy.comedia.it>
References: <20061114170723.GE30653@agk.surrey.redhat.com>
	<20061114175622.90848.qmail@web51005.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061114175622.90848.qmail@web51005.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Nov 14, 2006 at 09:56:22AM -0800, Richard Mollel wrote:
>
>Just before i sent this out...i saw this thread::
>https://www.redhat.com/archives/linux-lvm/2005-May/msg00032.html
>
>And that was exactly my problem!! Not sure why!!
>I have now been able to perform::
>losetup /dev/loop0 /dev/sdb
>losetup /dev/loop1 /dev/sdc
>losetup /dev/loop2 /dev/sdd
>
can you please clarify if you are really using whole disks or did you by
chance partition the devices.
the message you cite was the fix for someone that did partition the disk
after creating the PVs and filling LVM with data.

if the device holds a partition table lvm commands will ignore the
whole disk and try to find an LVM label on the partition.
the loosetup trick will fool lvm tools (loop device are not
partitionable)

>and, performed : vgchange -a y
>(it complained of duplicate uuid's, recreated on
>sdb1,sdc1 and sdd1 since pvcreate was complaining of
>/dev/sdb,sdc & sdd not found!)
pvcreate? did you pvcreate? on the partition?

>I have been able to mount my reiserfs, so i can
>continue with migration.
>Issue which i have to take up with Mandriva guys is
>why the failure all of a sudden? and do i need to be
>performing losetup everytime? My original
>configuration had used whole disks...
>

i did not see anything related to that on mandriva bugzilla, but in any
case if the issue is that the whole device was partitioned after lvm
creation there is not much i can do about it.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
