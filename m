Return-Path: <urs@isnogud.escape.de>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 27 Mar 2001 11:34:08 +0200
Message-ID: <m2g0fzsghb.fsf@isnogud.escape.de>
Subject: [linux-lvm] LVM, lilo and MBR?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I think this was asked on this list before but I couldn't find it
anymore.

I would like to make my 3 SCSI harddisk drives into PVs without
partitioning them, i.e.

    pvcreate /dev/sda; pvcreate /dev/sdb; pvcreate /dev/sdc

But I need the MBR on /dev/sda to boot the system and I want to use
lilo.  Thus, I have 2 questions:

1. Is the first sector of a PV volume use by LVM or can I pvcreate
   /dev/sda and still use the MBR of /dev/sda to boot the system?
   Where does the VGDA start and how large is it?

2. IIRC, someone had a patch for lilo to load the kernel and initrd
   image from a LV.  Where can I get it?  And will it go into the
   standard lilo package?

These questions should probably go into the FAQ.


urs
