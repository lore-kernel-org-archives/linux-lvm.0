From: Heinz J . Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] pvmove failed
Message-ID: <20020826122227.C18054@sistina.com>
References: <01ef01c24ac6$86fc58e0$162ea8c0@pike>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <01ef01c24ac6$86fc58e0$162ea8c0@pike>; from davide@connettendo.it on Fri, Aug 23, 2002 at 07:00:04PM +0200
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
Date: Mon Aug 26 05:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Davide,
you say below, that every time you pvmove the command freezes after
it moved 90 PEs successfully. Data integrity is given.

Could you check what pvmove is waiting for when it freezes
with "ps -alx|grep pvmove", run pvmove with the -d option and save the last
~100 lines. Send output to me directly (mge=EF=BF=BDsistina.com).

Regards,
Heinz    -- The LVM Guy --


It could well freeze in your AMI device because of=20

On Fri, Aug 23, 2002 at 07:00:04PM +0200, Davide Di Luzio wrote:
> Hello,
>=20
> we've a server (web, ftp, cgi applications) with this hardware:
>=20
> Motherborad SuperMIcro P4DP6
>=20
> Onboard ATI Technologies Inc Rage XL (rev 27) (prog-if 00 [VGA])
>  ATI Technologies Inc Rage XL
>=20
> dual P4 Xeon 2.2 Ghz
> 4 Gbyte RAM
>=20
> one controller: American Megatrends Inc. MegaRAID (rev 02)
> American Megatrends Inc. MegaRAID 475 Express 500 RAID Controller bios ve=
r. 5.2
>=20
> one controller: SCSI storage controller: Adaptec AHA-3960D / AIC-7899A U1=
60/m (rev 01)
>  Adaptec AHA-3960D U160/m
>=20
> onboard controller:=20
> SCSI storage controller: Adaptec AIC-7899P U160/m (rev 01)
>=20
> Intel Ethernet Pro 100
>=20
> We've LVM utility software vers. 1.0.5 installed on 2.4.18-10 Readhat Ker=
nel (ver. 7.3, official kernel patched with LVM 1.0.5).=20
>=20
> The Volume group hosting is so configured:
>=20
> --- Volume group ---
> VG Name               hosting
> VG Access             read/write
> VG Status             available/resizable
> VG #                  2
> MAX LV                255
> Cur LV                3
> Open LV               3
> MAX LV Size           255.99 GB
> Max PV                255
> Cur PV                3
> Act PV                3
> VG Size               34.24 GB
> PE Size               4 MB
> Total PE              17510
> Alloc PE / Size       8744 / 34.16 GB
> Free  PE / Size       0 / 0 GB
> VG UUID               zsW0nX-g4jP-z1uw-dAEk-TZDP-dxVC-j1Llec
>=20
> --- Logical volume ---
> LV Name                /dev/home/lv
> VG Name                home
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                12 GB
> Current LE             3072
> Allocated LE           3072
> Stripes                2
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:5
>=20
> --- Logical volume ---
> LV Name                /dev/hosting/lv
> VG Name                hosting
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                7.16 GB
> Current LE             1832
> Allocated LE           1832
> Stripes                2
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:8
>=20
> --- Logical volume ---
> LV Name                /dev/hosting/lv0
> VG Name                hosting
> LV Write Access        read/write
> LV Status              available
> LV #                   2
> # open                 1
> LV Size                7 GB
> Current LE             1792
> Allocated LE           1792
> Stripes                2
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:9
>=20
> --- Logical volume ---
> LV Name                /dev/hosting/lv1
> VG Name                hosting
> LV Write Access        read/write
> LV Status              available
> LV #                   3
> # open                 1
> LV Size                20 GB
> Current LE             5120
> Allocated LE           5120
> Stripes                2
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:10
>=20
> --- Physical volumes ---
>=20
> PV Name (#)           /dev/sdv1 (1)
> PV Status             available / allocatable
> Total PE / Free PE    4372 / 0
>=20
> PV Name (#)           /dev/sdw1 (2)
> PV Status             available / allocatable
> Total PE / Free PE    4372 / 0
>=20
> The device /dev/sdw1 is an logical array (raid 1) on ami megaraid control=
ler: this device is  in degraded  mode, so we have add two scsi disk with r=
aid software (/dev/md12, one device on onboard controller
> and the second on the external AIC 7899); i wolud move the striped device=
 /dev/sdw1 to
> new /dev/md12.
>     I've add this device (/dev/md12) to volume group hosting with "vgexte=
nd" utility.
> Note that /dev/sdv1 and /dev/sdw1 are logical striping of volume group ho=
sting
>=20
> In single mode, i've umounted all the logical volume and i've make:
>=20
> /sbin/pvmove -iv /dev/sdw1 /dev/md12
>=20
> The process skipped some PE (I/o errors) but after moved 91 PE from /dev/=
sdw1 the pvmove command=20
> freezed; after a shutdown of a server i see on the vg hosting that /dev/m=
d12 has 91 PE allocated and i've
> mounted on the file system apparently about no errors
>     I see also that the PE is on lv logical volume, so i make:
>=20
> /sbin/pvmove -iv -n lv1 /dev/sdw1 /dev/md12
>=20
> (I've tested several type of pvmove comand, but i can't specify a ranges =
of PE with a logical volume striped).
>=20
> About moved 90 PE the pvmove freezed; reboot the server and /dev/md/12 ha=
 allocated another  90 PE.
>=20
> So go on, and after:
>=20
> /sbin/pvmove -iv -n lv0 /dev/sdw1 /dev/md12 i've moved 89  PE and freezed=
 again:
> is this another bug of pvmove utility?
>=20
> Now, the vgdisplay -v hosting is this:
>=20
>=20
> --- Volume group ---
> VG Name               hosting
> VG Access             read/write
> VG Status             available/resizable
> VG #                  2
> MAX LV                255
> Cur LV                3
> Open LV               3
> MAX LV Size           255.99 GB
> Max PV                255
> Cur PV                3
> Act PV                3
> VG Size               34.24 GB
> PE Size               4 MB
> Total PE              17510
> Alloc PE / Size       8744 / 34.16 GB
> Free  PE / Size       8766 / 34.24 GB
> VG UUID               zsW0nX-g4jP-z1uw-dAEk-TZDP-dxVC-j1Llec
> --- Logical volume ---
> LV Name                /dev/home/lv
> VG Name                home
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                12 GB
> Current LE             3072
> Allocated LE           3072
> Stripes                2
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:5
>=20
> --- Logical volume ---
> LV Name                /dev/hosting/lv
> VG Name                hosting
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                7.16 GB
> Current LE             1832
> Allocated LE           1832
> Stripes                2
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:8
>=20
> --- Logical volume ---
> LV Name                /dev/hosting/lv0
> VG Name                hosting
> LV Write Access        read/write
> LV Status              available
> LV #                   2
> # open                 1
> LV Size                7 GB
> Current LE             1792
> Allocated LE           1792
> Stripes                2
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:9
>=20
> --- Logical volume ---
> LV Name                /dev/hosting/lv1
> VG Name                hosting
> LV Write Access        read/write
> LV Status              available
> LV #                   3
> # open                 1
> LV Size                20 GB
> Current LE             5120
> Allocated LE           5120
> Stripes                2
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:10
>=20
>=20
> --- Physical volumes ---
> PV Name (#)           /dev/md12 (3)
> PV Status             available / allocatable
> Total PE / Free PE    8766 / 8499
>=20
> PV Name (#)           /dev/sdv1 (1)
> PV Status             available / allocatable
> Total PE / Free PE    4372 / 0
>=20
> PV Name (#)           /dev/sdw1 (2)
> PV Status             available / allocatable
> Total PE / Free PE    4372 / 267
>=20
> /sbin/pvdisplay -v /dev/md12
>=20
> In this mail is attached the pvdispay output of /dev/md12.
>=20
> Now the server is up and apparently the data is integrity but i=20
> would safely move all the logical volume=20
> on /dev/md12 or into another device; how can i do this ?
>=20
> Thanks.=20
>=20
> Best Regards.
>=20
> Davide Di Luzio
> System Administrator
> -----------------
> ALICOM Group     Tel: +39-085-4406901     Fax: +39-085-4406927
>=20
>=20
>=20
>=20

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
