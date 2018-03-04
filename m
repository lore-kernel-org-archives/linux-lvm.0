References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
	<6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
	<9142007eeb745a0f4774710b7c007375@assyoma.it>
	<eea26091-40e7-8f31-e4ba-dfab059f3d70@redhat.com>
	<1dd5a899e554d5cdc41de41dfa4dde4a@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <6ba56c31-9074-d147-70b8-d4a6e6427887@redhat.com>
Date: Sun, 4 Mar 2018 21:34:54 +0100
MIME-Version: 1.0
In-Reply-To: <1dd5a899e554d5cdc41de41dfa4dde4a@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 3.3.2018 v 19:32 Xen napsal(a):
> Zdenek Kabelac schreef op 28-02-2018 22:43:
>=20
>> It still depends - there is always some sort of 'race' - unless you
>> are willing to 'give-up' too early to be always sure, considering
>> there are technologies that may write many GB/s...
>=20
> That's why I think it is only possible for snapshots.
>=20
>> You can use rootfs with thinp - it's very fast for testing i.e. upgrades
>> and quickly revert back - just there should be enough free space.
>=20
> That's also possible with non-thin.
>=20
>> Snapshot are using space - with hope that if you will 'really' need that=
 space
>> you either add this space to you system - or you drop snapshots.
>=20
> And I was saying back then that it would be quite easy to have a script t=
hat=20
> would drop bigger snapshots first (of larger volumes) given that those ar=
e=20
> most likely less important and more likely to prevent thin pool fillup, a=
nd=20
> you can save more smaller snapshots this way.
>=20
> So basically I mean this gives your snapshots a "quotum" that I was askin=
g about.
>=20
> Lol now I remember.
>=20
> You could easily give (by script) every snapshot a quotum of 20% of full =

> volume size, then when 90% thin target is reached, you start dropping vol=
umes=20
> with the largest quotum first, or something.
>=20
> Idk, something more meaningful than that, but you get the idea.
>=20
> You can calculate the "own" blocks of the snapshot and when the pool is f=
ull=20
> you check for snapshots that have surpassed their quotum, and the ones th=
at=20
> are past their quotas in the largest numbers you drop first.

I hope it's finally arriving to you that all your wishes CAN be implemented.
It's you to decide what kind of reaction and when it shall happen.

It's really only 'you' to use all the available tooling to do your own=20
'dreamed' setup and lvm2  & kernel target provides the tooling.

If you however hope lvm2 will ship 'script' perfectly tuned for Xen system,
it's just you to write and send a patch...

>=20
>> But as said - with today 'rush' of development and load of updates -
>> user do want to try 'new disto upgrade' - if it works - all is fine -
>> if it doesn't let's have a quick road back -=EF=BF=BD so using thin volu=
me for
>> rootfs is pretty wanted case.
>=20
> But again, regular snapshot of sufficient size does the same thing, you j=
ust=20
> have to allocate for it in advance, but for root this is not really a pro=
blem.
>=20
> Then no more issue with thin-full problem.
>=20
> I agree, less convenient, and a slight bit slower, but not by much for th=
is=20
> special use case.

I've no idea what you mean by this...

>> There are also some on going ideas/projects - one of them was to have
>> thinLVs with priority to be always fully provisioned - so such thinLV
>> could never be the one to have unprovisioned chunks....
>=20
> That's what ZFS does... ;-).

ZFS is a 'single' filesystem.

thin-pool is  multi-volume target.

It's approximately like if you would use  your  XFS/ext4 rootfs being place=
d=20
of  ZFS ZVOL device - if you can provide an example, where this 'systems'=20
works more stable & better & faster than thin-pool, it's clear bug on=20
thin-pool - and your should open bugzilla for this.

Regards

Zdenek
