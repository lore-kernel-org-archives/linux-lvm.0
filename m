References: <2d496550-4609-0a26-489b-8721737c783b@redhat.com>
	<257A9B1C-04AC-4EDE-9671-9E7A60104F9F@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <fad39006-f18f-d15e-b29b-bb7f59a33be1@redhat.com>
Date: Tue, 15 Sep 2020 23:47:53 +0200
MIME-Version: 1.0
In-Reply-To: <257A9B1C-04AC-4EDE-9671-9E7A60104F9F@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm limitations
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
To: =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 15. 09. 20 v 23:24 Tomas Dalebj=C3=B6rk napsal(a):
> thanks
>=20
> ok, lets say that I have 10 LV on a server, and want create a thin lv sna=
pshot every hour and keep that for 30 days
> that would be 24h * 30days * 10lv =3D 720 lv
>=20
> if I want to keep snapshot copies from more nodes, to serve a single repo=
sitory of snapshot copies, than these would easily become several hundred t=
housands of lv
>=20
> not sure if this is a good idea, but I guess it can be very useful in som=
e sense as block level incremental forever and instant recovery can be impl=
emented for open sourced based applications
>=20
> what reflections do you have on this idea?


Hi

You likely don't need such amount of 'snapshots' and you will need to=20
implement something to remove snapshot without need, so i.e. after a day yo=
u=20
will keep maybe 'every-4-hour' and after couple days maybe only a day-level=
=20
snapshot. After a month per-week and so one.

You need to be aware that as soon as your volumes have some 'real-live'
you will soon need to keep many blocks in many 'different' copies which will
surely be reflected by the usage of the pool device itself - aka you will
most likely hit out-of-space sooner then you'll run out of devices.

Speaking of thin volumes - there can be at most 2^24 thin devices
(this is hard limit you've ask for ;)) - but you have only  ~16GiB of metad=
ata=20
to store all of them - which gives you ~1KiB of data per such volume -
quite frankly this is not too much  - unless as said - your volumes
are not changed at all - but then why you would be building all this...

That all said -  if you really need that intensive amount of snapshoting,
lvm2 is likely not for you - and you will need to build something on your o=
wn,
as you will need way more efficient and 'targeted' solution for your purpos=
e.

There is no practical way to change current LVM2 into a tool handling i.e. =

100.000 LV at decent speed - it's never been a target of this tool....


Regards

Zdenek
