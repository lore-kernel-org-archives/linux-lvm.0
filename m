References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
	<f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <595ff1d4-3277-ca5e-a18e-d62eaaf0b1a0@redhat.com>
Date: Wed, 13 Sep 2017 21:35:40 +0200
MIME-Version: 1.0
In-Reply-To: <f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 13.9.2017 v 20:43 Xen napsal(a):
>=20
> There is something else though.
>=20
> You cannot set max size for thin snapshots?
>=20

We are moving here in right direction.

Yes - current thin-provisiong does not let you limit maximum number of bloc=
ks=20
individual thinLV can address (and snapshot is ordinary thinLV)

Every thinLV can address  exactly   LVsize/ChunkSize  blocks at most.


> This is part of the problem: you cannot calculate in advance what can hap=
pen,=20
> because by design, mayhem should not ensue, but what if your predictions =
are off?

Great - 'prediction' - we getting on the same page -  prediction is big=20
problem....

> Being able to set a maximum snapshot size before it gets dropped could be=
 very=20
> nice.

You can't do that IN KERNEL.

The only tool which is able to calculate real occupancy - is user-space=20
thin_ls tool.

So all you need to do is to use the tool in user-space for this task.

> This behaviour is very safe on non-thin.
>=20
> It is inherently risky on thin.
>=20
>=20
>=20
>> (I know there are already some listed in this
>> thread, but I=E2=80=99m wondering about those folks that think the scrip=
t is
>> insufficient and believe this should be more standard.)
>=20
> You really want to be able to set some minimum free space you want per vo=
lume.
>=20
> Suppose I have three volumes of 10GB, 20GB and 3GB.
>=20
> I may want the 20GB volume to be least important. The 3GB volume most=20
> important. The 10GB volume in between.
>=20
> I want at least 100MB free on 3GB volume.
>=20
> When free space on thin pool drops below ~120MB, I want the 20GB volume a=
nd=20
> the 10GB volumes to be frozen, no new extents for 30GB volume.
>=20
> I want at least 500MB free on 10GB volume.
>=20
> When free space on thin pool drops below ~520MB, I want the 20GB volume t=
o be=20
> frozen, no new extents for 20GB volume.
>=20
>=20
> So I would get 2 thresholds and actions:
>=20
> - threshold for 3GB volume causing all others to be frozen
> - threshold for 10GB volume causing 20GB volume to be frozen
>=20
> This is easily scriptable and custom thing.
>=20
> But it would be nice if you could set this threshold in LVM per volume?

This is the main issue - these 'data' are pretty expensive to 'mine' out of=
=20
data structures.

That's the reason why thin-pool is so fast and memory efficient inside the =

kernel - because it does not need to all those details about how much data =

thinLV eat from thin-pool - kernel target simply does not care - it only ca=
res=20
about referenced chunks

It's the user space utility which is able to 'parse' all the structure
and take a 'global' picture. But of course it takes CPU and TIME and it's n=
ot=20
'byte accurate'  -  that's why you need to start act early on some threshol=
d.


> But the most important thing is to freeze or drop snapshots I think.
>=20
> And to ensure that this is default behaviour?

Why you think this should be default ?

Default is to auto-extend thin-data & thin-metadata when needed if you set =

threshold bellow 100%.

We can discuss if it's good idea to enable auto-extending by default - as w=
e=20
don't know if the free space in VG is meant to be used for thin-pool or the=
re=20
is some other plan admin might have...


Regards

Zdenek
