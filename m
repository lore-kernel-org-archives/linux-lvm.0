Message-ID: <3CDFE39B.1080903@lausch.at>
From: Michael Lausch <mla@lausch.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
References: <20020510072608.GA1001@tykepenguin.com> <1021071171.17474.44.camel@UberGeek> <671160000.1021077884@[192.168.200.4]> <20020511192728.GB3125@colombina.comedia.it> <3CDF8482.7010109@lausch.at> <20020513073337.A31182@connectlive.com>
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
Date: Mon May 13 10:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Tim wrote:

> Or don't, and buy a power supply that you can control from serial, and
> do so -- STONITH, it's called -- Shoot The Other Node In The Head.  Onc=
e
> the power is off, there is no danger of fsck'ing...
>=20
> It's a rather elegant way to solve that problem, IMHO.
>=20
> We're going that route.
>=20

which may backfire, if both nodes think the other one is down (split=20
brain again) and start the shutdown procedure. okay, this is a very rare=20
situation, and may happen only under strange load and scheduling=20
parameters, but it will happen as any other "very rare situation"=20
happens ;-). especially in HA environments they seem to happen much more=20
often then in simple single point of failure environments ;-) you won'=C4=
t=20
loosew your filesystem, but the service is unavailable.
