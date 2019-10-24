References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
	<CACrcyfLZk6iJY+Zwtcb6cSSeR4SEhsXEerxYg_8yqKxqHx+uDQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <35a99505-b5a9-a398-6ec2-b530733e974c@redhat.com>
Date: Thu, 24 Oct 2019 18:01:25 +0200
MIME-Version: 1.0
In-Reply-To: <CACrcyfLZk6iJY+Zwtcb6cSSeR4SEhsXEerxYg_8yqKxqHx+uDQ@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 23. 10. 19 v 13:24 Tomas Dalebj=C3=B6rk napsal(a):
> I have tested FusionIO together with old thick snapshots.
> I created the thick snapshot on a separate old traditional SATA drive, ju=
st to=20
> check if that could be used as a snapshot target for high performance dis=
ks;=20
> like a Fusion IO card.
> For those who doesn't know about FusionIO; they can deal with 150-250,000=
 IOPS.
>=20
> And to be honest, I couldn't bottle neck the SATA disk I used as a thick =

> snapshot target.
> The reason for why is simple:
> - thick snapshots uses sequential write techniques
>=20
> If I would have been using thin snapshots, than the writes would most lik=
ely=20
> be more randomized on disk, which would have required more spindles to co=
op=20
> with this.
>=20
> Anyhow;
> I am still eager to hear how to use an external device to import snapshot=
s.
> And when I say "import"; I am not talking about copyback, more to use to =
read=20
> data from.

Format of 'on-disk' snapshot metadata for old snapshot is trivial - being s=
ome
header + pairs of dataoffset-TO-FROM -  I think googling will reveal couple
python tools playing with it.

You can add pre-created COW image to LV  with  lvconvert --snapshot
and to avoid 'zeroing' metadata use option -Zn
(BTW in the same way you can detach snapshot from LV with --splitsnapshot s=
o=20
you can look how the metadata looks like...)

Although it's pretty unusual why would anyone create first the COW image wi=
th=20
all the special layout and then merge it to LV - instead of directly=20
merging...   There is only the 'little' advantage of minimizing 'offline' t=
ime=20
of such device   (and it's the reason why --split exists).

Regards

Zdenek
