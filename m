From: "Markus Baertschi" <markus@markus.org>
In-Reply-To: <200309101538.54429.krienke@uni-koblenz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Devices seen twice - how does LVM handle ?
Message-Id: <E19x9cD-0006C5-SW@server2.hostpoint.ch>
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
Date: Wed Sep 10 13:24:01 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Rainer,

I'm=20using=20fiber=20cards=20coming=20with=20a=20load-balancing=20driver=20=
and=20a=20SAN-Storage
box=20(IBM=20FastT=20700)=20box.=20Unfortunately=20the=20storage-controlle=
s=20got=20reconfigured
to=20accommodate=20more=20devices=20on=20other=20ports.=20This=20broke=20t=
he=20configuration=20for=20me.
As=20it=20happens=20I=20found=20out=20a=20couple=20of=20months=20later=20w=
hen=20the=20new=20devices=20were
in=20production=20(We=20reboot=20out=20servers=20only=20when=20necessary).=
=20I=20can=20not=20fix=20the
configuration=20immediately=20and=20am=20trying=20to=20find=20out=20how=20=
to=20survive=20best
until=20I=20can=20fix=20the=20real=20problem=20it.

At=20the=20moment=20I'm=20pulling=20a=20fiber=20to=20have=20only=20one=20p=
ath=20as=20the=20installed=20LVM
version=20(0.9beta=20?)=20just=20crashes=20if=20is=20sees=20two=20devices=20=
pointing=20to=20the=20
same=20disk.
The=20most=20recent=20version=20(1.0.7)=20does=20not=20have=20this=20probl=
em.=20It=20allows=20me
the=20keep=20both=20fibers=20connected.=20But=20I=20don't=20know=20how=20i=
t=20handles=20this=20situation
and=20started=20this=20discussion=20to=20find=20out.

Markus


>It=20did=20not=20follow=20this=20discussion=20right=20from=20the=20start,=
=20so=20I=20might=20have=20mis=3D
>sed=3D20
>something...

>We=20are=20running=203=20fileservers=20with=20raid=20devices=20attached=20=
by=20fibrechannel.=20Si=3D
>nce=3D20
>each=20divice=20can=20be=20reached=20by=202=20seperate=20io=20paths=20we=20=
are=20using=20a=20multipath=3D
>=3D20
>setup=20based=20on=20the=20md=20interface=20(on=20top=20of=20the=20multip=
ath=20md=20devices=20we=3D20
>finally=20run=20a=20software=20mirror=20(raid1)).=20This=20works=20just=20=
fine=20for=20our=20server=3D
>s=3D20
>(running=20suse8.2)=20.=20=20At=20the=20beginning=20we=20also=20had=20tro=
uble=20with=20lvm1=20since=20i=3D
>t=3D20
>was=20able=20to=20see=20the=20volume=20on=20different=20levels=20of=20abs=
traction:=20lvm=20scanned=3D
>=3D20
>the=20real=20disks,=20it=20also=20scanned=20the=20md=20multipath=20metade=
vice=20and=20this=20probab=3D
>ly=3D20
>led=20to=20the=20bad=20behaviour=20that=20whenever=20creating=20new=20log=
ical=20volumes=20the=3D20
>complete=20configuration=20was=20invalid=20and=20so=20all=20data=20lost.=3D=
20

>We=20then=20changed=20to=20lvm2=20since=20it=20has=20the=20ability=20to=20=
specify=20which=20devices=20t=3D
>o=3D20
>scan=20for=20lvm=20metadata=20and=20since=20then=20everything=20works=20f=
ine.=20=3D20

>Rainer



--
=20=20Markus=20Baertschi=20=20=20=20=20=20=20=20=20=20=20=20=20Phone:=20++=
41=20(21)=20807=201677
=20=20Bas=20du=20Ross=E9=2014b=20=20=20=20=20=20=20=20=20=20=20=20=20Fax=20=
=20:=20++41=20(21)=20807=201678
=20=20CH-1163,=20Etoy=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Email=
:=20markus@markus.org
=20=20Switzerland=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Hom=
epage:=20www.markus.org
