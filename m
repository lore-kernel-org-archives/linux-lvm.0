From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcfgrestore and bootstrap
Message-ID: <20030924144818.D2618@sistina.com>
References: <200309231754.20420.gingiabios@email.it> <20030924103749.C2618@sistina.com> <200309241414.47229.gingiabios@email.it>
Mime-Version: 1.0
In-Reply-To: <200309241414.47229.gingiabios@email.it>; from gingiabios@email.it on Wed, Sep 24, 2003 at 02:14:47PM +0200
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
Date: Wed Sep 24 07:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Sep 24, 2003 at 02:14:47PM +0200, Gingia wrote:
> Alle 10:37, mercoled=EC 24 settembre 2003, Heinz J . Mauelshagen ha scr=
itto:
> > Gingia,
> >
> > the normal procedure is "vgscan ; vgchange -ay ; mount -a"
> > rather than vgcfgrestore before vgchange.
> ...
> > Have you tried "vgscan ; vgchange -ay ; mount -a" before ?
> > (keep in mind, that vgscan needs space below /etc/ to store metadata
> > copies)
>=20
> I controlled the script of bootstrap  to see if there is the apropiated=
 entry,=20
> and it seems is ok, i also re-started the server .
> I  tried "vgscan" and i have the output:
> invalidate :dirty buffer=20
> invalidate :busy buffer =20
> (any time)
> vgscan -- "/etc/lvmtab" and  "7etc/lvmtab.d" successfully created=20
> vgscan -- WARNING: this programm doe not do a VGDA backup of your group

Can you send the "vgscan -d" output of this case to me directly, please
(mge@sistina.com) ?
Probably some i2o devices scanning flaw.

>=20
> after i do :
> vgchange -ay=20
> and the output was:
> vgchange -- no volume group found=20
>=20
> so i made the restore:
> vgcfgrestore .........
> the ouptput was=20
> vgcfgrestore -- VGDA for "Volume1" successfully restored to phisical vo=
lume=20
> "/dev/i2o/hda3"=20
> vgcfgrestore  -- you may not have an actual backup of restored group "v=
olume1"
>=20
> then i can do  vgchange -ay  and go on=20
>=20
> This is all , was it the matter?
>=20
> Thank you
>=20
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
