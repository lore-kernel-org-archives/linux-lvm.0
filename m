From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] hello sir
Message-Id: <20020406125516.GA27677@tiger.bigcats.invalid>
References: <20020406183800.5697.qmail@eyou.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020406183800.5697.qmail@eyou.com>
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
Date: Sat Apr  6 06:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@sistina.com

Hello!

seaward@eyou.com (seaward@eyou.com) wrote 32 lines:

>     Two:after creating /dev/hda3 and changing it to type 0x8e by fdisk,why
> does pvcreate say it is a invalid partition?

To be able to read in the patition table of a HD in *all*
cases, the complete HD must be completely umounted.  No Swap,
no /-partition, nothing may be in use or just allocated.

Otherwise it will work in some cases but not in other cases,
and if you are very unlucky, you could lose data.  (But then,
if you can create partitions, you can also run
dd if=/dev/zero of=/dev/hda)

> But pvcreate can process it after reboot the system.

This happens eg. during the boot process, so rebooting can
be needed there, if you have a single-HD-system and are not
running completely from the ramdisk.

> However, it is ok for a existing partition(needn't create
> but need change type).

In this case, it seems, your kernel had the good luck of
picking up the change, even without completely umounting and
de-allocating the HD.

At least, that's my best understanding based on personal
experience and discussion on several mailing lists.

-Wolfgang
