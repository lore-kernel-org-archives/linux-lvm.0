From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
Message-ID: <20020513112912.G31182@connectlive.com>
References: <20020510072608.GA1001@tykepenguin.com> <1021071171.17474.44.camel@UberGeek> <671160000.1021077884@[192.168.200.4]> <20020511192728.GB3125@colombina.comedia.it> <3CDF8482.7010109@lausch.at> <20020513073337.A31182@connectlive.com> <3CDFE39B.1080903@lausch.at>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3CDFE39B.1080903@lausch.at>; from mla@lausch.at on Mon, May 13, 2002 at 06:02:35PM +0200
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
Date: Mon May 13 11:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

> > We're going that route.
> >=20
>=20
> which may backfire, if both nodes think the other one is down (split=20
> brain again) and start the shutdown procedure. okay, this is a very rare =

> situation, and may happen only under strange load and scheduling=20
> parameters, but it will happen as any other "very rare situation"=20
> happens ;-). especially in HA environments they seem to happen much more =

> often then in simple single point of failure environments ;-) you won'=EF=
=BF=BDt=20
> loosew your filesystem, but the service is unavailable.

Probably possible, unlikely in practice, however.  In any event, we have
constructed a load-sharing off-site node that recieves redirected
traffic via GSLB if the main node dies, so we have some time to wander
over to the datacenter and kick one of the HA nodes.  Writes can't
happen for a few minutes, but we're not recording financial transactions
directly, and email notices of any pending purchases just queue up in
the meantime.  This solution was not really what I had initially
planned, but it was a stipulation of a large contract we bid on (and
won), so we just went ahead and built it.  Better to hobble along for a
while during a problem, than to just fall over dead.  Meanwhile, the
issue of incremental backups (eg. to recover from user errors) is, at
least in my environment, fairly well handled by using CVS for code and
nightly rsync's for so-called 'static' files (a misnomer, but 'static'
in the sense that we only keep one revision kicking around :-)).

I've seen an awful lot of high-availability systems in production, and
the one I liked most (because it never seemed to cause problems) was the
IBM HACMP cluster(s) at IBM Microelectronics.  Until that becomes a
reasonable possibility for Linux, I guess we'll just stick to multiple
levels of redundancy and failover, the good old 'two safety nets are
better than one' theory...

The HACMP guys were the ones who suggested STONITH for Linux; while your
split-brain scenario could lead to both nodes losing power, this is not
as big of an issue (with journaled filesystems) as would be corruption.


--=20
    "The most valuable piece of equipment in the darkroom
     is the trash can."
                                  --Ansel Adams
