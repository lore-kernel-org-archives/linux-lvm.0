Return-Path: <julien@atix.de>
Message-ID: <3B5D127D.E932FDD1@atix.de>
Date: Tue, 24 Jul 2001 08:15:25 +0200
From: Julien Baboud <julien@atix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pb with pvcreate and partition tables
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

hi,

 I use LVM with the 0.9 beta 7 on a SuSE 7.1 distrib and
 i've encoutered a pb with pvcreate on a partition that is set to the
LVM type (and was another type before, which is the source of the pb).
Here is
the output of the command i used :

 %pvcreate /dev/hda16 

 pvcreate -- device "/dev/hda16" has a partition table 
 pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--yes]
         [-v|--verbose] [-V|--version] PhysicalVolume
[PhysicalVolume...]


and the -f option show me the same output.

 I don't know if it's a pb with LVM or with fdisk wich i use to set the
type of the partitions, but i would appreciate if any could tell me a 
solution to correct this.


 tanx.
 julien, for ATIX

 join the LVM Republic
------------------------
