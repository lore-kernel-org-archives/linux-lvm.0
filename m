From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] How to recover a VG from another PC?
Message-ID: <20040116111312.GE2837@redhat.com>
References: <40067D39.20407@iku-ag.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40067D39.20407@iku-ag.de>
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
Date: Fri Jan 16 08:57:09 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Kurt,

send me <mauelshagen@redhat.com> a copy of the bzip2'ed output of
"dd if=3D/dev/hdc2 ibs=3D1k count=3D4k" and i'll have a go on your metada=
ta trying
to repair it and send it back to you for VG recovery.

Cheers,
Heinz    -- The LVM Guy --

On Thu, Jan 15, 2004 at 12:44:57PM +0100, Kurt Huwig wrote:
> Hi!
>=20
> I've got the following problem:
>=20
> I replaced an old SUSE 7.3, Kernel 2.4.10 (or so) by a current Debian=20
> with 2.4.23. There was an IDE disk:
>=20
> /dev/hdc2            65      5005  39688582+  8e  Linux LVM
>=20
> There was a volume group called 'ide' containing only this one partitio=
n.
>=20
> Unfortunately I did the reinstall before reading the LVM manual and so=20
> did not use the export-feature. What I get from 'vgscan -d' is:
>=20
> <333> pv_check_volume -- CALLED  dev_name: "/dev/hdc2"  pv: 804D110
> <4444> pv_check_name -- CALLED with "/dev/hdc2"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdc2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED with VG: ide
> <55555> lvm_check_chars -- CALLED with name: "ide"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: -348
> <333> pv_check_volume -- LEAVING with ret: 0
> <22> pv_read_all_pv -- device /dev/hdc2 NOT used
>=20
> but no volume group appears.
>=20
> What can I do?
>=20
>=20
> Kurt
> --=20
> Kurt Huwig             iKu Systemhaus AG        http://www.iku-ag.de/
> Vorstand               Am R=F6merkastell 4        Telefon 0681/96751-0
>                        66121 Saarbr=FCcken        Telefax 0681/96751-66
> GnuPG 1024D/99DD9468 64B1 0C5B 82BC E16E 8940  EB6D 4C32 F908 99DD 9468

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
