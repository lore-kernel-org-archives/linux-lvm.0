From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200004191123.NAA05403@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Devfs and lvm problems
In-Reply-To: <20000418160645.6431.qmail@servnix.lan.wronline.de> from Stefan Paletta at "Apr 18, 2000  6: 6:45 pm"
Date: Wed, 19 Apr 2000 13:23:02 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Stefan Paletta <paletta@WRonline.de>
Cc: linux-lvm@msede.com

> matthaes@pharos.hsp.de wrote/schrieb/scribsit:
> > 1.) devfsd doesn=B4t create /dev/vg00/group etc files, so vgchange -ay
> >     fails
> >=20
> > 2.) vgscan fails with=20
> >=20
> > vgscan -- found inactive volume group "vg00"
> > vgscan -- ERROR "lvm_remouverecursive(): opendir" removing volume group=
 directory and special files
> > vgscan -- ERROR "lvm_remouverecursive(): opendir" creating "/etc/lvmtab=
" and "/etc/lvmtab.d"
>=20
> The problem is that vgscan wants to recursively remove /dev/vg00 and
> its contents but mishandles the case that /dev/vg00 does not even
> exist anymore (since after a reboot a devfs is 'clean').
>=20
> This is easy to fix, I'm attaching a patch.
> Would the lvmtools maintainer consider this patch for inclusion into
> the tree?

Sure, it will be included!

Heinz

>=20
> Stefan

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
