Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5KKUxB8012284
	for <linux-lvm@redhat.com>; Tue, 20 Jun 2006 16:30:59 -0400
Received: from will.fastenal.com (will.fastenal.com [205.243.112.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5KKUr0o029807
	for <linux-lvm@redhat.com>; Tue, 20 Jun 2006 16:30:53 -0400
Message-ID: <44985AF7.20704@fastenal.com>
Date: Tue, 20 Jun 2006 15:30:47 -0500
From: Kelly Sauke <ksauke@fastenal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 Error when creating snapshot
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




I get this error whenever I create a bunch of snapshots.  I have 36 filesystems
in my vg.  If I walk through them creating a snapshot on each one, the last 4
fail.  They fail with the below error.  I did the order backwards and got the
same results so its not dependant on the lv I'm snapshotting, it appears to be
dependant upon the number of snapshots I'm creating.


/usr/sbin/lvcreate -L 1G -p r -s -n save_perpet2-20060619161740
/dev/svg/save_perpet2lv
  device-mapper: reload ioctl failed: Cannot allocate memory
  Failed to suspend origin save_perpet2lv



It creates the snapshot devices in /dev/mapper.

ls -l /dev/mapper/svg-save_perpet2--20060619161740*
brw-rw----  1 root disk 253, 159 Jun 20 15:19
/dev/mapper/svg-save_perpet2--20060619161740
brw-rw----  1 root disk 253, 158 Jun 20 15:19
/dev/mapper/svg-save_perpet2--20060619161740-cow

but it doesn't create any devices in /dev/svg.


It also is available to query with lvdisplay.

lvdisplay /dev/svg/save_perpet2-20060619161740
  --- Logical volume ---
  LV Name                /dev/svg/save_perpet2-20060619161740
  VG Name                svg
  LV UUID                oP2nDj-aa7p-dS3Q-4VdH-gk8r-x5C8-Akg78K
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                1.00 GB
  Current LE             256
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:159

I can't do anything with that volume other than remove it though.



I'm running RHEL 4 U 3 with the beta hugemem kernel installed.  I installed the
beta kernel as the request of redhat support.

device-mapper-1.02.02-3.0.RHEL4
udev-039-10.12.EL4
kernel-hugemem-2.6.9-39.EL

Any insight would be appreciated.
