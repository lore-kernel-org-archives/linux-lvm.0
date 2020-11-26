References: <CAMaziXsttreCZ28V3aw1srY17HFawW_g2DZjvDHSpa+5EeSQag@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <35aef4e6-5a3c-7fdd-9ea1-ef795e91b00b@redhat.com>
Date: Thu, 26 Nov 2020 12:01:33 +0100
MIME-Version: 1.0
In-Reply-To: <CAMaziXsttreCZ28V3aw1srY17HFawW_g2DZjvDHSpa+5EeSQag@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Is TRIM and DISCARD needed for normal HDD ?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Sreyan Chakravarty <sreyan32@gmail.com>

Dne 25. 11. 20 v 16:37 Sreyan Chakravarty napsal(a):
> Hi,
>=20
> I am using thin LVM pools, but I have a normal hard disk and not a SSD.
>=20
> Is there any reason to enable TRIM and/or DISCARD for my HDD ?
>=20
> I have heard it is only=C2=A0useful for a SSD. Will it offer any advantag=
es in my=20
> case ?
>=20

Hi

Thin-pool is created by default with 'passdown' TRIM/discard support.

This means - discard to thin LV  (i.e. fstrim of ext4 on thinLV) gets=20
propagated to thin-pool, where it may deallocate full chunk when possible=20
(i.e. if you use  256K chunk, WHOLE chunk must be free to have an effective=
=20
discard).

With "passdown" mode - such released chunks are also then passed through to=
=20
origin _tdata device - where again some 'alignment rules' of discardable=20
regions applie (i.e. lot of SSD need 512KiB blocks).

If you have HDD - then clearly such discard stops at thin-pool level=20
(automatically) and just releases chunks in thin-pool for future reuse.

"ignore" discard mode is usefull in the case you want to keep already=20
'allocated' chunks for thin LV always there - and also in some case it may =

make timing more predictible - as discard requires processing - so it ma=20
slowdown few things - but at the expense of more filled thin-pool....

Hopefully this makes it clear.

Regards

Zdenek
