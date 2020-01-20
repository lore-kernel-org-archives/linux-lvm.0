References: <cc1e366b92c320a306f5bd0aa2ec04d6@assyoma.it>
	<91c96949-ec5c-04f2-b198-368f1e04e957@redhat.com>
	<88bfd65fc15f59c8781ab3f626811f79@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <0d0d022b-93ea-156d-c408-49efbc31bbb2@redhat.com>
Date: Mon, 20 Jan 2020 15:40:57 +0100
MIME-Version: 1.0
In-Reply-To: <88bfd65fc15f59c8781ab3f626811f79@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Time needed for take a snapshot
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 20. 01. 20 v 11:36 Gionatan Danti napsal(a):
> Il 20-01-2020 10:22 Zdenek Kabelac ha scritto:
>> So having=EF=BF=BD thousands of LVs in a single VG will become probably =
your=20
>> bottleneck.
>=20
> Hi Zdenek, I was thinking more about having few LVs, but with different a=
mount=20
> of data/mapping.
>=20
> For example, is a very fragmented volume (ie: one written randomically)=20
> significantly slower to snapshot than an almost empty volume? I fully exp=
ect=20
> some small difference; however, if an empty volume take 0.2s and a fragme=
nted=20
> one 20s, this would surely be significant.
>=20
> Note that I never had such a slow snapshot, rather, even on aged and big =

> volumes, it always take <1s. However, other experiences are welcome.

Yep - kernel metadata 'per thin LV' are reasonably small - so even for big =

thin devices it still should fit within your time boundaries.
(effectively thin snapshot just increases 'mapping' sharing between origin =
and=20
its snapshot - so the time needed depends on how many bTree nodes needs to =
be=20
updated - so if you would manage to create heavily fragmented multi TiB=20
thinLV, the time depends on speed of you metadata device - as long as devic=
e=20
is fast (i.e. >=3D SSD) - operation should be quick.
But ATM there is no scientific proof for the worst case scenario.

Regards

Zdenek
