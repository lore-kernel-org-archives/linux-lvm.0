Message-Id: <200109160203.WAA10814@erez.physics.lsa.umich.edu>
From: dwchin@umich.edu
Mime-Version: 1.0
Date: Sat, 15 Sep 2001 22:03:57 -0400
Subject: [linux-lvm] pvcreate dumping core with 2.4.10-pre9
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I just downloaded linux-2.4.9, patched it to 2.4.10-pre9, applied the 
lvm-1.0.1-rc2 patches, made kernel, made modules, made modules_install, 
reboot with new kernel, made lvm tools, installed lvm tools.   

I did "mkreiserfs /dev/hdd1", used fdisk to change the partition type to 
"Linux LVM", and then, without mounting the partition, followed the HOW-TO: 
everything works OK (pvcreate, vgcreate, vgchange) except that lvcreate 
dumps core.

Any clues for a Linux newbie?

Thanks in advance,
--Dave Chin
