Return-Path: <mark@bobak.net>
Date: Sun, 24 Jun 2001 17:30:27 -0400 (EDT)
From: "Mark J. Bobak" <mark@bobak.net>
Message-ID: <Pine.LNX.4.33.0106241729370.4554-100000@bobak.net>
MIME-Version: 1.0
Subject: [linux-lvm] LVM configuration question....
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I just installed SuSE 7.2, I have the LVM configured, all storage is on
LVM except for '/'.  It's working great.  All storage is SCSI.  I have one
9GB drive that I did not configure, that I left data I wanted to save.
So, I've copied everything I want from there back on to the new running
system.  Now I want to add this disk to the Volume Group.  So, I deleted
the partitions on it w/ fdisk.  As I could read in the LVM whitepaper,
that's not good enough.  So, I did:

dd if=/dev/zero of=/dev/sdc bs=1k count=1

And that didn't work.  I noticed an (apparent) typo in the the whitepaper,
in that the comment made after the above command is "This command
overwrites the first 10k Bytes of a disk with zeros, deleting any
partition table."  Well, since the command specifies bs=1k and count=1, I
suspect it only overwrites 1k.  So, I tried w/ 'bs=10k count=1', 'bs=1k
count=10', and even 'bs=100k count=1'.  All with the same results.  When I
try to run 'pvcreate', I get:

# pvcreate /dev/sdc
pvcreate -- device "/dev/sdc" has a partition table

pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--yes]
        [-v|--verbose] [-V|--version] PhysicalVolume [PhysicalVolume...]


So, can anyone offer me a clue as to the problem?

Thanks,

-Mark
