Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o67DX5hq002976
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2010 09:33:05 -0400
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o67DWoY6002381
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2010 09:32:51 -0400
Received: by bwz1 with SMTP id 1so5146639bwz.33
	for <linux-lvm@redhat.com>; Wed, 07 Jul 2010 06:32:49 -0700 (PDT)
MIME-Version: 1.0
Sender: zoobab@gmail.com
Date: Wed, 7 Jul 2010 15:32:49 +0200
Message-ID: <AANLkTilPQsBnVh_bSQE9CsTcswDX89_H8_Ea-5SWcBaW@mail.gmail.com>
From: Benjamin Henrion <bh@udev.org>
Subject: [linux-lvm] Only 4MB of space on a 1GB file mounted in loopback
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I have setup some LVM volume to test on a loopback file of 1GB, but I
end up with a file of 4MB, do you have any idea what went wrong?:

===========================================================
root@buzek /home/zoobab [22]# dd if=/dev/zero of=1G.img bs=1G count=1
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB) copied, 13.6855 s, 78.5 MB/s
root@buzek /home/zoobab [23]# losetup -f
/dev/loop5
root@buzek /home/zoobab [24]# losetup /dev/loop5 1G.img
root@buzek /home/zoobab [25]#  pvcreate /dev/loop5
  Physical volume "/dev/loop5" successfully created
root@buzek /home/zoobab [26]# vgcreate testgroup /dev/loop5
  Volume group "testgroup" successfully created
root@buzek /home/zoobab [27]# lvcreate -i1 -l 1 -n testvol testgroup
  Redundant stripes argument: default is 1
  Logical volume "testvol" created
root@buzek /home/zoobab [28]# mkfs.ext3 /dev/testgroup/testvol
mke2fs 1.41.9 (22-Aug-2009)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
1024 inodes, 4096 blocks
204 blocks (4.98%) reserved for the super user
First data block=1
Maximum filesystem blocks=4194304
1 block group
8192 blocks per group, 8192 fragments per group
1024 inodes per group
Writing inode tables: done
Creating journal (1024 blocks): done
Writing superblocks and filesystem accounting information: done
This filesystem will be automatically checked every 31 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
root@buzek /home/zoobab [29]# mount /dev/testgroup/testvol  /mnt
root@buzek /home/zoobab [30]# cd /mnt
root@buzek /mnt [31]# df -lha
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1              57G   46G  7.7G  86% /
proc                     0     0     0   -  /proc
none                     0     0     0   -  /sys
none                     0     0     0   -  /sys/fs/fuse/connections
none                     0     0     0   -  /sys/kernel/debug
none                     0     0     0   -  /sys/kernel/security
udev                  1.4G  260K  1.4G   1% /dev
none                     0     0     0   -  /dev/pts
none                  1.4G  900K  1.4G   1% /dev/shm
none                  1.4G  124K  1.4G   1% /var/run
none                  1.4G     0  1.4G   0% /var/lock
none                  1.4G     0  1.4G   0% /lib/init/rw
binfmt_misc              0     0     0   -  /proc/sys/fs/binfmt_misc
gvfs-fuse-daemon      0.0K  0.0K  0.0K   -  /home/zoobab/.gvfs
/dev/mapper/testgroup-testvol
                      3.9M  1.1M  2.7M  29% /mnt
root@buzek /mnt [32]#
===========================================================

-- 
Benjamin Henrion <bhenrion@ffii.org>
FFII Brussels - +32-484-566109 - +32-2-4148403
"In July 2005, after several failed attempts to legalise software
patents in Europe, the patent establishment changed its strategy.
Instead of explicitly seeking to sanction the patentability of
software, they are now seeking to create a central European patent
court, which would establish and enforce patentability rules in their
favor, without any possibility of correction by competing courts or
democratically elected legislators."
