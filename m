From: "Markus Baertschi" <markus@markus.org>
In-Reply-To: <20030822145330.J8426@sistina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Segmentation fault in vgscan
Message-Id: <E19x3nM-0004NR-Ng@server2.hostpoint.ch>
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
Date: Wed Sep 10 07:11:01 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Heinz,

Finally=20I've=20been=20able=20to=20test=20again.=20The=20problem,=20as=20=
you=20suspected
is=20on=20my=20side.=20During=20my=20first=20test=20I=20didn't=20run=20'ma=
ke=20install'.
The=20commands=20were=20the=20new=20ones,=20but=20the=20library=20was=20th=
e=20old=20one.
After=20installing=20properly=20the=20segfault=20went=20away.

Thanks=20for=20your=20support=20!

Markus

On=20Fri,=2022=20Aug=202003=2014:53:30=20+0200,=20Heinz=20J=20.=20Mauelsha=
gen=20wrote:

>On=20Fri,=20Aug=2022,=202003=20at=2001:51:44PM=20+0200,=20Markus=20Baerts=
chi=20wrote:
>>=20
>>=20Heinz,
>>=20
>>=20It=20looks=20like=20I'll=20be=20able=20to=20test=20stuff=20sometimes=20=
next=20week.

>Please=20do=20so.

>>=20Is=20these=20anything=20I=20can=20do=20to=20help=20pinpoint=20the=20p=
roblem=20?

>Let's=20wait=20if=20it=20is=20reproducable=20with=201.0.7.

>Can=20you=20make=20sure=20that=20you=20generate=20the=20software=20from=20=
scratch
>and=20fo=20a=20full=20install=20which=20makes=20sure=20that=20you=20reall=
y=20use=20the=201.0.7
>lib=20as=20well=20(configure=20;=20make=20;=20make=20install)=20?

>>=20
>>=20Markus
>>=20
>>=20On=20Fri,=2022=20Aug=202003=2013:01:45=20+0200,=20Heinz=20J=20.=20Mau=
elshagen=20wrote:
>>=20
>>=20>On=20Fri,=20Aug=2022,=202003=20at=2012:50:36PM=20+0200,=20Markus=20B=
aertschi=20wrote:
>>=20>>=20
>>=20>>=20Heinz,
>>=20>>=20
>>=20>>=20I'm=20pretty=20sure=20I've=20tested=20with=201.0.7.=20Look=20at=20=
the=20lines
>>=20
>>=20>Well,=20I=20derived=20the=20line=20numbers=20from=20the=20respective=
=20sources.
>>=20
>>=20>>=20
>>=20>>=20>>=20lblsapq00:~=20#=20gdb=20./LVM/1.0.7/tools/vgscan
>>=20>>=20=20=20...
>>=20>>=20>>=20(gdb)=20run
>>=20>>=20>>=20Starting=20program:=20/root/./LVM/1.0.7/tools/vgscan
>>=20>>=20
>>=20>>=20The=20other=20problem=20is=20that=20this=20is=20at=20a=20custome=
r=20site=20on
>>=20>>=20production=20machines.=20I=20can=20test=20the=20next=20time=20I'=
m=20there
>>=20>>=20and=20got=20machine=20time=20to=20do=20some=20testing.=20This=20=
will=20happen
>>=20>>=20as=20soon=20as=20the=20SAN=20support=20guys=20come=20back=20to=20=
me=20to=20solve
>>=20>>=20the=20undelying=20problem=20(disks=20visible=20twice).
>>=20
>>=20>Ok.
>>=20
>>=20>Regards,
>>=20>Heinz=20=20=20=20--=20The=20LVM=20Guy=20--
>>=20
>>=20
>>=20--
>>=20=20=20Markus=20Baertschi=20=20=20=20=20=20=20=20=20=20=20=20=20Phone:=
=20++41=20(21)=20807=201677
>>=20=20=20Bas=20du=20Ross=E9=2014b=20=20=20=20=20=20=20=20=20=20=20=20=20=
Fax=20=20:=20++41=20(21)=20807=201678
>>=20=20=20CH-1163,=20Etoy=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
Email:=20markus@markus.org
>>=20=20=20Switzerland=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
Homepage:=20www.markus.org
>>=20
>>=20
>>=20
>>=20_______________________________________________
>>=20linux-lvm=20mailing=20list
>>=20linux-lvm@sistina.com
>>=20http://lists.sistina.com/mailman/listinfo/linux-lvm
>>=20read=20the=20LVM=20HOW-TO=20at=20http://tldp.org/HOWTO/LVM-HOWTO/

>--=20

>Regards,
>Heinz=20=20=20=20--=20The=20LVM=20Guy=20--

>***=20Software=20bugs=20are=20stupid.
>=20=20=20=20Nevertheless=20it=20needs=20not=20so=20stupid=20people=20to=20=
solve=20them=20***

>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-

>Heinz=20Mauelshagen=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Sistina=20Software=20Inc.
>Senior=20Consultant/Developer=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20Am=20Sonnenhang=2011
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
56242=20Marienrachdorf
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
Germany
>Mauelshagen@Sistina.com=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20+49=202626=20141200
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20FAX=20924446
>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-

>_______________________________________________
>linux-lvm=20mailing=20list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read=20the=20LVM=20HOW-TO=20at=20http://tldp.org/HOWTO/LVM-HOWTO/


--
=20=20Markus=20Baertschi=20=20=20=20=20=20=20=20=20=20=20=20=20Phone:=20++=
41=20(21)=20807=201677
=20=20Bas=20du=20Ross=E9=2014b=20=20=20=20=20=20=20=20=20=20=20=20=20Fax=20=
=20:=20++41=20(21)=20807=201678
=20=20CH-1163,=20Etoy=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Email=
:=20markus@markus.org
=20=20Switzerland=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Hom=
epage:=20www.markus.org
