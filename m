Return-Path: <harvell@nortelnetworks.com>
Message-ID: <3A7468C9.74A37155@nortelnetworks.com>
Date: Sun, 28 Jan 2001 12:45:29 -0600
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Follow-up: Help: lvm 0.9.1_beta3 oops (can't get my data)
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

More info:

If I don't touch volume group w0 (the one that has all my data), I get no oopses or SegFaults.  I was able to do the following after a fresh reboot into 2.4.0:

[root@btexi0c1 /root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "w0"
vgscan -- found inactive volume group "w1"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

[root@btexi0c1 /root]# vgchange -a y w1
vgchange -- volume group "w1" successfully activated

[root@btexi0c1 /root]# lvcreate -L 100M -n test w1
lvcreate -- doing automatic backup of "w1"
lvcreate -- logical volume "/dev/w1/test" successfully created

[root@btexi0c1 /root]# mke2fs /dev/w1/test
mke2fs 1.18, 11-Nov-1999 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
25688 inodes, 102400 blocks
5120 blocks (5.00%) reserved for the super user
First data block=1
13 block groups
8192 blocks per group, 8192 fragments per group
1976 inodes per group
Superblock backups stored on blocks:
 8193, 24577, 40961, 57345, 73729

Writing inode tables: done
Writing superblocks and filesystem accounting information: done
[root@btexi0c1 /root]# mkdir /mnt/test
[root@btexi0c1 /root]# mount /dev/w1/test /mnt/test
[root@btexi0c1 /root]# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda2               264444     74955    175834  30% /
/dev/hda7              4134900   1861884   2062968  48% /usr
/dev/hda6               529660     67108    435648  14% /var
/dev/hda1              7172990   1367470   5805520  20% /nt.c
/dev/hdb1              6666943   2420831   4246112  37% /nt.d
flacy-1:/workdata/ccase_rls
                       6190664   4462424   1413772  76% /mnt/ccase_rls
//ctexs411/IPC01     585482240  35143680 550338560   7% /IPC/VOB01
//ctexs411/IPC02     585482240  35143680 550338560   7% /IPC/VOB02
//ctexs411/IPC03     585482240  35143680 550338560   7% /IPC/VOB03
//ctexs411/IPC04     585482240  35143680 550338560   7% /IPC/VOB04
//ctexs411/IPC05     585482240  35143680 550338560   7% /IPC/VOB05
//ctexs411/IPC06     585482240  35143680 550338560   7% /IPC/VOB06
//ctexs411/IPC07     585482240  35143680 550338560   7% /IPC/VOB07
/dev/w1/test             99150        13     94017   1% /mnt/test
[root@btexi0c1 /root]# umount /dev/w1/test
[root@btexi0c1 /root]# lvremove /dev/w1/test
lvremove -- do you really want to remove "/dev/w1/test"? [y/n]: y
lvremove -- doing automatic backup of volume group "w1"
lvremove -- logical volume "/dev/w1/test" successfully removed

[root@btexi0c1 /root]# vgchange -a n w1
vgchange -- volume group "w1" successfully deactivated

[root@btexi0c1 /root]#
