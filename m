From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200004191935.VAA05717@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] lvm-tools patches
In-Reply-To: <20000419195141.K21935@vestdata.no> from =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= at "Apr 19, 2000  7:51:41 pm"
Date: Wed, 19 Apr 2000 21:35:44 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Cc: linux-lvm@msede.com


Applied.

Regards,
Heinz

> Hi
>=20
> I've attached a few small patches for lvm-tools (0.8final).
>=20
> * lvm-compile.patch changes gnu/types.h to sys/types.h - it would not
>   compile without this change. (On RH 6.2)
> * lvm-lvdisplay fixes a bug that made it impossible to use "-v -v".
> * lvm-pvmove removes the source-PV equals dest-PV test. I can't see any
>   reason for this - I want to be able to move my PEs around on the same=20
>   disk....
>=20
>=20
>=20
> --=20
> Ragnar Kj=F8rstad

[Attachment, skipping...]

[Attachment, skipping...]

[Attachment, skipping...]


--=20

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmst=
adt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-
