References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<83c4026c-5abe-e9e5-ac1d-6ed9e025e660@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b2923ab7-deed-588f-1bc1-c32c154824bc@redhat.com>
Date: Wed, 23 Oct 2019 12:26:40 +0200
MIME-Version: 1.0
In-Reply-To: <83c4026c-5abe-e9e5-ac1d-6ed9e025e660@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>, Zdenek Kabelac <zkabelac@redhat.com>

Dne 22. 10. 19 v 18:13 Dalebj=EF=BF=BDrk, Tomas napsal(a):
> That is cool,
>=20
> But, are there any practical example how this could be working in reality.
>=20

There is not yet a practical example available from our lvm2 team yet.

So we are only describing the 'model' & 'plan' we have ATM...


>=20
> I have created a way to perform block level incremental forever by readin=
g the=20
> -cow device, and thin_dump would be nice replacement for that.


COW is dead technology from our perspective - it can't cope with recent
performance of modern drives like NVMe...

So our plan is to focus on thinp technology here.


Zdenek
