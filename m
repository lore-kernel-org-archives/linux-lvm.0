From: "Markus Baertschi" <markus@markus.org>
In-Reply-To: <20030910114840.13991.qmail@web42002.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <E19x4eC-0008Oa-VB@server2.hostpoint.ch>
Subject: [linux-lvm] Devices seen twice - how does LVM handle ?
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
Date: Wed Sep 10 08:05:01 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

For=20reasons=20too=20complicate=20to=20explain=20here=20our=20SAN=20confi=
guration=20is
broken.=20The=20effect=20is=20that=20linux=20sees=20the=20san=20disks=20tw=
ice.=20The=20originally
installed=20'vgscan'=20was=20responding=20with=20a=20segfault=20to=20this=20=
situation.
After=20the=20installation=20of=20the=20latest=20release=20(1.0.7)=20vgsca=
n=20is=20fine
and=20the=20volumegroup=20comes=20up.

However,=20does=20LVM=20handles=20this=20situation=20(disks=20visible=20tw=
ice)=20nicely=20?
or=20should=20I=20continue=20to=20use=20my=20workaround=20(pull=20a=20fibe=
r)=20to=20make=20sure
the=20disks=20are=20visible=20only=20once=20?
-=20Are=20there=20risks=20of=20corruption=20?
-=20What=20happens=20if=20the=20path=20the=20LVM=20happens=20to=20use=20br=
eaks,=20but=20the=20other
is=20still=20up.=20Will=20LVM=20handle=20fail-over=20?

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
