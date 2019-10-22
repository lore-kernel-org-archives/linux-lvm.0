References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
Date: Tue, 22 Oct 2019 17:36:50 +0200
MIME-Version: 1.0
In-Reply-To: <def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
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
To: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 22. 10. 19 v 17:29 Dalebj=EF=BF=BDrk, Tomas napsal(a):
> Thanks for feedback,
>=20
> But, it would be better if the cow device could be recreated in a faster =
way,=20
> mentioning that all blocks are present on an external device, so that the=
 LV=20
> volume can be restored much quicker using "lvconvert --merge" command.
>=20
> That would be super cool!
>=20
> Imagine backing up multi terrabyte sized volumes in minutes to external=20
> destinations, and restoring the data in seconds using instant recovery by=
=20
> re-creating or emulating the cow device, and associating all blocks to an=
=20
> external device?
>=20

Hi

I do not want to break your imagination here, but that is exactly the thing=
=20
you can do with thin provisioning and thin_delta tool.

You just work with LV, take snapshot1, take snapshot2,
send delta between  s1 -> s2  to remove machine,
remove s1, take s3, send delta  s2 -> s3...

It's just not automated by lvm2 ATM...

Using this with old snapshot would be insanely inefficient...

Regards

Zdenek
