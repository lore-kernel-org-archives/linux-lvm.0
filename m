From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Jemand zuhause ???
Message-ID: <20020625114708.B14860@sistina.com>
References: <200206232206.g5NM6KD04426@hphbbs.localnet>
Mime-Version: 1.0
In-Reply-To: <200206232206.g5NM6KD04426@hphbbs.localnet>; from hph@hphbbs.ruhr.de on Mon, Jun 24, 2002 at 12:06:15AM +0200
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
Date: Tue Jun 25 04:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Jun 24, 2002 at 12:06:15AM +0200, hph@hphbbs.ruhr.de wrote:
> Hallo? Jemand zuhause ???

Well there is a couple of us here ;-)

Because this is an English language list, please send any further
email in English.

I'll translate for the rest of us...

>=20
> Erreicht man unter dieser Adresse DEN Heinz-Maulshagen?
> Is THE Heinz Mauelshagen reachable via this address?

Yes :)

> Ich h=E4tte  da ein paar Bauchschmerzen mit dem LVM:
> I'ld have some stomach ake IRT the LVM:

Well, go visit the doctor ;-)

> 	- 'cluster exclusive'-flag
> 	- 'cluster lock disk'
Define what you mean with those, please.

The LVM 1.1 unstable developement branch has 'static mode' support for vo=
lume
groups, which enables volume group configuration on a single node while
all other nodes need to have the volume group inactive, then you set the
volume group to static mode, vgscan on all other nodes and activate it th=
ere.
You can't change the volume group while it is in static mode.
It is just meant to be a simple helper to use single mode LVM1 in cluster=
s.

Maybe 'static mode' could cover your 'cluster lock disk'?

Waiting for your definitons to be sure...


> 	- Unterst=FCtzung f=FCr LVM generell in ver`cluster'ten Umgebungen
>       - Support for LVM in clustered environments.

We will release Cluster LVM for Linux this summer as a comercial product,
which will support all single node LVM commands in the cluster enabling y=
ou
to do all configuration changes to your shared volume groups and shared
logical volumes while they are accessed.

Please be aware that in order to make use of those shared volume groups a=
nd
logical volumes, you need to combine them with a cluster capable so calle=
d
shared disk filesystem (such as Sistinas Global Filesystem aka GFS) or
any cluster capable application.=20

The advantage of a shared disk filesystem on top of a Cluster LVM is that
non cluster capable applications (such as Web-Servers) run on this combin=
ation
giving you cluster scalability and redundancy on extreme cheap hardware
without affording for your applications to become cluster aware.

>=20
>=20
> Beste Gr=FC=DFe,
> Peter Heidinger
> --=20
> #--------- H.P. Heidinger, Steeler Str. 121, 45138 Essen /Germany -----=
-----#
> # Tel: +49-201: 8903091 (ISDN)  # 287802 (voice) # 287803 (analog data/=
FAX)
> # Web-Page: http://Heinz-Peter.Heidinger.bei.T-Online.de
> # -------------------- MicroSoft Pollution Survivor -------------------=
------
>=20
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
