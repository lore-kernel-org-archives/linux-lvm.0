Return-Path: <josv@osp.nl>
From: josv@osp.nl
Date: Mon, 25 Jun 2001 14:54:52 +0200
Subject: Re: [linux-lvm] Why vgscan not in kernel?
Message-ID: <20010625145452.K592@gatekeeper.osp.nl>
References: <353310000.993472523@dizzy> <3B3733F0.94A5F040@qis-systemhaus.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3B3733F0.94A5F040@qis-systemhaus.de>; from heinrichs@qis-systemhaus.de on Mon, Jun 25, 2001 at 02:52:00PM +0200
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

If the VG scan process is in the kernel, that means that it
will *always* be executed (unless there is a kernel command
line option to disable it).

The issue then is that the VGSCAN in the kernel should be
*completely* resistant against every possible data corruption
and should be able to recover from it gracefully. This is not
as easy as it looks.

With VG scan in a separate executable, it is easier to prevent
it from executing...

++Jos


And thus it came to pass that Dirk Heinrichs wrote:
(on Mon, Jun 25, 2001 at 02:52:00PM +0200 to be exact)

> Steven Lembark wrote:
> >=20
> > >> upon boot, SCSI and IDE drivers check harddrives attached to the dev=
ice
> > >> for partitions. Wouldn't it be better to have similar functionality
> > >> (scanning for VG's) for LVM in the kernel, instead of using a userla=
nd
> > >> command?
> >=20
> > It is rather dangerous unless you have a separate kernel w/o LVM or
> > a boot option (e.g., -lm) that allows booting with LVM turned off.
> > Otherwise you can easily end up unable to reboot with a corrupt LVM
> > system.
> I don't get the point here. Why is it dangerous to move the VG scan from
> vgscan into the kernel module? Why should this corrupt LVM? Can you
> explain this in more detail?
>=20
> Bye...
>=20
> 	Dirk
> --=20
> Dirk Heinrichs		| Tel:	+49 (0)241 413 260
> Configuration Manager	| Fax:	+49 (0)241 413 2640
> QIS Systemhaus GmbH	| Mail:	dheinrichs@qis-systemhaus.de
> J=EF=BF=BDlicher Str. 338b	| Web:	http://www.qis-systemhaus.de
> D-52070 Aachen		| ICQ#:	110037733
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20
With all the things you are losing,
You might as well resign yourself,
And try and make a change...
