From: "Tomaz Beltram" <tomazb@hotmail.com>
Subject: [linux-lvm] mounting ext3 snapshot occasionaly fails
Mime-Version: 1.0
Message-ID: <F109bnA0FiNJnMKgr6R0000d03d@hotmail.com>
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
Date: Tue Dec  3 10:24:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>I don't know whether the SuSE kernel has the VFS lock patch applied or >not 
>- if
>not then one for 2.4.19 is available in the LVM 1.0.6 source package.

I found the linux-2.4.19-VFS-lock.patch in the LVM 1.0.5 src package. 
However, it results to me that it is already included. Patch says:
Reversed (or previously applied) patch detected!

Beside that, I can see the new symbols that come with the patch in my 
running kernel:
# cat /proc/ksyms | grep lockfs
c014cf90 fsync_dev_lockfs
c0151680 unlockfs

I was able to reproduce this with following steps:
VG=vg1
lvcreate -L 100M -n lv1 $VG
mke2fs -j /dev/$VG/lv1
mkdir /mnt/fs1
mount -t ext3 /dev/$VG/lv1 /mnt/fs1
lvcreate -L 10M -n lv1_snap -s /dev/$VG/lv1
mkdir /mnt/fs1_snap
mkdir /mnt/fs1/dir
sleep 60
mount -t ext3 -r /dev/$VG/lv1_snap /mnt/fs1_snap

Please note that the change to the original file system is made *after* the 
snapshot is created, so this could be different problem.

thanks again
Tomaz

_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE* 
http://join.msn.com/?page=features/virus
