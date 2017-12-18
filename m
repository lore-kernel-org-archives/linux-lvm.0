References: <72381975.739900.1513623186634.ref@mail.yahoo.com>
	<72381975.739900.1513623186634@mail.yahoo.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <eab88709-2581-97b7-707b-8423022670b1@redhat.com>
Date: Mon, 18 Dec 2017 23:43:57 +0100
MIME-Version: 1.0
In-Reply-To: <72381975.739900.1513623186634@mail.yahoo.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm filter regex format
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 18.12.2017 v 19:53 matthew patton napsal(a):
>>  =C2=A0  https://github.com/jthornber/lvm2-ejt/blob/master/libdm/regex/p=
arse_rx.h
>  =20
> not to be ungrateful but why on earth would one NOT use the glibc standar=
d regex library? Nobody cares about pointless optimization. Surprises like =
"well, we only implemented most of the spec" are what drives people nuts!
>=20
> I agree this particular length-based match is rather odd but there are pl=
enty of useful examples I am sure that could benefit from {x,y} notation.


Such code was actually written long time ago - but since the syntax of=20
standard glibc  regex accepts slightly different strings - it would be an=20
incompatible change - so it's been considered now worth breaking the=20
compatibility at that time...


Regards

Zdenek
