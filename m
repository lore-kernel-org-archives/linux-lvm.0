Message-ID: <C6B0A1AF05B7A04E9D8E784173AE3D2016300B@ausx2kmpc104.aus.amer.dell.com>
From: Taylor_Carpenter@Dell.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] not enough free/allocatable physical extents to extend logical
 vo lume
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
Date: Thu Jul 24 23:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I am trying to add a 4th disk to an existing lv.  I am following the
directions in

http://tldp.org/HOWTO/LVM-HOWTO/x802.html

but It is complaing about free physical extents when trying to extend during
the e2fsadm portion.


root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdb1" of VG "Scratch" [33.91 GB / 240 MB free]
pvscan -- ACTIVE   PV "/dev/sdc1" of VG "Scratch" [33.91 GB / 240 MB free]
pvscan -- ACTIVE   PV "/dev/sdd1" of VG "Scratch" [33.91 GB / 240 MB free]
pvscan -- ACTIVE   PV "/dev/sde1" of VG "Scratch" [33.91 GB / 33.91 GB free]
pvscan -- total: 4 [135.65 GB] / in use: 4 [135.65 GB] / in no VG: 0 [0]
