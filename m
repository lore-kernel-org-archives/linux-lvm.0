Date: Mon, 25 Sep 2000 16:52:40 -0700 (PDT)
From: Tim Pepper <tpepper@opensales.com>
Subject: [linux-lvm] lv not persistent across reboot?
Message-ID: <Pine.LNX.4.21.0009251623060.25906-100000@tp.sf.opensales.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I've set up a little test machine to play with lvm.  It's running RedHat 6.2
with a 2.4-test8 kernel and lvm 0.8.

I've successfully created and used an lv (with a reiserfs filesystem on top
of it).  My problem is that when I reboot the lv is gone.  vgscan finds
nothing.  pvdisplay, lvdisplay and vgdisplay likewise show nothing.  If I go
through the steps though to recreate the lvm, pvcreate seems to think
something's there and wants me to do a '-ff'.  I can then continue on.

Playing around I see:

	[root@qalab5 /root]# umount /mnt/nz
	
	[root@qalab5 /root]# lvdisplay /dev/netzero/big 
	--- Logical volume ---
	LV Name               /dev/netzero/big
	VG Name               netzero
	LV Write Access       read/write
	LV Status             available
	LV #                  1
	# open                0
	LV Size               34.18 GB
	Current LE            8750
	Allocated LE          8750
	Allocation            next free
	Read ahead sectors    120
	Block device          58:0
	
	[root@qalab5 /root]# vgscan
	vgscan -- reading all physical volumes (this may take a while...)
	vgscan -- no volume groups found

	[root@qalab5 /root]# lvdisplay /dev/netzero/big 
	lvdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
	vgscan

	[root@qalab5 /root]# vgscan
	vgscan -- reading all physical volumes (this may take a while...)
	vgscan -- no volume groups found
	
	[root@qalab5 /root]# mount /mnt/nz

I can't seem to display it, but it does remount here.

I was thinking that maybe the 'vgchange -a n' shouldn't be done or perhaps I
was doing it at the wrong time (at shutdown after the filesystem on the lv was
umounted), but the above seems flakey even without vgchange in the picture.

Any ideas what could be going on?  Thanks in advance for any help.

Tim

--
*********************************************************
*  tim.pepper@opensales dot com     * Venimus, Vidimus, *
*  http://www.opensales.com         * Dolavimus         *
*********************************************************
