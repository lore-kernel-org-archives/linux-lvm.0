From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm 0.8 to 1.0 transition?
Message-Id: <20020227184310.B21636@sistina.com>
References: <3C7BC9BB.F1ABAC3@fl.priv.at>
    <20020227102700.C19249@sistina.com> <3C7CE18F.BCFDDD7B@fl.priv.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3C7CE18F.BCFDDD7B@fl.priv.at>; from fl@fl.priv.at on Wed,
    Feb 27, 2002 at 02:39:27PM +0100
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
Date: Wed Feb 27 11:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, Feb 27, 2002 at 02:39:27PM +0100, Friedrich Lobenstock wrote:
> "Heinz J . Mauelshagen" wrote:
> >=20
> > In case you just want to update your LVM software, you don't need to
> > vgexport/vgimport your VGs as described under that URL.
> >=20
> > Presuming that you took backups of your data and metadata (/etc/lvmconf=
/*)
> > and don't have root on a LV,
>=20
> Yes root is on a LV on RAID1 and the data is on a LV on another RAID1
>=20
> # uname -a
> Linux www 2.4.0-test12-pre4-reiserfs-md-fixes #4 Fri Jan 19 14:48:29 CET =
2001 i686 unknown
>=20
> # cat /proc/lvm
> LVM driver version 0.8final  (15/02/2000)
> =20
> Total:  2 VGs  2 PVs  6 LVs (6 LVs open 6 times)
> =20
> Global: 156410 bytes malloced   IOP version: 6   22:43:33 active
> =20
> VG:  system-disk  [1 PV, 4 LV/4 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 9969664 /2434 total  9969664 /2434 used  0 /0 free
>   PV:  [AA] md1                    9969664 /2434     9969664 /2434       =
    0 /0
>     LVs: [AWCL  ] swap                        524288 /128      1x open
>          [AWDL  ] root                       2097152 /512      1x open
>          [AWDL  ] tmp                         524288 /128      1x open
>          [AWDL  ] var                        6823936 /1666     1x open
> =20
> VG:  data-disk  [1 PV, 2 LV/2 open]  PE Size: 8192 KB
>   Usage [KB/PE]: 78143488 /9539 total  55615488 /6789 used  22528000 /275=
0 free
>   PV:  [AA] md3                   78143488 /9539    55615488 /6789    225=
28000 /2750
>     LVs: [AWDL  ] 1                         18022400 /2200     1x open
>          [AWDL  ] 2                         37593088 /4589     1x open
>=20
> # df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/system-disk/root
>                       2.0G  1.5G  522M  75% /
> /dev/md0               50M   37M   13M  74% /boot
> /dev/system-disk/tmp  512M   32M  480M   6% /tmp
> /dev/system-disk/var  6.5G   92M  6.4G   1% /var
> /dev/data-disk/1       17G   12G  5.1G  70% /mount/1
> /dev/data-disk/2       36G   12G   24G  34% /mount/2
>=20
> /dev/system-disk/ has PV /dev/md1
> /dev/data-disk/ has PV /dev/md3
>=20
> # cat /proc/mdstat
> Personalities : [raid1]
> read_ahead 1024 sectors
> md0 : active raid1 hdc1[0] hda1[1]
>       51264 blocks [2/2] [UU]
> =20
> md1 : active raid1 hdc2[0] hda2[1]
>       9970560 blocks [2/2] [UU]
> =20
> md3 : active raid1 hdg1[1] hde1[0]
>       78150592 blocks [2/2] [UU]
>=20
> Therefore I will install a new system and I'll just take the disks
> that belong to /dev/md3 and put them in this new system. So I'll
> have the old system to put the disks back if anything goes wrong
> in the new system.=20
>=20
> In the new system I just need to pvmove the the data onto the new=20
> disks, this time hardware RAID instead of software RAID, so no=20
> fancy stuff to get lilo boot with root on LV.
>=20
> So how should I do it, just "vgscan;vgchange -ay" or do I need to
> vgexport/vgimport and will this cause troubles?

If you want to move the devices over to another system, vgexport+vgimport
is the recommended way to go.

>=20
> --=20
> MfG / Regards
> Friedrich Lobenstock
> =7F
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20

Regards,
Heinz    -- The LVM Guy --

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
