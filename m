From: Arkadiusz Miskiewicz <misiek@pld.ORG.PL>
Date: 25 Aug 2001 19:37:49 +0200
Message-ID: <87n14o82he.fsf@arm.t19.ds.pwr.wroc.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm-1.0.1rc1 cvs snapshot and devfs
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Hi,

I'm using 2.4.7/x86 kernel with xfs, devfs and LVM version
1.0.1-rc1(17/08/2001). Unfortunately devfs support isn't nice.

Simple example (/dev/hdc5 is Linux-LVM partition (8e))

[root@arm misiek]# pvcreate /dev/hdc5
pvcreate -- physical volume "/dev/hdc5" successfully created

[root@arm misiek]# vgextend storage /dev/hdc5
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- ERROR: no physical volumes usable to extend volume group "storage"

[root@arm misiek]# ls -l /dev/hdc5
lr-xr-xr-x    1 root     root           33 sie 25  2001 /dev/hdc5 -> ide/host0/bus1/target0/lun0/part5
[root@arm misiek]# vgextend storage /dev/ide/host0/bus1/target0/lun0/part5
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- doing automatic backup of volume group "storage"
vgextend -- volume group "storage" successfully extended

[root@arm misiek]# 

So LVM tools are working fine with real devfs device names while some
tools don't work with old non-devfs names (vgextend and other vg*).

IMHO simplest solution is inside LVM use real devfs names - always (or
only when devfs is in kernel and is used/mounted by user) call
readlink(2) on device specified by user on command line.

-- 
 Arkadiusz Mi�kiewicz, AM2-6BONE, 1024/3DB19BBD
 IPv6 ready PLD Linux at http://www.pld.org.pl/
My jsme Borg. Odpor je marn�, budete asimilov�ni
