From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM1 and a dying disk
Message-ID: <20030903111442.C2618@sistina.com>
References: <3F55ABF8.40608@webhackande.se>
Mime-Version: 1.0
In-Reply-To: <3F55ABF8.40608@webhackande.se>; from richie@webhackande.se on Wed, Sep 03, 2003 at 10:53:12AM +0200
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
Date: Wed Sep  3 04:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Rickard,

you say that you don't have a recent LVM metadata backup reflecting
your VG with /dev/ide/host0/bus1/target0/lun0/disc in it ?

If you had, normal procedure would be to

# pvcreate -ff /dev/ide/host0/bus1/target0/lun0/disc

and to

# vgcfgrestore -n YourVGName /dev/ide/host0/bus1/target0/lun0/disc
# vgscan
# vgchange -ay

(Because you exported, you need to pvcreate+vgcfgrestore to all PVs)

If /dev/ide/host0/bus1/target0/lun0/disc took a serious overwrite
(and it looks like it eyeing the pvdata output below), there's almost no
chance to cook up the correct metadata by hand I'm afraid.

People, please take LVM metadata backups!

Regards,
Heinz    -- The LVM Guy --


On Wed, Sep 03, 2003 at 10:53:12AM +0200, Rickard Olsson wrote:
> One of the disks in my /dev/files_vg vg have been making weird noises=20
> for a while. This vg is a JBOD with the following disks in it:
>=20
>=20
> majestix root # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/ide/host2/bus1/target0/lun0/disc" of VG "f2=
"
>       [149 GB / 0 free]
> pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/disc"  is in=20
> EXPORTED VG
>   "files_vg" [149.03 GB / 0 free]
> pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/disc"  is in=20
> EXPORTED VG
>   "files_vg" [111.77 GB / 0 free]
> pvscan -- inactive PV "/dev/ide/host0/bus1/target1/lun0/disc"  is in=20
> EXPORTED VG
>   "files_vg" [93.14 GB / 0 free]
> pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/disc"  is in=20
> EXPORTED VG
>   "files_vg" [111.77 GB / 0 free]
> pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/disc"  is in=20
> EXPORTED VG
>   "files_vg" [93.14 GB / 0 free]
> pvscan -- total: 6 [708 GB] / in use: 6 [708 GB] / in no VG: 0 [0]
>=20
>=20
> Exported, you say? Yep. The machine that this vg was in suffered a fata=
l=20
> root filesystem corruption last friday - not related to this disk (I=20
> name it Black Friday, that same day my VW Passat dropped the rear=20
> muffler and my upstream ISP had some major network issues that still=20
> isn't resolved).
> The f2 vg is the new vg I'm building to move data over to.
>=20
>=20
> majestix root # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "f2"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data o=
f=20
> volume
> group "files_vgPV_EXP" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volum=
e=20
> groups
>=20
>=20
> And devfs? Gentoo. Devfs is a major and total pain when trying to do a=20
> vgimport, listing 6 of those long paths on the command line is no fun.=20
> And, it doesn't work:
>=20
>=20
> vgimport -- ERROR "pv_read(): PV identifier invalid" reading physical=20
> volume "/d
> ev/ide/host0/bus1/target0/lun0/disc"
>=20
>=20
> I did manage to export the vg before the machine died permanently. The=20
> backups I had of the root drive are older then the last major change to=
=20
> the vg (addition of the Seagate 160GB that shows up as 149.03 GB above)=
.=20
> The troublesome disk is not showing in the pvscan, it's currently on=20
> /dev/ide/host0/bus1/target0/lun0/disc and a pvdata for it reveals:
>=20
>=20
> majestix root # pvdata /dev/ide/host0/bus1/target0/lun0/disc
> --- Physical volume ---
> PV Name               /dev/ide/host0/bus1/target0/lun0/disc
> VG Name               =C7D?
> PV Size               111.79 GB [234441648 secs] / NOT usable 16.19 MB=20
> [LVM: 155 KB]
> PV#                   0
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                9306113
> PE Size (KByte)       16384
> Total PE              7153
> Free PE               0
> Allocated PE          7153
> PV UUID               rDBb94-Kb8v-GMDa-HxIi-???
>=20
> Segmentation fault
>=20
>=20
> As you can see, not all fun and games.
>=20
> Now, is there any way to re-initialize the pv data on the failing disk=20
> long enough to get it back into the vg and extract the data? The data=20
> left in the vg is not critically important (I started backing it up as=20
> soon as I noticed the noises), but it would be really nice to get it ba=
ck.
>=20
> I have considered pvcreating it, but I'm not sure how I'd get it into=20
> the vg afterwards - would a vgscan/vgchange suffice? Would a reiserfsck=
=20
> --rebuild_tree then prune the fs of anything that was on this disk?
>=20
>     / Rickard Olsson,IT-Konsult/
>    / Telefon: +46 70 635 01 42/
>   / http://www.webhackande.se/
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
