From: "Markus Baertschi" <markus@markus.org>
In-Reply-To: <3FD4A42E.3070609@stercomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
Message-Id: <E1ATOLU-0004dz-1c@server6.hostpoint.ch>
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
Date: Mon Dec  8 10:36:02 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

On=20Mon,=2008=20Dec=202003=2010:17:50=20-0600,=20Chris=20Cox=20wrote:
>We=20love=20the=20ability=20to=20do=20resize_reiserfs=20while=20the=20fil=
esystem=20is=20mounted.
>Constantly=20amazes=20the=20"Unix"=20purists.

This=20is=20the=20one=20feature=20I=20like=20most=20on=20my=20AIX=20boxes,=
=20where=20the=20stock
LVM=20&=20JFS=20setup=20has=20done=20this=20for=20more=20than=20a=20decade=
.

That=20a=20broken=20reiser=20on=20RH=20is=20the=20source=20of=20the=20occa=
siona=20data=20loss=20reported
is=20good=20possibility.=20But=20that=20means=20there=20were=20broken=20re=
iser=20implementations
out=20there=20of=20which=20RH=20assumed=20they=20were=20stable=20and=20the=
y=20weren't.

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
