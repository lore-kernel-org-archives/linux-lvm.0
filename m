References: <83DAD1FF-6CE0-4725-A24D-2AE529433AEE@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <8f19f639-107d-610d-0083-596d0c21a081@redhat.com>
Date: Sun, 30 Aug 2020 19:33:06 +0200
MIME-Version: 1.0
In-Reply-To: <83DAD1FF-6CE0-4725-A24D-2AE529433AEE@gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>

Dne 30. 08. 20 v 1:25 Tomas Dalebj=EF=BF=BDrk napsal(a):
> hi
>=20
> I am trying to find out what limitations exists in LVM2
>=20
> nr of logical volumes allowed to be created per volume group
>=20

Hi

There is no 'strict' maximum in term of we would limit to i.e. 10000LV per =
VG.

It's rather limitation from overall practical usability and the space you
may need to allocate to store the metadata  (pv/vgcreate --metadatasize)

The bigger the metadata gets with more LVs - the slower the performance of =

processing gets (as there is rather slow code doing all sorts of validation=
).
You need much bigger metadata areas during 'pv/vgcreate' to be prepared AHE=
AD
of time (since lvm2 does not support expansion of metadata space).

For illustration  for 12.000 LVs you need ~4MiB just store Ascii metadata=20
itself, and you need metadata space for keeping at least 2 of them.

Handling of operations like  'vgremove' with so many LVs requires=20
signification amount of your CPU time.

Basically to stay within bounds - unless you have very good reasons
you should probably stay in range of low thousands to keep lvm2 performing
reasonably well.

If there would be some big reason to support 'more' - it's doable - but=20
currently it's deep-down on the TODO list ;)

Zdenek
