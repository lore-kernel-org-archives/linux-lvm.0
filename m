From: "Markus Baertschi" <markus@markus.org>
In-Reply-To: <20030822130145.I8426@sistina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Segmentation fault in vgscan
Message-Id: <E19qASV-0007ji-AX@server2.hostpoint.ch>
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
Date: Fri Aug 22 06:53:01 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Heinz,

It=20looks=20like=20I'll=20be=20able=20to=20test=20stuff=20sometimes=20nex=
t=20week.
Is=20these=20anything=20I=20can=20do=20to=20help=20pinpoint=20the=20proble=
m=20?

Markus

On=20Fri,=2022=20Aug=202003=2013:01:45=20+0200,=20Heinz=20J=20.=20Mauelsha=
gen=20wrote:

>On=20Fri,=20Aug=2022,=202003=20at=2012:50:36PM=20+0200,=20Markus=20Baerts=
chi=20wrote:
>>=20
>>=20Heinz,
>>=20
>>=20I'm=20pretty=20sure=20I've=20tested=20with=201.0.7.=20Look=20at=20the=
=20lines

>Well,=20I=20derived=20the=20line=20numbers=20from=20the=20respective=20so=
urces.

>>=20
>>=20>>=20lblsapq00:~=20#=20gdb=20./LVM/1.0.7/tools/vgscan
>>=20=20=20...
>>=20>>=20(gdb)=20run
>>=20>>=20Starting=20program:=20/root/./LVM/1.0.7/tools/vgscan
>>=20
>>=20The=20other=20problem=20is=20that=20this=20is=20at=20a=20customer=20s=
ite=20on
>>=20production=20machines.=20I=20can=20test=20the=20next=20time=20I'm=20t=
here
>>=20and=20got=20machine=20time=20to=20do=20some=20testing.=20This=20will=20=
happen
>>=20as=20soon=20as=20the=20SAN=20support=20guys=20come=20back=20to=20me=20=
to=20solve
>>=20the=20undelying=20problem=20(disks=20visible=20twice).

>Ok.

>Regards,
>Heinz=20=20=20=20--=20The=20LVM=20Guy=20--


--
=20=20Markus=20Baertschi=20=20=20=20=20=20=20=20=20=20=20=20=20Phone:=20++=
41=20(21)=20807=201677
=20=20Bas=20du=20Ross=E9=2014b=20=20=20=20=20=20=20=20=20=20=20=20=20Fax=20=
=20:=20++41=20(21)=20807=201678
=20=20CH-1163,=20Etoy=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Email=
:=20markus@markus.org
=20=20Switzerland=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Hom=
epage:=20www.markus.org
