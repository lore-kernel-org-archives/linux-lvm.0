Return-Path: <tomcosimano@home.com>
Message-ID: <3B401947.385A1472@home.com>
Date: Mon, 02 Jul 2001 01:48:39 -0500
From: Tom Cosimano <tomcosimano@home.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM kernel patch request
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm running Redhat 7.1 kernel vmlinux-2.4.2-2smp.  I have tried a number
of times and can only conclude that I'm missing some step(s).
I have downloaded and installed the following RPMs from
ftp://ftp.sistina.com/pub/LVM/binaries/redhat/0.9.1_beta in the order:

1) lvm-base-1.1-1.i386.rpm
rebooted
2a) lvm-iop10-0.9.1_beta7-1.i386.rpm
2b) lvm-iop10-lib-0.9.1_beta7-1.i386.rpm
3) lvm-iop10-man-0.9.1_beta7-1.i386.rpm
4) lvm-iop10-patchgen-0.9.1_beta7-1.i386.rpm
rebooted

Per the instructions in the LVM HOWTO section 7.4
I edited the /etc/rc.d/rc.sysinit to add the following lines:

/sbin/vgscan
/sbin/vgchange -ay

and the file /etc/rc.d/init.d/halt with the following line

/sbin/vgchange -an

I boot my system using PowerQuest BootMagic and enter my Redhat
Partition.
As Linux is booting and the vgscan is executed I see the following error
message:

vgscan
lvmiopversion -- LVM driver/module not loaded?

vgscan: /lib/lvm-iop not found.  Is lvm-iop installed?

I get the same message if I try to run vgscan after logging in and the
same or similar message from any vg command.

Also when I run lsmod, I do not see LVM listed and it is not under
/proc.

I verified the install of all five rpm(s) and do not understand what I
may be doing wrong.

I can only conclude that it is not loading and I'm missing something.

Please HELP

Thanks
Tom
