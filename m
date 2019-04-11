References: <CAKM4AewbcVR1x0cK8hWLCRxb1BzDd-F+WeK6ObUmB35N1HTqOA@mail.gmail.com>
	<47346a29-e6c7-6e22-4360-2d07e2ec7be3@redhat.com>
	<CAKM4Aexm31mYW8WDeiZ4shCoysCcGjic8zV0XiVqEVZvKz-ecQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <7839ff52-18e5-6a95-9a2a-12ea73457700@redhat.com>
Date: Thu, 11 Apr 2019 13:32:15 +0200
MIME-Version: 1.0
In-Reply-To: <CAKM4Aexm31mYW8WDeiZ4shCoysCcGjic8zV0XiVqEVZvKz-ecQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Aborting. LV mythinpool_tmeta is now incomplete
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
To: Eric Ren <renzhengeek@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, thornber@redhat.com, lvm-devel@redhat.com

Dne 11. 04. 19 v 13:26 Eric Ren napsal(a):
> Hi=C2=A0Zdenek,
>=20
> Thanks for your reply. The use case is for containerd snapshooter, yes, a=
ll=20
> lvm setup is on host machine, creating thin LV for VM-based/KATA containe=
r as=20
> rootfs.
>=20
> For example:
> https://github.com/containerd/containerd/pull/3136
>=20
> and
>=20
> https://github.com/containerd/containerd/pull/3022
>=20
> So, we're evaluating such solution now~
>=20

Hi

I could recommend to orient towards the solution where the 'host' system=20
provides some service for your containers -  so container ask for action,=20
service orchestrates the action on the system - and returns asked resource =
to=20
the container.

IMHO I don't see any other usable solution ATM - although many container=20
developers seems to endlessly try to run these system commands from a conta=
iner...

Regards

Zdenek
