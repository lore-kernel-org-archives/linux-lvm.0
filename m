Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A643448@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] HUGE LVM log file...
Date: Tue, 17 Jul 2001 16:52:21 -0500
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Is there a how-to or cookbook type doc which tells how/why you should =
setup
your LE/PE's? Outter tracks/inner tracks, speed areas, etc?
Theory around this is a good thing with relation to LVM and using it. =
Any
ideas on that?

--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com=20

> -----Original Message-----
> From: Wolfgang Weisselberg [mailto:weissel@netcologne.de]
> Sent: Tuesday, July 17, 2001 4:29 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] HUGE LVM log file...
>=20
>=20
> Guennadi Liakhovetski (g.liakhovetski@ragingbull.com) wrote 23 lines:
>=20
> > > > My /var/log/lvm has grown up to 800MB+... and has=20
> filled up the disk...
>=20
> > > lvmsadc is probably filling it run by cron.
>=20
> > Thanks! But why / what for is it needed and why is it=20
> created by default
>=20
> man lvmsadc:=20
>        lvmsadc collects the read/write statistics of the  logical
>        volume  manager  to the file "LogFilePath" or to stdout if
>        no LogFilePath is given.  You should create a  cron  entry
>        for lvmsadc which runs it at regular intervals eg. 10 min=AD
>        utes.
>=20
> That statistical info can be later used to e.g. decide which
> LEs shoud have PEs at the faster 'begin' (outer edge) of the
> HD.  An automatic LE mover program has not been written yet.
>=20
> -Wolfgang
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
