From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
Message-ID: <1305350000.1021306987@[192.168.200.4]>
In-Reply-To: <3CDFE39B.1080903@lausch.at>
References: <20020510072608.GA1001@tykepenguin.com>
 <1021071171.17474.44.camel@UberGeek> <671160000.1021077884@[192.168.200.4]>
 <20020511192728.GB3125@colombina.comedia.it> <3CDF8482.7010109@lausch.at>
 <20020513073337.A31182@connectlive.com> <3CDFE39B.1080903@lausch.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Date: Mon May 13 11:23:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

> which may backfire, if both nodes think the other one is down (split
> brain again) and start the shutdown procedure. okay, this is a very rare
> situation, and may happen only under strange load and scheduling
> parameters, but it will happen as any other "very rare situation" happens
> ;-). especially in HA environments they seem to happen much more often
> then in simple single point of failure environments ;-) you won'=C4t =
loosew
> your filesystem, but the service is unavailable.

Nothing will give you 100%: eventually the switchover methods
introduce more marginal P(fail) than the original setup had.
Joy of reliability studies is figuring how to take the first
partial of P(Fail) w/ respect to the switchover systems and
set it to zero... Turns out the most reliable answer is a swag
anyway :-)

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
