From: grobe@gmx.net
MIME-Version: 1.0
References: <00cc01c2f2f6$02446ab0$64451c0a@dokho>
Subject: Re: [linux-lvm] 256Gb limit problem
Message-ID: <18321.1048683757@www7.gmx.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
Date: Wed Mar 26 07:03:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

> I want to do a virtual group of more than 256 GB and when i create a   =20
> virtual group it tells me that there 's a limit to 256 Gb  =20
  =20
Hi!  =20
  =20
No, there is no limit in lvm or ext2 at 256GB. You just will have to
increase the  =20
size of your physical extents. This is done when you create the volume group
 =20
(man vgcreate), the PE-size is defined with -s (as_many_MB_as_you_want).   =

Take a look at the manpage (man vgcreate).  =20
  =20
My configuration (LVM on Serveraid/RAID5, reiserfs): =20
 =20
/home/lars # vgdisplay  =20
--- Volume group ---  =20
VG Name               RAID  =20
VG Access             read/write  =20
VG Status             available/resizable  =20
VG #                  0  =20
MAX LV                255  =20
Cur LV                9  =20
Open LV               9  =20
MAX LV Size           1023.97 GB  =20
Max PV                255  =20
Cur PV                2  =20
Act PV                2  =20
VG Size               410.14 GB  =20
PE Size               16.00 MB  =20
Total PE              26249  =20
Alloc PE / Size       25408 / 397.00 GB  =20
Free  PE / Size       841 / 13.14 GB  =20
VG UUID               xxxxxx-xxxx-xxxx-xxxx-xxxx-xxxx-xxxxxx  =20
 =20
So, you see, I have a physical extent size of 16MB,  and could have one a=20
volume of one Terabyte - if I just had enough disks ;-) You also see that I
don't=20
have all PEs in use, in fact, there are 13,14 GB PEs "free" (that's not the
free=20
space on the filesystems, but the space on the volume group not allocated
for=20
use by LVs). That's because I have to create Logical Volumes from time to
time=20
if a department here needs space for a project.=20
=20
Take a look at the documentation on www.sistina.com!=20
=20
CU Lars.=20

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=EF=BF=BDcheln! Fotogalerie online mit GMX ohne eigene Homepage!
