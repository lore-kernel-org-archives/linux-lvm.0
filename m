Message-ID: <85063BBE668FD411944400D0B744267A88873A@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] Problem mit lvm nach dem Reboot.
MIME-Version: 1.0
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
Date: Thu Nov  8 16:32:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I agree with his recomendations. It sounds like an issue I had a while =
back
and that fixed it for me as well.

--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com=20

> -----Original Message-----
> From: Ulrich Wiederhold [mailto:U.Wiederhold@gmx.net]
> Sent: Thursday, November 08, 2001 4:30 PM
> To: Heinz Mauelshagen
> Subject: Re: [linux-lvm] Problem mit lvm nach dem Reboot.
>=20
>=20
> Hallo,
> zwei Dinge.
> 1. Upgrade auf 1.0.1-rc4
> 2. Wahrscheinlich mu=DFt Du uuid_fixer auf alle pv=B4s anwenden.
> 3. Das letzte Backup zur=FCckspielen
>=20
> Gru=DF
> Uli
>=20
> * CC. Spindler <ccspindler@prs-gmbh.de> [011108 13:50]:
> > Eine verregneten Gru=DF aus Karlsruhe!
> >=20
> > Hallo Herr Mauelshagen
> >=20
> >  Ich habe  ein f=FCr  mich gr=F6=DFeres  Problem mit lvm.   Ich=20
> habe  aus 10
> > Platten  nach un  nach ein  logisches Volume  gebildet.=20
> Dann  habe ich
> > versucht mit  pvmove zwei  Platten zu verschieben  und mit =20
> vgsplit zu
> > entfernen.   Leider hat  es aber  nicht geklappt.   Dann=20
> habe  ich mit
> > pvchange die beiden Platten  deaktiviert und konnte mit=20
> resize2fs etc.
> > die Gr=F6=DFe  anpassen. Und  die Daten waren  bis auf wenige =20
> Fehler noch
> > vorhanden.=20
> >=20
> >   Nach dem  ich nun  einen Reboot durch  gef=FChrt habe, geht=20
>  nix mehr.
> > vgchange meint, da=DF es keine VGs finden kann. Und vgscan ergibt
> > folgende Ausgabe:
> >=20
> >=20
> =
----------------------------------------------------------------------
> > host:/etc# vgscan=20
> > vgscan
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- found inactive volume group "pool"
> > vgscan -- only found 12353 of 12675 LEs for LV /dev/pool/pool_lv =
(0)
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of=20
> LV" can't get data of volume group "pool" from physical volume(s)
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of=20
> LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"
> >=20
> =
----------------------------------------------------------------------
> >=20
> > Ich benutze:=20
> >=20
> >   - den 2.4.9 Kernel mit lvm version 0.9.1_beta2
> >   - Debian testing
> >   - und die Debian packete von ihrem ftp-Server:
> >       =20
> >        liblvm-iop10_0.9.1.beta7-1_i386.deb
> >        lvm-base_1.1-1_i386.deb
> >        lvm-iop10_0.9.1.beta7-1_i386.deb
> >=20
> >=20
> > Wenn  sie mir  irgendwie weiter  helfen k=F6nnen,  wie ich =20
> die Daten/LV
> > wieder  bekommen kann, wenn  auch nur  in Teilen,  dann=20
> w=E4re  ich sehr
> > dankbar. Vielleicht  k=F6nnen sie mir auch  genau sagen, wie =20
> ich das LV
> > splitten  kann.  Ich  hatte  jedes  mal beim  Aufruf  von=20
> pvmove  eine
> > Fehlermeldung  bekommen  (die genaue  Meldung  habe  ich=20
> leider  nicht
> > mehr).  Sie lautete  in etwa:  noch 65536  nicht gelesen. =20
> Und deshalb
> > funktionierte auch vgsplit nicht.
> >=20
> >=20
> >   Vielen Dank im voraus f=FCr ihre Hilfe.
> >=20
> >   CC. Spindler
> >=20
> =20
> --=20
> 'The box said, 'Requires Windows 95 or better', so i=20
> installed Linux - TKK 5
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
