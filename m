Return-Path: <pascal_heger@hotmail.com>
From: "Pascal Heger" <pascal_heger@hotmail.com>
Date: Sun, 08 Jul 2001 13:34:23 +0200
Mime-Version: 1.0
Message-ID: <F2153oryKFRJrzdDW6l00000349@hotmail.com>
Subject: [linux-lvm] pvscan - - invalid i/o protocol version
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I'm new to LVM, and desperate to get it working on a 3 disk linux box.
I'm running Kernel version 2.4.6, and installed the binary 'RedHat' version 
8.1 of LVM.
I have compiled the kernel with LVM as a module, and everything seems to 
work fine at bootup (/proc/lvm is there).
The module is loaded at bootup, and i put the vgscan and vgchange scripts in 
rc.sysinit.

I have changed the partition type of hdb, and hdc to 0x8e. But when i try to 
run pvcreate /dev/hdb1 i get:

pvcreate - - ERROR: "/etc/lvmtab" doesn't exist; please run vgscan.

And when i run vgscan:

vgscan - - invalid i/o protocol version

What did i do wrong? Did i install the wrong version of LVM?
Any help will be greatly appreciated.

Pascal.
_________________________________________________________________________
Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.
