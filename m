From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] VG wiederfinden
Message-Id: <20020508134626.A433@sistina.com>
References: <C1256BB3.001B923F.00@grz_notes_mta.grznord.de>
MIME-Version: 1.0
In-Reply-To: <C1256BB3.001B923F.00@grz_notes_mta.grznord.de>;
    from Tim-Christian.Hanschen@GAD.de on Wed, May 08, 2002 at 07:04:51AM
    +0200
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
Date: Wed May  8 06:46:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Tim-Christian,

vgscan ist das Kommando, welches nach VGs sucht und /etc/lvmtab* Dateien
erstellt, die von "vgchange -ay" genutzt werden, um die Volume Groups
zu aktivieren.

Ich empfehle ein Update auf LVM 1.0, da 0.9.1 Beta einige Fehler hatte.

Gru=DF,
Heinz    -- The LVM Guy --

On Wed, May 08, 2002 at 07:04:51AM +0200, Tim-Christian.Hanschen@GAD.de w=
rote:
> Hallo Heinz,
>=20
> ich habe ein Problem mit LVM unter Linux/390.
>=20
> Ich hatte ein LVM (Version 0.8?) unter einen 2.2.16 Kernel laufen. Alle=
s
> lief soweit ganz gut. Gestern habe ich eine neue Linux Version installi=
ert,
> Kernel 2.4.5. dort ist die Version 0.9.1_beta7-14 mitgeliefert.
>=20
> Mein Problem ist nun, dass ich keine LVM-Platten mehr finde. Die PV und=
 VG
> sind verschwunden. Gibt es eine M=F6glichkeit die Gruppen suchen zu las=
sen?
>=20
> Danke & Tschau,
>   - Tim Hanschen -
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


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
