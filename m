References: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
	<5BDF90CF-72E7-44A0-8C78-7854B2B8996A@gmail.com>
	<29ad8317-4a55-f017-6a0b-c06bf40ccab8@redhat.com>
	<CACrcyfJxYvr7BC6Srts1bnNWLxsme8d3hjEQqYQyBz9sqbNp6g@mail.gmail.com>
	<alpine.LRH.2.02.1911051131360.14929@file01.intranet.prod.int.rdu2.redhat.com>
	<CACrcyf+7r6-SExT9wkBvN+LREZRHHux-3-0hrP5pkSqUL8z_Sw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c1c13b44-55d0-a602-8d3e-e815c4d8d1b3@redhat.com>
Date: Wed, 6 Nov 2019 10:22:25 +0100
MIME-Version: 1.0
In-Reply-To: <CACrcyf+7r6-SExT9wkBvN+LREZRHHux-3-0hrP5pkSqUL8z_Sw@mail.gmail.com>
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

Dne 05. 11. 19 v 21:56 Tomas Dalebj=C3=B6rk napsal(a):
> Thanks,
>=20
> That really helped me to understand how the snapshot works.
> Last question:
> - lets say that block 100 which is 1MB in size is in the cow device, and =
a=20
> write happen that wants to something or all data on that region of block =
100.
> Than I assume; based on what have been previously said here, that the blo=
ck in=20
> the cow device will be overwritten with the new changes.

Yes - it needs to be written to 'COW' device - since when the block will be=
=20
merged - it would overwrite whatever would have been written in 'origin'
(as said - there is nothing else in snapshot metadata then  'from->to' bloc=
k=20
mapping table - so there is no way to store information about a portion of =

'chunk' being already written into origin) - and 'merge' needs to work=20
reliable in cases like 'power-off' in the middle of merge operation...

Regards

Zdenek
