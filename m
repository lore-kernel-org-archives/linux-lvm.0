Return-Path: <ragnark@stine.vestdata.no>
Date: Sun, 17 Dec 2000 03:00:21 +0100
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Debian packaging
Message-ID: <20001217030021.A29319@vestdata.no>
References: <Pine.LNX.4.30.0012141645040.17005-100000@falka.mfa.kfki.hu> <00121417221738.00826@lyta>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <00121417221738.00826@lyta>; from Russell Coker on Thu, Dec 14, 2000 at 05:22:17PM +0100
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com
Cc: Tamas Gergely <dice@mfa.kfki.hu>

On Thu, Dec 14, 2000 at 05:22:17PM +0100, Russell Coker wrote:
> I was thinking that perhaps what I should do is have /sbin/lvm-ver and=20
> /lib/lvm-ver directories where "ver" is the version of LVM in question.  =
Then=20
> at boot time there is a script that determines the version of LVM in the =

> kernel and creates sym-links from /sbin and /lib to the correct directori=
es. =20
> This is REALLY ugly, but it enables a user to cleanly have a machine that=
 can=20
> be booted on 2.2 or 2.4 kernel and just work each time you boot it.
>=20
> Any better suggestions?

What about putting shell-scripts in /sbin, and have theese scripts
execute the real programs?

It adds a little more overhead to all lvm-commands, but you avoid the
need for setting anything up at boot-time.


--=20
Ragnar Kj=EF=BF=BDrstad
