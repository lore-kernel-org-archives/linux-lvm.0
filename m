Return-Path: <root@srv.sistina.com>
Date: Tue, 26 Jun 2001 01:13:08 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Why vgscan not in kernel?
Message-ID: <20010626011308.B23215@sistina.com>
References: <353310000.993472523@dizzy> <3B3733F0.94A5F040@qis-systemhaus.de> <20010625145452.K592@gatekeeper.osp.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010625145452.K592@gatekeeper.osp.nl>; from josv@osp.nl on Mon, Jun 25, 2001 at 02:54:52PM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Jun 25, 2001 at 02:54:52PM +0200, josv@osp.nl wrote:
> If the VG scan process is in the kernel, that means that it
> will *always* be executed (unless there is a kernel command
> line option to disable it).
>=20
> The issue then is that the VGSCAN in the kernel should be
> *completely* resistant against every possible data corruption
> and should be able to recover from it gracefully. This is not
> as easy as it looks.

Jos,

that's true. We'll try to provide that kind of redundancy/resistancy in a
post 1.0 release by having

 - checksums on all VGDA structures
 - two copies of the VGDA and
 - transaction oriented updates to VGDA contents

This should give us enough power to recover from a lot of potential cases.

BTW: there's will be a flag to switch init time activation per VG on and of=
f.

Regards,
Heinz    -- The LVM Guy --


>=20
> With VG scan in a separate executable, it is easier to prevent
> it from executing...
>=20
> ++Jos
>=20
>=20
> And thus it came to pass that Dirk Heinrichs wrote:
> (on Mon, Jun 25, 2001 at 02:52:00PM +0200 to be exact)
>=20
> > Steven Lembark wrote:
> > >=20
> > > >> upon boot, SCSI and IDE drivers check harddrives attached to the d=
evice
> > > >> for partitions. Wouldn't it be better to have similar functionality
> > > >> (scanning for VG's) for LVM in the kernel, instead of using a user=
land
> > > >> command?
> > >=20
> > > It is rather dangerous unless you have a separate kernel w/o LVM or
> > > a boot option (e.g., -lm) that allows booting with LVM turned off.
> > > Otherwise you can easily end up unable to reboot with a corrupt LVM
> > > system.
> > I don't get the point here. Why is it dangerous to move the VG scan from
> > vgscan into the kernel module? Why should this corrupt LVM? Can you
> > explain this in more detail?
> >=20
> > Bye...
> >=20
> > 	Dirk
> > --=20
> > Dirk Heinrichs		| Tel:	+49 (0)241 413 260
> > Configuration Manager	| Fax:	+49 (0)241 413 2640
> > QIS Systemhaus GmbH	| Mail:	dheinrichs@qis-systemhaus.de
> > J=EF=BF=BDlicher Str. 338b	| Web:	http://www.qis-systemhaus.de
> > D-52070 Aachen		| ICQ#:	110037733
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
> --=20
> With all the things you are losing,
> You might as well resign yourself,
> And try and make a change...
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
