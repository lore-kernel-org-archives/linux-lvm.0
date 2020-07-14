Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F6A4CF639
	for <linux-lvm@redhat.com>; Tue, 14 Jul 2020 15:17:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AC5280CC2E
	for <linux-lvm@redhat.com>; Tue, 14 Jul 2020 15:17:41 +0000 (UTC)
References: <1juzXg-0002Wp-5c@mx1.helsinki.tools>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <13bd9503-6599-c6bb-83ab-4b427a2450e3@assyoma.it>
Date: Tue, 14 Jul 2020 17:15:20 +0200
MIME-Version: 1.0
In-Reply-To: <1juzXg-0002Wp-5c@mx1.helsinki.tools>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] RAID-less parity?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Janne_He=c3=9f?= <janne+lvm@hess.ooo>

On 7/13/20 4:34 PM, Janne He=C3=9F wrote:
> Hello everyone,
>=20
> I'm currently testing dm-integrity and its use with LVM.
> For RAID 1,5,6 LVM should just be able to recover the RAID when integrity=
 fails (and the block device returns a read error).
> However some of my systems are single-disk systems. For those, RAIDs are =
not possible so I was thinking if LVM has some support for single-PV setups=
 with parity on the same PV.
> While this is probably a niche feature right now, I can see other project=
s like Stratis benefit from the integrity checks provided by dm-integrity (=
and dm-crypt in the future) to detect (and thanks to parity fix) bit rots.
> So is there any way to get a parity setup with the current state of LVM? =
I was thinking of a RAID-4 with one PV but the current tooling (more specif=
ically lvcreate) doesn't let me do that.

Hi,
on current LVM implementation, the number of stripes can not exceed the=20
number of physical device.

The only possibility I can think of is to partition your disk in=20
multiple regions (ie: 3 partitions), adding them as PV to a new VG and=20
the creating a RAID4/5 type volume.

Anyway, for good recovery chances you *need* physically different=20
devices; otherwise, a catastrophic failure on your single device will=20
eat all your data.

Regards.

--=20
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
