From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Segmentation fault in vgscan
Message-ID: <20030822145330.J8426@sistina.com>
References: <20030822130145.I8426@sistina.com> <E19qASV-0007ji-AX@server2.hostpoint.ch>
Mime-Version: 1.0
In-Reply-To: <E19qASV-0007ji-AX@server2.hostpoint.ch>; from markus@markus.org on Fri, Aug 22, 2003 at 01:51:44PM +0200
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
Date: Fri Aug 22 08:01:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Aug 22, 2003 at 01:51:44PM +0200, Markus Baertschi wrote:
>=20
> Heinz,
>=20
> It looks like I'll be able to test stuff sometimes next week.

Please do so.

> Is these anything I can do to help pinpoint the problem ?

Let's wait if it is reproducable with 1.0.7.

Can you make sure that you generate the software from scratch
and fo a full install which makes sure that you really use the 1.0.7
lib as well (configure ; make ; make install) ?

>=20
> Markus
>=20
> On Fri, 22 Aug 2003 13:01:45 +0200, Heinz J . Mauelshagen wrote:
>=20
> >On Fri, Aug 22, 2003 at 12:50:36PM +0200, Markus Baertschi wrote:
> >>=20
> >> Heinz,
> >>=20
> >> I'm pretty sure I've tested with 1.0.7. Look at the lines
>=20
> >Well, I derived the line numbers from the respective sources.
>=20
> >>=20
> >> >> lblsapq00:~ # gdb ./LVM/1.0.7/tools/vgscan
> >>   ...
> >> >> (gdb) run
> >> >> Starting program: /root/./LVM/1.0.7/tools/vgscan
> >>=20
> >> The other problem is that this is at a customer site on
> >> production machines. I can test the next time I'm there
> >> and got machine time to do some testing. This will happen
> >> as soon as the SAN support guys come back to me to solve
> >> the undelying problem (disks visible twice).
>=20
> >Ok.
>=20
> >Regards,
> >Heinz    -- The LVM Guy --
>=20
>=20
> --
>   Markus Baertschi             Phone: ++41 (21) 807 1677
>   Bas du Ross=E9 14b             Fax  : ++41 (21) 807 1678
>   CH-1163, Etoy                Email: markus@markus.org
>   Switzerland                  Homepage: www.markus.org
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
