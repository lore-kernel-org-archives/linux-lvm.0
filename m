References: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
	<7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
	<40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
	<d8224c32-56bd-4e53-1090-d86b2e904678@redhat.com>
	<1f54874c-d4da-2579-955e-73e6caa8613b@linagora.com>
	<a89a98b3-3bde-96f0-7f31-3a9ca26ef203@gmail.com>
	<34f1f2af-cc02-6678-39d6-02323dd0236e@linagora.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d19f0e9f-d4a9-5362-34ef-4b33b5990d07@redhat.com>
Date: Wed, 10 Jul 2019 15:32:02 +0200
MIME-Version: 1.0
In-Reply-To: <34f1f2af-cc02-6678-39d6-02323dd0236e@linagora.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvdisplay "open" field computing
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
To: Simon ELBAZ <selbaz@linagora.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 10. 07. 19 v 13:54 Simon ELBAZ napsal(a):
> Hi Zdenek,
>=20
> Thanks for your feedback.
>=20
> The kernel version is:
>=20
> [root@panoramix ~]# uname -a
> Linux panoramix.ch-perrens.fr 2.6.32-573.12.1.el6.x86_64 #1 SMP Tue Dec 1=
5=20
> 21:19:08 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux
>=20

Hi

So this is really a very historical kernel - released ~10 years back.
I'm afraid none is going to look out for the reasoning of any kernel bug....

It might be interesting to see if you get any reproducer to give you hints
how to avoid this happen (at least not easily).

> Jul=C2=A0 2 03:08:10 panoramix LVM(pri_ISCSIVG0_vg_obm)[18618]: INFO: Ret=
ry=20
> deactivating volume group vg_obm
>=20
> This is why I am trying to understand how the field is computed.

Simple rule applied here: DM devices in use (open_count > 0) cannot be=20
deactivated.

Occasionally there were 'race events' with udev - where device
which should have been otherwise unused has been asynchronously
opened by udev scanning rules - but that's like is not your case.

As you seems to have device open count higher permanently -

So if you are sure there is no running 'APP' after umount, that
keeps device open - it could be likely be some very old bug in kernel
with very high probably 99.99999% of being fixed ;)

Regards


Zdenek
