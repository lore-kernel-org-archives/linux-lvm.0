Message-ID: <34504.192.168.0.2.1069892769.squirrel@meuh.dyndns.org>
From: "Nowicki Christophe" <cscm@meuh.dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Insufficient allocatable extents suitable for striping for
 logical volume
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
Date: Fri Nov 28 03:38:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I'am trying to setup a striped logical volume. But I am getting this error :

#lvcreate -i2 -I4 -L1G -n main/lv_usr
  Insufficient allocatable extents suitable for striping for logical
volume lv_usr: 32 required

I don't understand this error. I did not find any anwser on google :(

Where is my system config :
Distro : Debian GNU/Linux "unstable"
System : Linux TuX 2.6.0-test9 #8 SMP Sun Nov 2 10:40:22 CET 2003 i686
GNU/Linux
LVM Version : 2.00.07-1
Hardware : 2x IDE Hard Disks Seagate ST340014A
  hda: ST340014A, ATA DISK drive
  hdb: ST340014A, ATA DISK drive

vgdisplay
  --- Volume group ---
  VG Name               main
  System ID             PV_IMPTuX1061637595
  Format                lvm1
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                3
  Open LV               3
  Max PV                256
  Cur PV                2
  Act PV                2
  VG Size               49.41 GB
  PE Size               32.00 MB
  Total PE              1581
  Alloc PE / Size       1256 / 39.25 GB
  Free  PE / Size       325 / 10.16 GB
  VG UUID               3PL6Zl-KtFh-pOqH-ntf5-C5td-SPxt-uUFZqJ

I have 10.16 Free GB. It's enough to setup a 1GB stripped logical volume,
isn't it?

#lvm pvscan
  PV /dev/hda5    is in exported VG main [31.25 GB / 0    free]
  PV /dev/hdb5    is in exported VG main [18.16 GB / 10.16 GB free]
  Total: 2 [10.16 GB] / in use: 2 [10.16 GB] / in no VG: 0 [0   ]

May be the problem is here?

I have not enough free space on hda5 and LVM doesn't move automatically
data form hda5 to hdb5?

Thanks a lot

-- 
Meuuuhh elle fait la vache :))                       _(__)_
Nowicki Christophe                                  '-e e -'__,--.__)
17, rue Saint Exupery                                (o_o)        )
77500 Chelles                                          \. /___.  |
Etudiant EPITECH Promo 2006                             ||| _)/_)/
http://etud.epita.fr/~nowick_c/nowick_c.asc             //_(/_(/_(
