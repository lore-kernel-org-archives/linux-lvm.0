References: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
	<5BDF90CF-72E7-44A0-8C78-7854B2B8996A@gmail.com>
	<29ad8317-4a55-f017-6a0b-c06bf40ccab8@redhat.com>
	<CACrcyfJxYvr7BC6Srts1bnNWLxsme8d3hjEQqYQyBz9sqbNp6g@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <992d73bd-259e-a89c-f34f-60388d9e1c5b@redhat.com>
Date: Mon, 4 Nov 2019 16:04:34 +0100
MIME-Version: 1.0
In-Reply-To: <CACrcyfJxYvr7BC6Srts1bnNWLxsme8d3hjEQqYQyBz9sqbNp6g@mail.gmail.com>
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
To: =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 04. 11. 19 v 15:40 Tomas Dalebj=C3=B6rk napsal(a):
> Thanks for feedback.
>=20
>

> Scenario 2: A write comes want to write block LP 100, but lvconvert has n=
ot=20
> yet copied that LP block (yes, I do understand that origin is hidden now)
> Will lvconvery prioritize to copy data from /dev/vg00/lv00-snap to=20
> /dev/vg00/lv00 for that block, and let the requestor write the changes=20
> directly on the origin after the copying has been performed?
> Or will the write be blocked until lvconvert has finished the copying of =
the=20
> requested block, and than a write can be accepted to the origin?
> Or where will the changes be written?

Since the COW device contains not only 'data' but also 'metadata'  blocks
and during the 'merge' it's being updated so it 'knows' which data has
been already merged back to origin (in other words during the merge the usa=
ge=20
of COW is being reduced towards 0)  - I assume your 'plan' stops right here
and there is not much point to explore how much sub-optimal the rest of=20
merging process is  (and as said - primary aspect was robustness - so if th=
ere=20
is crash in any moment in time - data remain correct)

Regards

Zdenek
