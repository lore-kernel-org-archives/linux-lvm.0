From: "Markus Baertschi" <markus@markus.org>
In-Reply-To: <20030910132010.GC10632@percy.comedia.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Devices seen twice - how does LVM handle ?
Message-Id: <E19x7pQ-0006HO-Q5@server2.hostpoint.ch>
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
Date: Wed Sep 10 11:29:02 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Hi=20Luca,

On=20Wed,=2010=20Sep=202003=2015:20:11=20+0200,=20Luca=20Berra=20wrote:
>>However,=20does=20LVM=20handles=20this=20situation=20(disks=20visible=20=
twice)=20nicely=20?
>does=20not=20seem=20broken=20to=20me=20if=20you=20have=20two=20hba.
>lvm=20does=20not=20support=20multipath

What=20does=20LVM=20do=20if=20it=20sees=20two=20paths=20(/dev/sdx1=20entri=
es)=20to=20the=20same
virtual=20disk=20?

>>or=20should=20I=20continue=20to=20use=20my=20workaround=20(pull=20a=20fi=
ber)=20to=20make=20sure
>>the=20disks=20are=20visible=20only=20once=20?
>it=20is=20not=20a=20nice=20workaround.

Yes,=20but=20the=20only=20one=20I=20got=20to=20work=20in=20the=20timeframe=
=20I=20had=20to=20get=20the
machines=20up=20and=20running=20again.

>>-=20Are=20there=20risks=20of=20corruption=20?
>i=20don't=20think=20so.
Why=20?

>>-=20What=20happens=20if=20the=20path=20the=20LVM=20happens=20to=20use=20=
breaks,=20but=20the=20other
>>is=20still=20up.=20Will=20LVM=20handle=20fail-over=20?
>lvm=20does=20not=20support=20multipath
OK.

>at=20the=20moment=20your=20best=20chance=20is=20setting=20up=20an=20md=20=
multipath
>and=20building=20your=20lvm=20over=20the=20md=20devices.=20be=20sure=20to=
=20use=20mdadm=20instead
>of=20raidtools=20to=20manage=20the=20md.

I'm=20not=20familiar=20with=20md.=20The=20volumes=20are=20already=20there=20=
and=20in=20production,
If=20possible=20I=20don't=20want=20to=20reconfigure=20(downtime...).

>i=20have=20this=20setup=20(2=20hbas=20to=20same=20storage=20with=20lvm=20=
over=20md=20multipath)=20in
>production,=20and=20it=20works=20fine.
>another=20option=20could=20be=20if=20your=20hba=20driver=20handles=20mult=
ipath.=20i=20know
>some=20qlogic=20boards=20do.

I'm=20using=20qlogic=20boards=20with=20the=20qla2300=20failover=20driver.=20=
This=20was=20working
perfectly=20until=20someone=20installed=20a=20blade=20center=20on=20unrela=
ted=20ports
of=20the=20same=20storage=20box=20and=20changed=20the=20WWN=20of=20the=20b=
ox=20in=20the=20process.
The=20linux=20servers=20were=20rebooted=20three=20months=20(!)=20later=20f=
or=20an=20unrelated
purpose=20and=20promptly=20failed=20to=20come=20up=20(vgscan=20segfault...=
).=20The=20failover
driver=20now=20thinks=20we=20have=20two=20storage=20boxes...

In=20the=20short=20run=20the=20only=20solution=20I=20had=20was=20to=20remo=
ve=20one=20path/fiber.

The=20real=20fix=20is=20to=20reconfigure=20the=20storage=20box,=20but=20th=
is=20has=20to=20be=20done
when=20I=20can=20stop=20all=20servers=20connected=20to=20it=20(sunday=2002=
:00=20AM...).

In=20the=20meantime=20I=20installed=20the=20latest=20LVM=20and=20this=20fi=
xes=20the=20segfault
problem.=20My=20main=20priority=20is=20stability=20right=20now=20and=20I=20=
prefer=20running
on=20one=20fiber=20than=20in=20a=20potentially=20dangerous=20configuration=
.=20The=20fiber
can=20be=20switched=20in=20a=20hurry=20(just=20plug=20in=20the=20other=20o=
ne),=20software=20needs
skills=20the=20local=20people=20don't=20have=20(I'm=20most=20of=20the=20ti=
me=20not=20on=20site).

Markus


--
=20=20Markus=20Baertschi=20=20=20=20=20=20=20=20=20=20=20=20=20Phone:=20++=
41=20(21)=20807=201677
=20=20Bas=20du=20Ross=E9=2014b=20=20=20=20=20=20=20=20=20=20=20=20=20Fax=20=
=20:=20++41=20(21)=20807=201678
=20=20CH-1163,=20Etoy=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Email=
:=20markus@markus.org
=20=20Switzerland=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Hom=
epage:=20www.markus.org
