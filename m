From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Snapshot resizing bug (LVM1)
Message-ID: <20030206194148.B23955@sistina.com>
References: <A00B669E-3934-11D7-A9B9-0003937830E4@mac.com> <20030206112752.B22450@sistina.com> <3E424EDF.CC7A4F56@silicide.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3E424EDF.CC7A4F56@silicide.dk>; from jon+lvm@silicide.dk on Thu, Feb 06, 2003 at 01:02:39PM +0100
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
Date: Thu Feb  6 12:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, Feb 06, 2003 at 01:02:39PM +0100, Jon Bendtsen wrote:
> "Heinz J . Mauelshagen" wrote:
> >=20
> > Dale,
> >=20
> > thanks for finding this bug.
>=20
> yeah, thanks from me too, i plan to TEST it.

Good :)

Please checkout from MAIN.
We reverted 1.0.6 as mentioned in my other email today.

>=20
>=20
> > Obviously people don't resize populated snapshots very often or we'ld
> > seen this one much earlier ;)
>=20
> thats not true. I tried to resize polulated snapshots quite often, like
> several times a day, but i gave up on that because it didnt work. Being
> production machines they need to be stable.
> So, why didnt i report the bug well... i didnt feel i had the time to
> play arround with our production machines, and i have nowhere to test
> it, so i just stopped doing snapshots. But i did email this mailing list
> and described the usage and the errors i got. Not a patch no, but i feel
> it was reported arround the end of october where i ran into it. Possibly
> someone else did it before me.
> See these links for more info:
> http://lists.sistina.com/pipermail/linux-lvm/2002-October/012602.html
>=20
> Okay, maybe i wasnt clear on reporting that problems continued after
> downgrading, sorry about that.
> http://lists.sistina.com/pipermail/linux-lvm/2002-October/012631.html
> =03
>=20
> Not trying to sound negative and all it's great that this bug is gone,
> but i feel that the effects of this bug was seen before. Maybe what is
> needed is a better way to see what is bugs and what is
> missconfiguration.

Maybe we missed the report(s) ? :(
Anyway, it should be gone with your help.

Thanks,
Heinz    -- The LVM Guy --

>=20
>=20
>=20
>=20
> JonB
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
