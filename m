Return-Path: <tv@rz-zw.fh-kl.de>
Date: Wed, 30 May 2001 14:33:40 +0200 (MET DST)
From: Timo Veith <tv@rz-zw.fh-kl.de>
Message-ID: <Pine.GSO.4.33.0105301150450.9306-100000@zuse>
MIME-Version: 1.0
Subject: [linux-lvm] ERROR pv_move_pe()
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

Hi all!

We have a Red Hat Linux system with kernel 2.4.3 using LVM 0.9.1 beta7.
There is one VG defined with 6 PVs. We added another hard disk to the
VG, trying to replace a smaller PV by using pvmove. The pvmove command
failed after a long run with the following error message:

root@host[~] pvmove /dev/hdd1
pvmove -- moving physical extents in active volume group "vg00"
pvmove -- WARNING: if you lose power during the move you may need to
restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- ERROR reading input physical volume "/dev/hdd1" (still 65536 bytes to read)

pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe

pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

TH output of pvdisplay /dev/hdd1 shows that there is only one PE left
to move away from /dev/hdd1. We've tried to change the state of the
VG from active to inactive and from the LV also. Even with the
filesystem (reiserfs) mounted or unmounted the same error message
appears.

Where is this error message coming from, how can we solve this
problem?

What happens if we just reduce the VG by /dev/hdd1 although there is
still one PE of the VG on it?


Thanks in advance for any help.

Regards,


     Timo
