Return-Path: <cottin@free.fr>
Message-ID: <000501c0d319$453cceb0$01a8a8c0@jeckel>
From: "Lionel Cottin" <cottin@free.fr>
Date: Wed, 2 May 2001 17:05:05 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Root LVM + ReiserFS
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
To: LVM <linux-lvm@sistina.com>

Hi all,

I'm setting a RH 7.1 Linux box with kernel 2.4.4 + LVM 0.9.1beta7 + ReiserFS
3.x.0j and I have some trouble to boot from LVM volume ;(

I think my kernel is Ok, cause i can mount LVM/ReiserFS volume and the
ramdisk made by lvmcreate_initrd with no problems at all.
Besides, when i mount the ramdisk, i can see the correct /dev entries....

But when i try to boot on a LVM root device with a reiserFS filesystem, i
have an error like:
VFS unable to mount device xx:xx

And the system hangs up...

Here is my lilo.conf:

boot=/dev/sda
map=/boot/map
install=/boot/boot.b
prompt
timeout=50
message=/boot/message
default=custom
image=/boot/vmlinuz-2.4.2-2
        label=linux
        initrd=/boot/initrd-2.4.2-2.img
        read-only
        root=/dev/sda6

image=/boot/custom
        label=custom
        read-only
        root=/dev/sda6

image=/boot/custom
        label=custom2
        append = "ramdisk_size=8192"
        initrd=/boot/initrd-lvm-2.4.4.gz
        read-only
        root=/dev/rootVG/rootVOL

Any ideas???
Your help will be very appreciated ;)

Regards,
Lionel
