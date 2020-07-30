Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92C6C10087C8
	for <linux-lvm@redhat.com>; Thu, 30 Jul 2020 20:49:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39107185A797
	for <linux-lvm@redhat.com>; Thu, 30 Jul 2020 20:49:43 +0000 (UTC)
Message-Id: <1k1FUf-0008Bw-6B@mx1.helsinki.tools>
From: =?utf-8?q?Janne_He=C3=9F?= <janne+lvm@hess.ooo>
In-Reply-To: <20200714160556.GA16281@redhat.com>
Date: Thu, 30 Jul 2020 22:49:37 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] =?utf-8?q?RAID-less_parity=3F?=
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
Content-Type: text/plain; charset="windows-1252"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: =?utf-8?q?Janne_He=C3=9F?= <janne+lvm@hess.ooo>

Hi,
Am Dienstag, 14. Juli 2020 18:05 CEST, schrieb David Teigland <teigland@red=
hat.com>:=20
=20
> On Mon, Jul 13, 2020 at 04:34:52PM +0200, Janne He=C3=9F wrote:
> > However some of my systems are single-disk systems. For those, RAIDs are
> > not possible so I was thinking if LVM has some support for single-PV
> > setups with parity on the same PV.
>=20
> Hi,
>=20
> We didn't include integrity+linear because we didn't see much value in it,
> since it would require going to backups in case of an integrity failure.
>=20
> > While this is probably a niche feature right now, I can see other
> > projects like Stratis benefit from the integrity checks provided by
> > dm-integrity (and dm-crypt in the future) to detect (and thanks to
> > parity fix) bit rots.
>=20
> dm-integrity will detect but not fix bit rot.

This is where I see a benefit from having some parity on the LVM level.
With dm-integrity spotting bit-rots and reporting errors to LVM, LVM
can recover the blocks with parity information.
This recovery procedure would give more feature parity to ZFS
which I'm currently migrating from for a LVM-based solution.

>=20
> > So is there any way to get a parity setup with the current state of LVM?
> > I was thinking of a RAID-4 with one PV but the current tooling (more
> > specifically lvcreate) doesn't let me do that.
>=20
> It's not currently possible.  We had an implementation for this we could
> bring back if there is enough interest, so we'd like to hear more about
> how this would be useful for you and others.

I think this would be beneficial for a lot of users since it allows spotting
and correcting bit-rots which is currently not possible other than using
ZFS or RAID as far as I know.
>=20
> Thanks,
> Dave
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
=20
 Thanks,
Janne
