From: Gianmichele Murano <gingiabios@email.it>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200309201114.40369.g.murano@vinsoft.it>
Subject: [linux-lvm] i2o devices and lvm Error on LE versus PE
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
Date: Sat Sep 20 07:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

HI  ALL

as first thing, i say hallo to you.

now i tell you my problem:
on a controler raid  (i2o devices) i have a debian distro.
Recently i have enlarged the logical volumes  on this controler.
All seemed ok,  i was able to remount the file systems and to copy and in=
stall=20
programs and data on resized volumes.

So, i was out of office and the development server was tuned off by perso=
n who=20
wasn't me (so i don't know what is the matter, if happened any thing ).

later, when in was in office i have turn on the server and the vgscan fai=
led,=20
it said " ..omissis... only  found 499 of 500  LE for LV=20
/dev/volume1/lgv1(0)" .
I don't undestand what was happened.
It is possible that a bad tuned off make a problem as this?
Any body know the answer?

To solve the trouble i thinked to do in this way:
to reduce the LV lgv1 of some LE , in this way the info about the number =
of LE =20
will rewrite and (i hope) the problem vanish.The idea seems good, isn't?
But i can't do this because the volume group is inactive.
Anybody know a method to active a volume group also if vgscan fail?

Please, i MUST to recove the data on the lv, we don't have a backup polic=
y=20
>:^>=20
