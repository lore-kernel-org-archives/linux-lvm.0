From: Lars Grobe <grobe@gmx.net>
MIME-Version: 1.0
References: <20030708211242.GD8053@questra.com>
Subject: Re: [linux-lvm] Multiple Path possible with LVM ?
Message-ID: <18486.1057708801@www37.gmx.net>
Content-Type: text/plain; charset="iso-8859-1"
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
Date: Tue Jul  8 19:01:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi!=20
=20
> Just put your lvm volume on an md multipath device.  Note=20
> that these are not loadbalanced paths in stock kernels, just=20
> failover paths.=20
=20
Well, in evms 2.1, with 2.4.21 and the md-multipath, I am offered=20
a load-balanced multipath configuration. However, as I currently=20
have the expensive emc module mentioned in the firt mail ;-), I=20
didn't really try this.=20
=20
If you want to have load balancing, just divide each raidset into=20
two luns / "devices", and access each raidset via two paths by this=20
configuration. If you put an lvm-stripeset over those two luns,=20
you get a "load-balanced" access to your raidset over both channels.=20
=20
I am currently doing tests with these configurations, but I have moved=20
to evms with our new fileserver because of some cluster functionality=20
in the 2.x-releases of evms. We have shared storage between two nodes,=20
and while you can do this with lvm, it is AFAIK a bit dangerous because=20
you must make sure that one nodes commits an vgscan if the other one=20
changed the lvm configuration.=20
=20
Good luck, CU Lars.=20

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++

Jetzt ein- oder umsteigen und USB-Speicheruhr als Pr=EF=BF=BDmie sichern!
