Return-Path: <root@srv.sistina.com>
Date: Wed, 18 Jul 2001 16:55:28 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] HUGE LVM log file...
Message-ID: <20010718165528.B24438@sistina.com>
References: <20010717131430.A17345@sistina.com> <Pine.LNX.4.31.0107171225320.12608-100000@erdos.shef.ac.uk> <20010717232842.A6067@tiger.bigcats.invalid>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010717232842.A6067@tiger.bigcats.invalid>; from weissel@netcologne.de on Tue, Jul 17, 2001 at 11:28:42PM +0200
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

On Tue, Jul 17, 2001 at 11:28:42PM +0200, Wolfgang Weisselberg wrote:
> Guennadi Liakhovetski (g.liakhovetski@ragingbull.com) wrote 23 lines:
>=20
> > > > My /var/log/lvm has grown up to 800MB+... and has filled up the dis=
k...
>=20
> > > lvmsadc is probably filling it run by cron.
>=20
> > Thanks! But why / what for is it needed and why is it created by default
>=20
> man lvmsadc:=20
>        lvmsadc collects the read/write statistics of the  logical
>        volume  manager  to the file "LogFilePath" or to stdout if
>        no LogFilePath is given.  You should create a  cron  entry
>        for lvmsadc which runs it at regular intervals eg. 10 min=EF=BF=BD
>        utes.

Well, it should rather say: "If you want to have I/O statistics at hand
for performance tuning, you could create a cron entry..."

Will change that.

>=20
> That statistical info can be later used to e.g. decide which
> LEs shoud have PEs at the faster 'begin' (outer edge) of the
> HD.  An automatic LE mover program has not been written yet.

Well, it depends on the brand/model, if the outer edge is the fast area :-)

>=20
> -Wolfgang
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
