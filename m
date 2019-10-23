References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<9e58accdc28692b3c8b2b09f37bce57c@assyoma.it>
	<alpine.LRH.2.21.1910221846190.5121@fairfax.gathman.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <8dcbc40d-3a29-f920-8f05-b697571bf563@redhat.com>
Date: Wed, 23 Oct 2019 12:12:49 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1910221846190.5121@fairfax.gathman.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, "Stuart D. Gathman" <stuart@gathman.org>, Gionatan Danti <g.danti@assyoma.it>
Cc: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>

Dne 23. 10. 19 v 0:53 Stuart D. Gathman napsal(a):
> On Tue, 22 Oct 2019, Gionatan Danti wrote:
>=20
>> The main thing that somewhat scares me is that (if things had not change=
d)=20
>> thinvol uses a single root btree node: losing it means losing *all* thin=
=20
>> volumes of a specific thin pool. Coupled with the fact that metadata dum=
p=20
>> are not as handy as with the old LVM code (no vgcfgrestore), it worries =
me.
>=20
> If you can find all the leaf nodes belonging to the root (in my btree
> database they are marked with the root id and can be found by sequential
> scan of the volume), then reconstructing the btree data is
> straightforward - even in place.
>=20
> I remember realizing this was the only way to recover a major customer's
> data - and had the utility written, tested, and applied in a 36 hour
> programming marathon (which I hope to never repeat).=EF=BF=BD If this has=
n't
> occured to thin pool programmers, I am happy to flesh out the procedure.
> Having such a utility available as a last resort would ratchet up the
> reliability of thin pools.


There have been made great enhancements in thin_repair tool (>=3D0.8.5)
But of course further fixes and extensions are always welcomed by Joe.

There are unfortunately some 'limitations' what can be fixed with current
metadata format but lots of troubles we have witnessed in past are now
mostly 'covered' by the recent kernel driver. But if there is known case=20
causing troubles - please open BZ so we can look over it.



Regards

Zdenek
