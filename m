Message-Id: <5.2.0.9.2.20040202113058.02518690@mp3%hello.lv@hello.lv>
From: Martins Pukitis <mp3@hello.lv>
Mime-Version: 1.0
Subject: [linux-lvm] (no subject)
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
Date: Mon Feb  2 04:51:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello.
LVM doesn't work on my new kernel. The previous kernel was bare.i from 
Slackware 9.1 CD (2.4.22), without devfs support. I built the kernel with:
/dev filesystem support		Y
--------Automatically mount at boot	N
--------/dev/pts file system for...	N
Multi-device support (RAID and LVM)	Y
--------Multiple devices driver support		Y
--------RAID support		N  (I don' t need RAID)
--------Logical volume manager	Y

I have folder /dev/vg00 (my volume group) with files group, home, opt, tmp, 
usr, var.
I also have /proc/lvm directory, that contains an empty folder VGs and file 
global. Executing
cat global
displays
LVM driver	LVM version 1.0.5+(22/07/2002)
Total: 0 VGs, 0 PVs, 0 LVs (0 LVs open)
Global: 144 bytes malloced
IOP version: 10 0:22:07 active.

Logical volumes are not mounted.
With previous kernel they are.
