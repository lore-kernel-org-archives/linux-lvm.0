Return-Path: <tgs@iafrica.com>
From: "Theo" <tgs@iafrica.com>
Date: Wed, 11 Jul 2001 20:33:14 +0200
Message-ID: <FDEJIMPDHJAAPNLFKBMGAECACEAA.tgs@iafrica.com>
Subject: [linux-lvm] syslogd reports:  kernel: lvm -- lvm_chr_ioctl: unknown command 4004fe0a
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
Cc: volkerdi@slackware.com

Hello guys.

This is my first time using lvm.

After using pvcreate and vgcreate I rebooted and tried to activate the
volume group.

After the reboot I found the following in the kernel log:
Jul 11 19:40:52 alderaan kernel: LVM version 0.9.1_beta2  by Heinz
Mauelshagen (18/01/2001)
Jul 11 19:40:52 alderaan kernel: lvm -- Driver successfully initialized

Okay the driver is then in the kernel. No problem... later.... in the kernel
log:
Jul 11 19:40:53 alderaan kernel: lvm -- lvm_chr_ioctl: unknown command
4004fe0a

Same same error appears I run "vgchange"

I am a bit confused about this ?

I'm  using slackware 8.0 and I'm using the 2.4.5 kernel that comes with the
bare245.i image file.

Any ideas ?
