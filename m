References: <CACrcyfJBtsVFwf8wFjDAc1sOKPiOVBJjKbDC3c+3G-z6v5SCpA@mail.gmail.com>
	<0B002628-0740-4DA4-A9BD-320A743A7A30@gmail.com>
	<alpine.LRH.2.02.2009070907110.5779@file01.intranet.prod.int.rdu2.redhat.com>
	<30564577-1c0a-7405-f70e-81614b62dec0@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <a446fda9-d3c5-a184-8466-d63ae39f541c@redhat.com>
Date: Mon, 7 Sep 2020 16:17:47 +0200
MIME-Version: 1.0
In-Reply-To: <30564577-1c0a-7405-f70e-81614b62dec0@gmail.com>
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
To: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>, Mikulas Patocka <mpatocka@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 07. 09. 20 v 16:14 Dalebj=C3=B6rk, Tomas napsal(a):
> Hi Mikulas,
>=20
> Thanks for the replies
>=20
> I am confused now with the last message?
>=20
> LVM doesn't support taking existing cow device and attaching it to an exi=
sting=20
> volume?
>=20
> Isn't that what "lvconvert --splitsnapshot" & "lvconvert -s" is ment to b=
e doing?
>=20
> lets say that I create the snapshot on a different device using these ste=
ps:
>=20
> root@src# lvcreate -s -L 10GB -n lvsnap vg/lv /dev/sdh
> root@src# lvconvert ---splitsnapshot vg/lvsnap
> root@src# echo "I now move /dev/sdb to another server"
> root@tgt# lvconvert -s newvg/newlv vg/lvsnap
>=20

Hi

This is only supported as long as you stay within VG.
So newlv & lvsnap must be in a single VG.

Note - you can 'vgreduce' PV from VG1 and vgextend to VG2.
But it always work on whole PV base - you can't mix
LV between VGs.

Zdenek
