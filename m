From: "Markus Baertschi" <markus@markus.org>
In-Reply-To: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
Message-Id: <E1ATOFw-0003wR-7w@server6.hostpoint.ch>
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
Date: Mon Dec  8 10:30:03 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Yanick,

If=20you=20are=20looking=20for=20a=20stable=20filesystem=20and=20are=20not=
=20really=20worried
about=20performance=20I'd=20stick=20with=20ext3.=20If=20necessary=20you=20=
can=20get=20a=20kernel
patch=20to=20allow=20for=20online=20resizing.

If=20you=20have=20many=20small=20files=20and=20need=20the=20performance=20=
then=20reiser=20is=20an
option.=20I'm=20worried=20about=20data=20integrity=20with=20Reiser.=20Once=
=20in=20a=20while
a=20stories=20about=20lost=20files=20with=20Reiser=20pops=20up.=20I'll=20b=
e=20more=20confident
when=20all=20these=20stories=20are=20a=20couple=20of=20years=20old.=20Loos=
ing=20data=20is=20the=20one
thing=20I=20don't=20forgive=20a=20filesystem.

There=20is=20an=20extensive=20report=20on=20filesystem=20performance=20on
=20=20=20=20=20=20=20=20=20http://fsbench.netnation.com/

Markus

On=20Mon,=208=20Dec=202003=2009:39:38=20-0500,=20Yanick=20Quirion=20wrote:=


>Hi=20all,

>Could=20you=20please=20tell=20what=20is=20the=20best=20filesystem=20for=20=
linux=20between=20ext3=20and=20reiserfs?

>I=20know=20that=20ext3=20can=20handle=20ACLs=20and=20not=20online=20fs=20=
extend,=20and=20reiserfs=20do=20not=20seems=20to=20support=20
ACLs=20(I=20found=20some=20patches=20for=20kernel=202.4.21,=20but=20there=20=
are=20errors=20when=20I=20apply=20them=20to=20the=20kernel=20
sources),=20but=20can=20be=20extend=20while=20it's=20online.

>I'm=20just=20asking=20for=20your=20personal=20opinion=20and=20knowledge=20=
with=20them.

>Thanks.

>Regards,

>-----------
>Yanick=20Quirion
>Administrateur=20R=E9seau/Network=20Manager
>NEOKIMIA=20INC.
>Institut=20de=20Pharmacologie=20de=20Sherbrooke
>3e=20=E9tage=20(=C9difice=20Z5)
>3001=2012e=20avenue=20Nord
>Sherbrooke,=20Qu=E9bec
>CANADA
>J1H=205N4
>=20
>T=E9l.:=20=20=20=20+1=20819=20820-6040
>Direct:=20=20+1=20819=20820-6855
>Fax.:=20=20=20=20+1=20819=20820-6841
>=20
>email:=20Yanick.Quirion@neokimia.com


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
