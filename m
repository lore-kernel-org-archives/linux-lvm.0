From: mfusco@calpoly.edu
Message-Id: <H0004a6d101c8ca3.1043106948.seurat.artisan.calpoly.edu@MHS>
MIME-Version: 1.0
Content-Disposition: inline
	;Creation-Date="Mon, 20 Jan 2003 15:55:48 -0800"
	;Modification-Date="Mon, 20 Jan 2003 16:01:21 -0800"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Lilo Defvs and Root Raid1, Having trouble booting
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
Date: Mon Jan 20 18:01:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Need help please!

   Here is my current system.
   /boot is a md0 raid1 mirrored over 4 scsi disk, host0 target9, h0t10, h1t9, 
h1t10.
   / is a md11 raid1 mirrored over the same four disks.
   md0 is part1 and md11 is part2
   my lilo has the option for raid-????-boot=mbr-only and LILO does load the 
kernel.

   heres the problem.  raidautostart /dev/md0 failed kernel unable to mount 
root directory 09:00.  I have tried to make a initrd with --preload raid1 and -
-with=raid1 but still no luck.  also unzip my initrd and looked in the /dev 
only entry was md0 which was a symbolic link to md/0.  Tried to mknod the 
files, sda, sdb... sda1, sda2, ... and md0, md11 and still no luck?

Please any ides would be really helpful

Michael

   
