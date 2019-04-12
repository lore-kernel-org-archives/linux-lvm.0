References: <CAKM4AeyUFr1PQB8jSVR2iaa9tTozwij0cCOfFWdTaX+txru0mg@mail.gmail.com>
	<00ae05c4-5ad8-1137-076d-57a24f093fd3@redhat.com>
	<CAKM4Aexiy-iXuNs6Nn-JudytKQRizovjg_3TVL0_xn_7+e3wXg@mail.gmail.com>
	<CAKM4Aezz1N14MuLcQdJkzvrLFf4f2h-H+UjgL2jVRrBhxVOPow@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d80784b1-539f-911f-de84-32fcbd36e9e7@redhat.com>
Date: Fri, 12 Apr 2019 17:01:23 +0200
MIME-Version: 1.0
In-Reply-To: <CAKM4Aezz1N14MuLcQdJkzvrLFf4f2h-H+UjgL2jVRrBhxVOPow@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] [lvm-devel] lvcreate hangs forever and udev work
	timeout
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
To: LVM2 development <lvm-devel@redhat.com>, Eric Ren <renzhengeek@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 12. 04. 19 v 16:56 Eric Ren napsal(a):
> Hi,
>=20
>> Since the /dev/dm-x has been created, I don't understand what it waits
>> udev to do?
>> Just waits udev rules to create device symbol links?
>=20
> Although the /dev/dm-26 is visible, but the device seems not ready in ker=
nel.
>=20
> [root@iZuf6dbyd7ede51sykedamZ ~]# dmsetup udevcookies
> Cookie       Semid      Value      Last semop time           Last change =
time
> 0xd4d0b57    225214464  2          Fri Apr 12 17:33:14 2019  Fri Apr
> 12 17:33:14 2019
>=20
> [root@iZuf6dbyd7ede51sykedamZ ~]# dmsetup info /dev/dm-26
> Device dm-26 not found
> Command failed.
>=20
> [root@iZuf6dbyd7ede51sykedamZ ~]# ls -l /dev/dm-26
> brw-rw---- 1 root disk 252, 26 4=E6=9C=88  12 17:33 /dev/dm-26
>


Is that happening on any modern distro ??

AFAIK  no udev rule should ever by executed on DM device with empty table...
udev rules are detecting this state and should avoid DM device until it has=
=20
resumed table.

Or is this same race when udev rule is accessing some device while device i=
s=20
being changed ?

Zdenek
