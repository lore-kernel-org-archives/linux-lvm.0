Return-Path: <urs@isnogud.escape.de>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 01 Jun 2001 06:54:00 +0200
Message-ID: <m2bso894wn.fsf@isnogud.escape.de>
Subject: [linux-lvm] changing SCSI IDs ?
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

Will my LVs continue to work, if the device names and minor device
numbers of my SCSI disks change?

I have installed a new 9GB SCSI drive which will eventually replace
two of my older 4.3GB drives.  I want to make the new drive a single
PV.  This is roughly what I plan to do:

    pvcreate /dev/sdd1
    vgcreate vg0 /dev/sdd1
    lvcreate -n 0 vg0
    lvcreate -n 1 vg0
    ...
    
    mount /dev/vg0/0 /mnt
    tar clS -C / -f - . | tar xp -C /mnt -f -
    umount /dev/vg0/0
    
    mount /dev/vg0/1 /mnt
    tar clS -C /usr -f - . | tar xp -C /mnt -f -
    umount /dev/vg0/1
    ...
    
    vi /etc/fstab	# change device names from /dev/sd... to /dev/vg0/...
    shutdown -h now

    remove /dev/sda and /dev/sdb, change SCSI IDs, so that
    the former sdd becomes sda and
    the former sdc becomes sdb.


Will this work?  Or will vgscan find a VG which uses the PV on
/dev/sdd1 as created with vgcreate?  This wouldn't work since
/dev/sdd1 is now /dev/sda1.


urs
