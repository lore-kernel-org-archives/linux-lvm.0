Return-Path: <ardy@rdb.linux-help.org>
Date: Sun, 1 Apr 2001 19:32:51 -0400 (EDT)
From: <ardy@rdb.linux-help.org>
Message-ID: <Pine.LNX.4.21.0104011921510.3969-100000@rdb.linux-help.org>
MIME-Version: 1.0
Subject: [linux-lvm] lvcreate error
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

I'm trying to add a seventh logical volume on a two-disk, striped volume
group. vgdisplay shows the following:

--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                6
Open LV               6
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               14.24 GB
PE Size               4 MB
Total PE              3646
Alloc PE / Size       1436 / 5.61 GB
Free  PE / Size       2210 / 8.63 GB
VG UUID               v5Mf72-JidP-Fv7q-fm3G-TY95-21k9-4SV86i

I currently have six logical volumes mounted.
This is the rror I get when trying to create the seventh logical volume:

lvcreate -i2 -I4 -L4G -n lv6 vg0

lvcreate -- not enough allocatable/free physical volume space in "vg0"
lvcreate -- please check, if physical volumes are allocatable

I've redone this system, and the only difference is that I'm striping this
time. I was capable of creating more logical volumes when I wasn't
striping. Also, I could create a seventh volume using 3900MB, but not
4000MB.

Why is it choking at 4GB?
