From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] I:LVM Raw Oracle 9i RAC
Message-ID: <20030919143135.S2618@sistina.com>
References: <E1C82FD242FD6243B93A98A1F6BE6B100AA04D@SBCOR23A.es.gasnatural.com>
Mime-Version: 1.0
In-Reply-To: <E1C82FD242FD6243B93A98A1F6BE6B100AA04D@SBCOR23A.es.gasnatural.com>; from jmbernat@gasnatural.com on Fri, Sep 19, 2003 at 01:12:00PM +0200
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
Date: Fri Sep 19 07:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com
Cc: mge@sistina.com

On Fri, Sep 19, 2003 at 01:12:00PM +0200, Bernat Covacho, Jose Maria wrot=
e:
> Hi Heinz
>=20
> Yes. We see the same degradation using Oracle

Hmmm, I can only assume that the stripe units you choosed (it is a stripe=
d LV,
right ?) are suboptimal with raw devices in your case.

Because laying out striped LVs in the best performing way is very
application specific, you may want to try different stripe sizes
(lvcreate's -I option) and different numbers of stripes (-i option).

I am not aware of any Oracle recommendations WRT using striped LVs.

Anyone from Oracle able to comment on this ?

Regards,
Heinz    -- The LVM Guy --

>=20
> Oracle without LVM takes 15 sec to read 8 GB , and Oracle with lvm take=
s 50-60 sec
>=20
> Thank=B4s
>=20
> Bernat
>=20
> -----Mensaje original-----
> De: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]=20
> Enviado el: viernes, 19 de septiembre de 2003 12:40
> Para: linux-lvm@sistina.com
> Asunto: Re: [linux-lvm] I:LVM Raw Oracle 9i RAC
>=20
>=20
> dd is no good tool to do such performance numbers.
> Do you see any degradations in Oracle compared to non-LVM raw devices ?
>=20
> Regards,
> Heinz    -- The LVM Guy --
>=20
>=20
> On Tue, Sep 16, 2003 at 01:30:05PM +0200, Bernat Covacho, Jose Maria wr=
ote:
> > Hello, we have a RedHat Avanced Server 2.1 with kernel version 2.4.9-=
e.12smp and we use lvm version 1.0.3 (yes I know that the latest "one" ve=
rsion is 1.0.7). I think that the version 2 is too much advanced for us.=20
> > =20
> > We have a very strange problem with lvm, oracle and raw devices. If w=
e take a logical volume manager and test it with a simple dd we get:
> > =20
> > ---------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------------------------
> > time dd if=3D/dev/MKTP/strip32 of=3D/dev/null bs=3D512k count=3D2048=20
> > 2048+0 registros le=EDdos
> > 2048+0 registros escritos
> > =20
> > real    0m13.394s
> > user    0m0.000s
> > sys     0m6.090s
> > ---------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------------------------
> > =20
> > Ok, It works fine, we have 1Gbyte in 13 seconds.
> > =20
> > Now we bind this logical volume to a raw device
> > =20
> > ---------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------------------------
> > raw /dev/MKTP/strip32 /dev/raw/raw15
> > ---------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------------------------
> > =20
> > and we try with this:
> > =20
> > ---------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------------------------
> > time dd if=3D/dev/raw/raw15  of=3D/dev/null bs=3D512k count=3D2048=20
> > 2048+0 registros le=EDdos
> > 2048+0 registros escritos
> > =20
> > real    0m14.828s
> > user    0m0.020s
> > sys     0m6.180s
> > ---------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------------------------
> > =20
> > The same time, more or less, all it's ok.=20
> > =20
> > Now we want use this raw (raw15) with oracle. We create a oracle tabl=
espace put data into. We can access it through oracle.
> > =20
> > We stop oracle. Now we repeat the same dd:
> > =20
> > ---------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------------------------
> > time dd if=3D/dev/raw/raw15 of=3D/dev/null bs=3D512k count=3D2048
> > 2048+0 registros le=EDdos
> > 2048+0 registros escritos
> > =20
> > real    0m48.971s
> > user    0m0.010s
> > sys     0m11.590s
> > ---------------------------------------------------------------------=
-------------------------------------------------------------------------=
--------------------------
> > =20
> > Now we have 48 seconds, why?, The only one difference is the tablespa=
ce creation.
> > =20
> > We try the same process without lvm and we have the same good time in=
 three cases.
> > =20
> > There are some problem with lvm, raw and oracle?
> > How can I avoid this?
> > =20
> > Thanks in advanced
> > =20
> > =20
> > =20
> > =20
> > =20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Esta informaci=F3n es privada y confidencial y est=E1 dirigida =FAnic=
amente a su destinatario. Si usted no es el destinatario original de este=
 mensaje y por este medio pudo acceder a dicha informaci=F3n por favor el=
imine el mensaje y notifique el env=EDo err=F3neo al remitente. La distri=
buci=F3n o copia de este mensaje est=E1 estrictamente prohibida. Esta com=
unicaci=F3n es s=F3lo para prop=F3sitos de informaci=F3n y no deber=EDa s=
er considerada como una declaraci=F3n oficial del Grupo gasNatural. La tr=
ansmisi=F3n de e-mails no garantiza que el correo electr=F3nico sea segur=
o. Por consiguiente, no manifestamos que esta informaci=F3n sea completa =
o precisa. Toda informaci=F3n est=E1 sujeta a alterarse sin previo aviso.=
 Este Correo Electr=F3nico ha sido procesado por nuestro sistema de Antiv=
irus corporativo=20
> >=20
> >  This information is private and confidential and intended for the re=
cipient only. If you are not the intended recipient of this message you a=
re hereby notified that any review it and notify the sender immediately, =
dissemination, distribution or copying of this message is strictly prohib=
ited.  This communication is for information purposes only and should not=
 be regarded as an official statement from gasNatural Group. Email transm=
ission cannot be guaranteed to be secure.  Therefore, we do not represent=
 that this information is complete or accurate and it should not be relie=
d upon as such.All information is subject to change without notice. This =
email has been scanned by our Antivirus system
> >=20
>=20
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>=20
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-
>=20
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Esta informaci=F3n es privada y confidencial y est=E1 dirigida =FAnicam=
ente a su destinatario. Si usted no es el destinatario original de este m=
ensaje y por este medio pudo acceder a dicha informaci=F3n por favor elim=
ine el mensaje y notifique el env=EDo err=F3neo al remitente. La distribu=
ci=F3n o copia de este mensaje est=E1 estrictamente prohibida. Esta comun=
icaci=F3n es s=F3lo para prop=F3sitos de informaci=F3n y no deber=EDa ser=
 considerada como una declaraci=F3n oficial del Grupo gasNatural. La tran=
smisi=F3n de e-mails no garantiza que el correo electr=F3nico sea seguro.=
 Por consiguiente, no manifestamos que esta informaci=F3n sea completa o =
precisa. Toda informaci=F3n est=E1 sujeta a alterarse sin previo aviso. E=
ste Correo Electr=F3nico ha sido procesado por nuestro sistema de Antivir=
us corporativo=20
>=20
>  This information is private and confidential and intended for the reci=
pient only. If you are not the intended recipient of this message you are=
 hereby notified that any review it and notify the sender immediately, di=
ssemination, distribution or copying of this message is strictly prohibit=
ed.  This communication is for information purposes only and should not b=
e regarded as an official statement from gasNatural Group. Email transmis=
sion cannot be guaranteed to be secure.  Therefore, we do not represent t=
hat this information is complete or accurate and it should not be relied =
upon as such.All information is subject to change without notice. This em=
ail has been scanned by our Antivirus system
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
