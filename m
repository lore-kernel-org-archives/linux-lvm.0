Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i29H4V811506
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 12:04:31 -0500
Received: from shell.blacknet.de (shell.blacknet.de [80.254.131.106])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i29H4UST007670
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 12:04:30 -0500
From: Goetz Bock <bock@blacknet.de>
Message-ID: <20040309165824.GC5481@shell.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] accessing devfs vg on non-devfs system
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  9 16:50:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

this looked like a FAQ to me, but apparently it's not. (neither google,
a manual search of the archive on redhat.com (the automatic search is
still down) nor in my personal archive revieled anything).

I've a disk, that used to be in a devfs enabled 2.4.20 (or so) with LVM
1.0.x (some small number). The disk has one partition (/dev/sda6) that
used to be the on and only PV of a VG. The new box is running 2.4.23
with LVM 1.0.8 without devfs.

Unfortunately the VG was not exported on the original box (which does not
exist anymore). But pvdisplay looks very ok.

My question how do i get to the VG? vgscan does not detect anything,
vgimport does not touch the PV (it's not exported), vgcreate complains
the PV is not unused.

Any pointers welcome.
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
