Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52JX3kE024960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 2 Jun 2016 15:33:03 -0400
Received: from linux.interlinx.bc.ca (mail.interlinx.bc.ca [69.165.217.196])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA8A1DB00F
	for <linux-lvm@redhat.com>; Thu,  2 Jun 2016 19:33:02 +0000 (UTC)
Message-ID: <1464895638.13773.54.camel@interlinx.bc.ca>
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Thu, 02 Jun 2016 15:27:18 -0400
In-Reply-To: <6504f4cb-8f17-390a-ec9f-0cc6826b23ec@gmail.com>
References: <1464692258.30702.376.camel@interlinx.bc.ca>
	<4f3ac280-86a3-a63d-803c-5719bca79d3e@redhat.com>
	<1464821577.13773.9.camel@interlinx.bc.ca>
	<c5664f25-6ee4-9a4f-f2d7-f6e45206de83@gmail.com>
	<1464864575.13773.29.camel@interlinx.bc.ca>
	<6504f4cb-8f17-390a-ec9f-0cc6826b23ec@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YOkCn54TS9dKwnk2jq4g"
Mime-Version: 1.0
Subject: Re: [linux-lvm] thin: 235:2 pool target (735616 blocks) too small:
 expected 809216
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
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>


--=-YOkCn54TS9dKwnk2jq4g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-06-02 at 14:15 +0200, Zdenek Kabelac wrote:
> Yep that might explain 'missing' surrouding details...
> Basically any write might result in thin-pool running out of
> threshold
> and requireing new space

Ahhh. =C2=A0I was wondering if the resize in question could be some kind of
implicit resizing done by the "hidden" thin-pool maintenance. =C2=A0I'm
fairly sure he knows zilch about LVM and resizing. =C2=A0:-)

>  - what's unclear is the later failure which
> would be really good to know....

Is there anything in particular I can look for in the logs that would
indicate when this implicit resizing was happening to look for other
activity that might have caused a problem?

> Ops=C2=A0=C2=A0- so once again ;)

Cheers. =C2=A0:-)

b.

--=-YOkCn54TS9dKwnk2jq4g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJXUIiXAAoJENrB0DQWy8igyZQH/27SI91ZKpTwk5OvZlvjDsC+
Ciw1ay7IiHQxq2TV3gCoWLkjCclBkeLSSVFZ6/6Amja0dCNia2go12dblyTRjgMb
mp218rdbdcWG4KcVlSJZmrkIv2zaXlOEx6cgSTbrJWuuMGMEXf+oFR+9V8D05eL9
Lql78b4sQRE9bM4GVDEpjf52e3vgp6xCCHoQnn5SJFhiKNoQ+zhH+RqF4q6UX9gt
L6xHlrE8OJDxpGBm5thjV33g0Mnx0cOlhKOY+zu6Ptz1u6EbNRVw4U79mhcTUYS4
rt6nKbbb0SYRAvwc08l4tHuFyrxlSzC7tZN7rOorcLOizjpNVav/RIpeOzw8vb0=
=wq2l
-----END PGP SIGNATURE-----

--=-YOkCn54TS9dKwnk2jq4g--
