From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Disc crash when using LVM...
Message-ID: <20030602115243.F5039@sistina.com>
References: <007801c3207b$32639880$f500a8c0@xerxes> <001701c32447$8a833b40$4242ca51@collote>
Mime-Version: 1.0
In-Reply-To: <001701c32447$8a833b40$4242ca51@collote>; from FNT@mail.ono.es on Tue, May 27, 2003 at 02:00:17PM +0200
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
Date: Mon Jun  2 05:03:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, May 27, 2003 at 02:00:17PM +0200, fnt wrote:
> I think there is a vgrestore or sometthing like that
> and then u will have to recreate the volumen
>=20
> vgcfgrestore<-- that one is the comand.

Right, and you need to run "pvcreate -ff ..." on the PV you want to vgcfg=
restore
to first.

Regards,
Heinz    -- The LVM Guy --

>=20
> Best Regads
>   ----- Original Message -----=20
>   From: Kim Kr=FCger-Monsen=20
>   To: linux-lvm@sistina.com=20
>   Sent: Thursday, May 22, 2003 5:59 PM
>   Subject: [linux-lvm] Disc crash when using LVM...
>=20
>=20
>   I'm desperate... please help...
>=20
>   First of all I'm rather new to this LVM business, but I managed to ge=
t a three disc LVM up and running, but now everything is chaos. One disc =
just crashed and I can't retrieve any of the information from the 2 remai=
ning discs, please help me retrieve my data. Yes, it was an IBM drive, bu=
t it was of a rather new model (80GB) and not much used, so I was rather =
astonished about the crash.
>=20
>   I have read about another guy who also experienced a disc crash (IBM)=
 and he solved it by replacing the faulty drive with another one, but he =
didn't mention how he managed to get it up and running again. Did he use =
a replacement drive of the same size? What commands did he have to use in=
 order to get it up and running again?
>=20
>   I've been searching for hours to find any relevant information about =
what to do in order to retrieve the remaining data from my other drives. =
I'm not good at this so I really don't want to issue any commands that wi=
ll delete my remaining data permanently.
>=20
>   Here's how it looks like now:
>=20
>   >pvscan
>   pvscan -- reading all physical volumes (this may take a while...)
>   pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG "vg01"=
 (run vgscan)
>   pvscan -- inactive PV "/dev/hda8"  is associated to unknown VG "vg01"=
 (run vgscan)
>   pvscan -- total: 2 [139.70 GB] / in use: 2 [139.70 GB] / in no VG: 0 =
[0]
>=20
>   >vgscan
>   vgscan -- reading all physical volumes (this may take a while...)
>   vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data=
 of volume group "vg01" from physical volume(s)
>   vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>   vgscan -- WARNING: This program does not do a VGDA backup of your vol=
ume group
>=20
>   >lvscan
>   lvscan -- no volume groups found
>=20
>   I have no idea what has happened to my volume group, it seems like it=
 has disappeared. All I can do is scan for the physical volumes.
>=20
>   What to do next?? I'm still searching for information relevant to the=
 problem, but please give me a hint or two...
>=20
>       /Kim
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
