References: <cf779b76e25707b8ec3361f55318a1c7@assyoma.it>
	<2F3E7182-B18D-465E-8BE6-97D215A0C9F3@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <86154baa-bcb3-34fb-9c5a-c31169bb4302@redhat.com>
Date: Thu, 17 Sep 2020 21:24:09 +0200
MIME-Version: 1.0
In-Reply-To: <2F3E7182-B18D-465E-8BE6-97D215A0C9F3@gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 16. 09. 20 v 6:25 Tomas Dalebj=C3=B6rk napsal(a):
> thanks for all the good reflections
>=20
> the intention is to see if backups can be done in a much more easy way th=
an have ever been built before

Assuming you have checked projects like 'snapper' ?

> another solution could be to store the lv as file into a larger fs, and s=
napshot these fs that than works as a group;=20

We do not advice/support any user to use device on top of filesystem on top=
=20
another device - this is only good as a 'toy' - never for anything serious =
-=20
it has numerous troubles and the noticeable slower performance is
one the easy one...

> perhaps a snapshot of the origin can be a new master? if that is ok, whic=
h I think is ok, than that will work without a move

With thin-snapshot - each snapshot as just another 'thin' device - so it=20
doesn't really matter what is origin.
You can easily chain snapshot over snapshot over snapshot....


Regards

Zdenek
