From: Xavier Brouckaert <xbr@info.ucl.ac.be>
Message-Id: <1071837164.7460.37.camel@Chimay.bugfactory.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 2.4 LVM1 devfs  -> 2.6.0 LVM2 udev
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
Date: Fri Dec 19 06:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

As the 2.6.0 is out, it's time for me to see if I can switch to it.
What is the procedure and the things to know to switch from a 2.4 LVM1
devfs to a 2.6 LVM2 udev ?  I'm using a debian/unstable.  I've seen that
there was a package lvm2 (2.00.08-3) but the comment contains at the end
"requires Linux kernel 2.4.". Does this mean that this package really
cannot handle 2.6 kernels ?

I've also seen that devfs has been obsoleted by udev. However, I didn't
find a udev package for sid nor a kernel option for it (but I've read
that it is only in userspace).  The udev FAQ
(http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev-FAQ) does not
mention if I need to install hotplug to have udev working.

Do I have to change something in /etc/lvmtab.d and /etc/lvmconf ?

It seems that a thing called "device-mapper" is needed, but I couldn't
find it in the kernel. Is it CONFIG_DM_IOCTL_V4 ? The "DM" substring
makes me think it's that but the comment in "make menuconfig" doesn't
say that it's for LVM nor that it's a device mapper.

Thanks !
Xavier
