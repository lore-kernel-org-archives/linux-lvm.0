Return-Path: <jamesp@foobarhouse.com>
Date: Thu, 26 Jul 2001 12:23:32 +0100 (BST)
From: James Pattinson <jamesp@foobarhouse.com>
Message-ID: <Pine.LNX.4.33.0107261218290.1277-100000@greebo.foobarhouse.com>
MIME-Version: 1.0
Subject: [linux-lvm] success!
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

I've just upgraded my LVM-on-root system from beta7 to beta8 succesfuly. I
only had two problems:

1.	The lvmcreate_initrd script failed when it tried to mount the
image in /tmp as a loopback device. The error was ioctl: LOOP_SET_FD:
Invalid argument. I believe this is due to my /tmp filesystem being tmpfs
and could be a kernel bug. It worked OK when I used /root instead of /tmp.

2.	The pvversion failure as documented in my previous emails.

Thanks to Heinz and everyone working on LVM to help my linux box look more
like an HP :)

Regards

James
