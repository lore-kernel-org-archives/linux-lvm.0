From: jeff <jeff@gage.org>
Message-ID: <20030602143500.GC15252@gage.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Incorrect metadata area header checksum
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
Date: Mon Jun  2 09:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hi-

what does this error mean, and how do i rectify it? i have existing lvm
volumes on this box, but creating this big one (~350gb) on my new
software-raid5 array is giving me grief. i can mke2fs /dev/md2 just
fine, but when i try to install lvm2..:

root@cerulean:~# pvscan
  PV /dev/md1   VG raid1   lvm1 [15.65 GB / 0    free]
  Total: 1 [0   ] / in use: 1 [0   ] / in no VG: 0 [0   ]

root@cerulean:~# pvcreate /dev/md2
  Failed to read label on physical volume /dev/md2
  Physical volume "/dev/md2" successfully created

root@cerulean:~# vgcreate raid5 /dev/md2
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Volume group "raid5" successfully created

root@cerulean:~# vgdisplay raid5
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Volume group "raid5" doesn't exist

more info:

root@cerulean:~# uname -a
Linux cerulean 2.4.21-rc2-ac2 #1 Sun May 18 12:08:13 PDT 2003 i686 GNU/Linux

root@cerulean:~# egrep 'DEV_DM|DEV_LVM' /boot/config-2.4.21-rc2-ac2 
# CONFIG_BLK_DEV_LVM is not set
CONFIG_BLK_DEV_DM=y

root@cerulean:~# dpkg -s lvm2 | grep Version
Version: 1.95.15-1

root@cerulean:~# dpkg -s raidtools2 | grep Version
Version: 1.00.3-2

root@cerulean:~# cat /proc/mdstat 
Personalities : [raid1] [raid5] 
read_ahead 1024 sectors
md0 : active raid1 sdb1[1] sda1[0]
      976768 blocks [2/2] [UU]
      
md1 : active raid1 sdb3[1] sda3[0]
      16418752 blocks [2/2] [UU]
      
md2 : active raid5 sdd1[3] sdc1[2] hdc1[1] hda1[0]
      351654528 blocks level 5, 64k chunk, algorithm 2 [4/4] [UUUU]
      
unused devices: <none>

thanks,

jeff
