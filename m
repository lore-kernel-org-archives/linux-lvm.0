Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5SF315A019664
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 11:03:01 -0400
Received: from mail.touchtunes.com (mail.touchtunes.com [207.96.182.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5SF2pnX005456
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 11:02:52 -0400
Received: from [192.168.0.138] (unknown [192.168.0.138])
	by mail.touchtunes.com (Postfix) with ESMTP id 1A6D015AF4
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 11:02:47 -0400 (EDT)
Message-ID: <44A29C60.8020709@gnome.org>
Date: Wed, 28 Jun 2006 11:12:32 -0400
From: Tristan Van Berkom <tvb@gnome.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030603000800000003010005"
Subject: [linux-lvm] vgscan --force-all-update-reread-and-take-that-kernel
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------030603000800000003010005
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello lvm folks,
     Before I give you the whole shpiel... the issue I am having here
is that vgscan is unable to find an existing volume group after
a repartitioning of the disk using 'parted' (hence the subject line that
implies that vgscan needs an option to slap the kernel a little harder
in some cases).

     I am using lvm to automaticly extend a logical partition
to span the "rest of the harddisk", in the case that there are
some unused gigs on the disk.

I've written a little script (which I'll attach here) that
basicly:
     - Resizes the extended partition
     - Creates a new logical partition in the newly allocated space
       inside the extended partition
     - Creates a new "physical volume" on the new partition
     - Adds the new "physical volume" to the already existing "volume group"
     - Extends the "logical volume" to span the entire "volume group"

The script works fine it you type it all out by hand in the shell and
wait a few secs and repeatedly check vgscan to see if its back up,
when I run the script... I get:

 From when I first issue a vgscan:
=================================
   Reading all physical volumes.  This may take a while...
   No volume groups found

 From my next call to pvcreate:
==============================
   Couldn't find device with uuid 'HAkK8E-D3CS-87kk-GtL0-6ZGC-1NKI-x65WQg'.
   Couldn't find all physical volumes for volume group massgaol.
   Couldn't find device with uuid 'HAkK8E-D3CS-87kk-GtL0-6ZGC-1NKI-x65WQg'.
   Couldn't find all physical volumes for volume group massgaol.
   get_pv_from_vg_by_id: vg_read failed to read VG massgaol
   Physical volume "/dev/hdb7" successfully created

Anyway, I guess at this point y'all know what I'm rambling on about...

please let me know what I'm doing wrong or what I could be doing
better :)

Cheers,
                             -Tristan



--------------030603000800000003010005
Content-Type: text/plain;
 name="jukebox_resize"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jukebox_resize"

#!/bin/bash

# This scrip makes some evil assumptions:
#
# o That the disk was partitioned as 120 Gigs
# o That the real disk size will be reported as numGB (in Gigs)
#   (i.e. this wont work if parted decides to display it in terabytes
#   or megabytes on some disks)
#

OUTPATTERN="Disk /dev/hdb: "
DISKOUT=`parted /dev/hdb print | grep "$OUTPATTERN"`

DISKSIZE=${DISKOUT#$OUTPATTERN}

echo "this disk size is $DISKSIZE"

echo "that would be ${DISKSIZE%GB} Gigs I think"

DISKGIGS=${DISKSIZE%GB}

if [ $DISKGIGS -gt 120 ]; then
	# Found a disk that is physically bigger than 120GB

	# Resize the extended partition to span till the end of the disk
	parted /dev/hdb resize 4 3208MB $DISKSIZE

	# Create /dev/hdb7 with the remaining disk space
	parted /dev/hdb mkpart logical 120GB $DISKSIZE

	# XXX massgaol dissapears here for a few secs....
	sleep 2
	vgscan

        # Give the system some time to create the fs nodes needed
        # to proceed
        sleep 5

	# Create a physical volume for 
	pvcreate -y -ff /dev/hdb7

	# Adding more ...
	sleep 2

        # Scan volume groups... needed to make 'massgaol' recognized
	# in the next step.
        vgscan

	# Add new physical volume to the volume group
	vgextend massgaol /dev/hdb7

	# Get the current size of the virtual group now...
	# (get the 12'th field, separated by ':').
	VGSIZE=`vgdisplay -c massgaol | cut -d : -f12`

	# Activate the group -- this creates /dev/massgaol/massgaolLV
	vgchange -ay 

	# Extend the logical volume to span the entire volume group
	lvextend /dev/massgaol/massgaolLV -L${VGSIZE}KB

	# Resize sometimes wants an fsck first.
	e2fsck -f /dev/massgaol/massgaolLV

	# Resize the overlying filesystem
	resize2fs /dev/massgaol/massgaolLV

        # deactivate the group for now
	vgchange -an

fi


--------------030603000800000003010005--
