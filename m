MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E18fePh-0001Zk-00@gw.pe1mhp.ampr.org>
From: "Jan H. van Gils" <janvg@vgnet.nl>
Subject: [linux-lvm] Re:cramfs ramdisk and rootfs on LVM
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
Date: Mon Feb  3 05:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

	Hi,

I tryed the options Francis gave to me but it doesn't work.

Here is my linuxrc file:

#!/bin/sh
/sbin/modprobe lvm-mod
/bin/mount -t tmpfs none /etc
/bin/mount -t proc none /proc
/bin/mount
echo "Scanning for Volume Groups ..."
/sbin/vgscan
echo "Activating Volume Groups ..."
/sbin/vgchange -a y
/bin/umount /proc
/bin/umount /etc

What is wrong in this file.
The thing that I see, is that the /bin/mount option doesn't show me any mounted file
systems. So /etc is not mounted with a tmpfs file system.

Jan 
-- 
With regards Jan H. van Gils
Internet web-page http://www.VGNet.NL/
Internet e-mail address JanVG@VGNet.NL
RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE
