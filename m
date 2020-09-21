Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0C572156A34
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 14:14:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9B2B101A568
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 14:14:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id k25so11261962ljk.0
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 07:14:18 -0700 (PDT)
Received: from localhost (balticom-231-46.balticom.lv. [83.99.231.46])
	by smtp.gmail.com with ESMTPSA id
	j8sm2608980lfd.290.2020.09.21.07.14.15 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Sep 2020 07:14:16 -0700 (PDT)
From: nl6720 <nl6720@gmail.com>
Date: Mon, 21 Sep 2020 17:14:13 +0300
Message-ID: <4972578.pTZnC5dHRY@walnut>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3127830.BPv24sfAYc";
	micalg="pgp-sha512"; protocol="application/pgp-signature"
Subject: [linux-lvm] Why isn't issue_discards enabled by default?
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
To: linux-lvm@redhat.com

--nextPart3127830.BPv24sfAYc
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: nl6720 <nl6720@gmail.com>
To: linux-lvm@redhat.com
Subject: Why isn't issue_discards enabled by default?
Date: Mon, 21 Sep 2020 17:14:13 +0300
Message-ID: <4972578.pTZnC5dHRY@walnut>

Hi,

I wanted to know why the "issue_discards" setting isn't enabled by 
default. Are there any dangers in enabling it or if not is there a 
chance of getting the default changed?

Also it's not entirely clear to me if/how "issue_discards" affects thin 
pool discard passdown.

--nextPart3127830.BPv24sfAYc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQJGlXQbhb/L1xVy7xc6IU14YjTaQUCX2i1NQAKCRBc6IU14YjT
adQKAQCWHmQ02i9mQCCzpa3ilYEgc3S0Dl+J255PLuLd3WVDFQEAxj0WChujxV17
cv0TEZrNvG03TMNCQAzhWOZNsoJG8AI=
=B5y4
-----END PGP SIGNATURE-----

--nextPart3127830.BPv24sfAYc--
