Message-ID: <3CE036C7.21A968F@club-internet.fr>
From: Adeline =?iso-8859-1?Q?M=E9tayer?= <metayer.adeline@club-internet.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: imposs mount vg
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
Date: Mon May 13 17:00:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Yes, I did a
vgscan
vgchange -a y


All is all right. The problem is that Linux asks the fs type for the
mount command :
[root@localhost root]# mount /dev/mon_volume_groupe/lv1 /mnt/
mount : vous devez indiquer le type de syst�me de fichiers.
        ===> (that is to say, in english : "you should type the fs
type".


and I tried the following :
[root@localhost root]# mount -t ext3 /dev/mon_volume_groupe/lv1 /mnt
mount : type fs incorrect, option incorrecte, superbloc incorrect sur
/dev/mon_volume_groupe/lv4,
       ou trop de syst�mes de fichiers mont�s
[root@localhost root]# mount -t ext2 /dev/mon_volume_groupe/lv1 /mnt
mount : type fs incorrect, option incorrecte, superbloc incorrect sur
/dev/mon_volume_groupe/lv1,
       ou trop de syst�mes de fichiers mont�s
[root@localhost root]# mount -t LVM /dev/mon_volume_groupe/lv1 /mnt
mount : type fs LVM non pris en charge par le kernel
[root@localhost root]# mount -t 8e /dev/mon_volume_groupe/lv1 /mnt
mount : type fs 8e non pris en charge par le kernel
[root@localhost root]# mount -t lvm-ext3 /dev/mon_volume_groupe/lv1 /mnt
mount : type fs lvm-ext3 non pris en charge par le kernel
[root@localhost root]# mount -t 0x8e /dev/mon_volume_groupe/lv1 /mnt
mount : type fs 0x8e non pris en charge par le kernel


The vg is a 8e type, and the lv are "lvm" type...
Do not guess the origin of the pb (I'm just beginning in the lvm
world... did you guess it ? :o)

Regards,
Adeline



ps :
[root@localhost root]# vgdisplay mon_volume_groupe
--- Volume group ---
VG Name               mon_volume_groupe
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                3
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                1
Act PV                1
VG Size               12.23 GB
PE Size               4.00 MB
Total PE              3130
Alloc PE / Size       3000 / 11.72 GB
Free  PE / Size       130 / 520.00 MB
VG UUID               FWd94e-SOmz-mILK-MXGP-k6u9-zohn-C3Zfcz
