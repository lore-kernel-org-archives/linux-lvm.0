Return-Path: <alciocca@ecetra.com>
Date: Mon, 18 Jun 2001 12:19:51 +0200 (CEST)
From: Adam Cioccarelli <alciocca@ecetra.com>
Message-ID: <Pine.LNX.4.33.0106181211400.22455-100000@vie-ac.office.ecetra.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM and lilo
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

Hi,

I am pretty new to LVM on Linux and have just set up a disk using LVM but
I am having problems with lilo. I have the following setup. I have my
/boot partition on /dev/hda1 which is not using LVM and the rest of my
partitions including root on /dev/hdb3 which is basically the whole of my
second disk. I used my Linux installation on /dev/hda4 to set up the LVM
installation, made the compressed image and modified lilo.conf in the new
root partition. Then I did a lilo -C on the new lilo.conf and rebooted.
Everything went fine but now I would like to modify my lilo.conf and all I
get is; Fatal: Sorry, don't know how to handle device 0x3a00

Any ideas?

I am using LVM 0.9.1_beta6 and LILO version 21.7-5

Otherwise I love LVM!

Ciao,

Adam Cioccarelli
