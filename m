References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
Date: Tue, 22 Oct 2019 15:57:12 +0200
MIME-Version: 1.0
In-Reply-To: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>

Dne 22. 10. 19 v 12:47 Dalebj=EF=BF=BDrk, Tomas napsal(a):
> Hi
>=20
> When you create a snapshot of a logical volume.
>=20
> A new virtual dm- device will be created with the content of the changes =
from=20
> the origin.
>=20
> This cow device can than be used to read changed contents etc.
>=20
>=20
> In case of an incident, this cow device can be used to read back the chan=
ged=20
> content to its origin using the "lvmerge" command.
>=20
>=20
> The question I have is if there is a way to couple an external cow device=
 to=20
> an empty equaly sized logical volume,
>=20
> so that the empty logical volume is aware of that all changed content are=
=20
> placed on this attached cow device?
>=20
> If that is possible, than it will help making instant recovery of LV volu=
mes=20
> from an external source using native lvmerge command, from for example a =

> backup server.

For most info how old snapshot for so called 'thick' LVs works - check
these papers: http://people.redhat.com/agk/talks/


lvconvert --merge

is in fact 'instant' operation - when it happens - you can immediately acce=
ss
'already merged' content  while the merge is happening in the background
(you can look for copies percentage in lvs command)


However 'thick' LVs with old snapshots are rather 'dated' technology
you should probably checkout the usage of  thinly provisioned LVs.

Regards

Zdenek
