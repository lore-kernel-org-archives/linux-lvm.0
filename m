Subject: Re: [linux-lvm] [PATCH] writeable snapshots -> Sample useful app
References: <Pine.LNX.4.02.10111191450430.23844-100000@murnau.science-computing.de>
From: Michel Dagenais <michel.dagenais@polymtl.ca>
In-Reply-To: Anselm Kruis's message of "Mon, 19 Nov 2001 20:07:05 +0100 (CET)"
Message-ID: <m2y9l28hl3.fsf@m3.polymtl.ca>
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
Date: Mon Nov 19 17:22:02 2001
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Writable snapshots are very versatile and may be used for several
interesting applications. IMHO they should be included in LVM!

One such application is to clone a machine, for instance when adding
a new machine to a server pool. You may want an almost identical
machine except for a few config files. Of course you can export the
server disk, make a local copy on the new machine, and then change a
few config files. Copying a couple of Gig, however, takes time.
Here is another way:

# Create a logical volume

pvcreate /dev/hda1
vgcreate vg1 /dev/hda1
lvcreate -L 4G -n vol1 /dev/vg1

# This volume will be declared disk 0 of a RAID 1 setup, with disk1
# non-existant being declared faulty. The server root would be
# installed on that disk.

mkraid /dev/md0
mke2fs -b 4096 /dev/md0

# A writable snapshot is created such that the server is decoupled from
# the snapshot which will be used for clones

lvcreate -s -n vol1-snap1 -L 200M /dev/vg1
lvchange -p rw /dev/vg1/vol1-snap1

# Device /dev/vg1/vol1-snap1 is then exported using "network block device"
#
# When one needs a new computer installed, a boot disk with initial 
# ram disk initializes /dev/hda1 as failed disk1 of a RAID 1 setup. 
# The disk0 is the snapshot accessed by "network block device".

mkraid /dev/md0

# The local disk is brought back into the array

raidhotadd /dev/md0 /dev/hda1

# The snapshot is copied to the local disk while the cloned computer is
# immediately usable. Once the RAID synchronisation is finished, the
# snapshot used as network block device may be declared faulty and
# released.

I have actually tried it for a non root partition and it works fine!
