From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] KLV: LVM-Probleme mit 31Bit-Linux auf s390x
Message-ID: <20030930134643.A26280@sistina.com>
References: <200309261446.hIxs@karlsruher.de>
Mime-Version: 1.0
In-Reply-To: <200309261446.hIxs@karlsruher.de>; from THORSTEN.D.TOVACOVSKY@KARLSRUHER.DE on Fri, Sep 26, 2003 at 04:46:00PM +0200
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
Date: Tue Sep 30 06:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com
Cc: mge@sistina.com

On Fri, Sep 26, 2003 at 04:46:00PM +0200, THORSTEN TOVACOVSKY wrote:
> --- Erhalten von  A12.TOVACO 0721/353-4569                   26.09.03 1=
5.46
>=20
>   -> LINUX-LVM(A)SISTINA.COM
>=20
> Hallo Herr Mauelshagen,
>=20
> wir nutzen Suse SLS8 31Bit auf einer z900 (2C1) unter z/VM (64Bit).
>=20
> Wir versuchen den LVM mit Raid0 - Devices arbeiten zu lassen.

Hallo Herr Tovacovsky,

LVM unterst=FCtzt RAID0 direkt. Eine Kombination mit MD ist nich erforder=
lich
(siehe "lvcreate -i n -I n ...").

>=20
> Des =F6fteren kommt bei diversen Commands der LVM scheinbar durcheinand=
er und
> zeigt pl=F6tzlich das 1.Devices unterm Raid0-Device an.
>=20
> Beispiel:
> VG mit 6 PVs
> per pvmove eines dieser PVs freigeschaufelt,
> dann per vgreduce dieses aus der VG versucht zu entfernen.
>=20
> ein pvscan bringt dann pl=F6tzlich sowohl das md-dev als auch die 1.dev=
ice im md
> als inaktiv.

Sollte im Prinzip funktionieren. Ich vermute, das SuSE noch eine =E4ltere
LVM Tool Version ausliefert.

Aber wie oben gesagt: Sie k=F6nnen RAID0 LVs komplett ohne MD direkt
mit LVM erzeugen.

>=20
> Da ist also sowieso schon was schiefgegangen. Leider sind diese beiden =
dann per
> pvchange -xn /dev/xxx nicht als PVs entfernbar. Siehe Meldung:
>=20
>  > pvchange -- unable to find volume group of "/dev/dasdk1" (VG not act=
ive?) <
>=20
> Scheints mu=DF die VG doch noch aktiv sein, doch dann bekomm ich die PV=
s ja auch
> nicht raus, dann dann folgende Meldung kommt:
>=20
>  > pvchange -- physical volume "/dev/md0" is unallocatable <
>=20
>=20
> Und nun ?
> Haben Sie=B4nen Tipp f=FCr uns ?
> K=F6nnen Wir sie bei einer eventuellen Fehlersuche unterst=FCtzen ?
>=20
> Gr=FC=DFe
> Thorsten
> (Karlsruher Lebensversicherung AG)
> ###########################################################
>=20
> This e-mail message has been scanned for Viruses=20
> by a Content Security Software.=20
>=20
> KARLSRUHER Lebensversicherung AG, 2003
>=20
> ###########################################################
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20

Gru=DF,
Heinz    -- The LVM Guy --

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
