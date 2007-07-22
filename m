Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6MGoovF016988
	for <linux-lvm@redhat.com>; Sun, 22 Jul 2007 12:50:50 -0400
Received: from agave.telenet-ops.be (agave.telenet-ops.be [195.130.137.77])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6MGomWu032608
	for <linux-lvm@redhat.com>; Sun, 22 Jul 2007 12:50:48 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by agave.telenet-ops.be (Postfix) with SMTP id AF8DA67D75
	for <linux-lvm@redhat.com>; Sun, 22 Jul 2007 18:50:47 +0200 (CEST)
Received: from [10.9.8.142] (dD577696C.access.telenet.be [213.119.105.108])
	by agave.telenet-ops.be (Postfix) with ESMTP id 9CA9867D70
	for <linux-lvm@redhat.com>; Sun, 22 Jul 2007 18:50:47 +0200 (CEST)
Message-ID: <46A38AE6.3070805@emat.be>
Date: Sun, 22 Jul 2007 18:50:46 +0200
From: js <forums@emat.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Flexible storga: LVM setup on top of mdadm sets. Good
	idea or not?
Reply-To: forums@emat.be,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hi list,

I'm looking into making a home brewed nas setup. This is not a 
production, highly critical environment.

The result needs to be 1 continuous physical storage space.
Expandable without reformating, removing data, etc,..
Acceptable redundancy.
I don't mind 50% loss of data capacity because of raid 1.  Storage is 
(relatively) cheap.

I don't have this material to test.  So it's more like a theoretical setup.

I was thinking of creating sets of mdadm RAID 1 setups and unify these 
raid 1 devices with lvm2 into 1 big logical volume which is resizeable.
For example:
I have 4 identical 250 GB sata2 disks.

I use mdadm to create:

/dev/md0 raid1 consisting out of /dev/sda1 and /dev/sdb1.
/dev/md1 raid1 consisting out of /dev/sdc1 and /dev/sdd1.

Then I would like to:

create LVM physical volumes out of /dev/md0 and /dev/md1.
create a LVM volume group named storage consisting out of LVM physical 
device /dev/md0 and /dev/md1
create a LVM logical volume that covers the maximum size of the LVM 
volume group which should be around 500GB.
create a filesystem on this LVM logical volume such as ext3.

Now when I need more storage:

I add 2 250GB sata2 disks.
I create a new raid1 /dev/md2 consisting out of /dev/sde1 and /dev/sdf1
Create a LVM physical volume out of /dev/md2.
Add the /dev/md2 LVM physical volume to the LVM volume group.
expand the LVM logical volume so it becomes around 750GB in size.
resize the EXT3 filesystem.


Now my question to you is.  Is this completely bunkers?  Or is it 
reasonable?
Any tips, tricks, advice, comments welcome.

Thanks,

js
