Message-ID: <39D06FB7.14535FE3@hananet.net>
Date: Tue, 26 Sep 2000 18:43:19 +0900
From: nalabi <nalabi@hananet.net>
Reply-To: nalabi@hananet.net
MIME-Version: 1.0
Subject: [linux-lvm] hi
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,

initrd.gz make not create.

How can make initrd.gz


------------->

nalabi:/home/nalabi/lvm-0.8i# lvmcreate_initrd

Logical Volume Manager 0.8 by Heinz Mauelshagen  06/08/1999

lvmcreate_initrd -- this script creates a LVM initial ram disk in
/boot/initrd.gz

lvmcreate_initrd -- making ram filesystem
umount: /dev/ram1: not mounted
/sbin/lvmcreate_initrd: freeramdisk: command not found
Bye bye...

lvmcreate_initrd -- ERROR making ram disk filesystem
