From: James W Anderson <jwa@mit.edu>
Message-ID: <20030424163942.GH12350@mit.edu>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] restoring volume group from file
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Apr 24 11:39:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I recently made a copy of an lvm partition to a file, using dd:

dd if=/dev/hde5 of=lvm-file bs=...

I would now like to mount this file, which contains a single volume
group, on a different machine.  Here is what I have done so far:

1) create a loopback device for the file

# losetup /dev/loop0 lvm-file

2) pvscan, detects the volume group

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/loop0" of VG "vg00" [23.45 GB / 3.20 GB free]
pvscan -- total: 1 [23.46 GB] / in use: 1 [23.46 GB] / in no VG: 0 [0]

3) Now, when I try to do vgcfgrestore, I get the following error:

# vgcfgrestore -n vg00 -f vg00.conf -o /dev/hde5 /dev/loop0
vgcfgrestore -- size of physical volume /dev/loop0 differs from backup


I tried passing the -i option to tell it to ignore the size
difference, and then it did create the volume group, but all of the
logical volumes are unusable---e2fsck cannot find the superblocks on
the filesystems.

Does anyone have any suggestions as to what I might try to get this to
work?  Any help would be tremendously appreciated.

Many thanks,
James
