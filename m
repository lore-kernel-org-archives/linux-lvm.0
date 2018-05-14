References: <CAHJ=Ofm_j2B6TeNZR_1GZk40L_fiAqMT=umehupKSnNd+ZHY2A@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <15199636-6222-d709-f79e-5722d55e6e77@redhat.com>
Date: Mon, 14 May 2018 16:21:38 +0200
MIME-Version: 1.0
In-Reply-To: <CAHJ=Ofm_j2B6TeNZR_1GZk40L_fiAqMT=umehupKSnNd+ZHY2A@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] how to set higher then 128 nr_requests on LV's
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Pankaj Agarwal <pankaj@releasemanager.in>

Dne 14.5.2018 v 02:47 Pankaj Agarwal napsal(a):
> Hi,
>=20
>=20
> How do i set the nr_request value for LV's as it's not writable like othe=
r=20
> drives on a linux system.
>=20
> LV's are set as dm-0 and dm-1 on my system.
>=20
>  =C2=A0#cat /sys/block/dm-0/queue/nr_requests
> 128
> # echo 256 > /sys/block/dm-0/queue/nr_requests
> -bash: echo: write error: Invalid argument
> #


Hi

Lvm2 is 'logical volume manager'  - so it really is just managing your meta=
data.

So you basically ask how you change this value for 'DM' device (managed by =
lvm2).

And IMHO my answer would be - you can't change this setting for DM device a=
s=20
you use whatever comes from the layer bellow DM - so i.e. if you use  PV as=
=20
/dev/sdb  - you need to set this setting for your /dev/sdb  device.

Regards

Zdenek
