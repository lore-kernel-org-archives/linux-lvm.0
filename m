Return-Path: <SRS0=MYdC=FM=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FF5C433FE
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Dec 2020 22:25:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E18A222B3
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Dec 2020 22:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E18A222B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-4lZLWwNKNoSN5MA0liek0g-1; Tue, 08 Dec 2020 17:25:15 -0500
X-MC-Unique: 4lZLWwNKNoSN5MA0liek0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EC37800D55;
	Tue,  8 Dec 2020 22:25:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B862E1001901;
	Tue,  8 Dec 2020 22:25:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 277CF5002C;
	Tue,  8 Dec 2020 22:24:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8MOjCB018312 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 17:24:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ABCBBA9F17; Tue,  8 Dec 2020 22:24:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A606CAB404
	for <linux-lvm@redhat.com>; Tue,  8 Dec 2020 22:24:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55070800B3B
	for <linux-lvm@redhat.com>; Tue,  8 Dec 2020 22:24:43 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1607466283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=zDNDRBLdfASRDUQAB4Rw0rbialt41lBSu8JZ2vrJNmI=;
	b=LI3EYFfIS4t36YCJ6pXUOB15RKUoXzaqVDCkS8t9kLjV171WZm8bJjvI+73XyaERU2DfV3
	iy9jXWBcwk8LhxRHe3KHUKMgFnpqmaDCjOQ+tWf/Fl+icT2FjnIJ/07nShwQwOw8DUV31w
	NR8+URv2dTbiFEjL0lDZFOFO1ozBLhAHYPStU/P9e2LSe7laKaEVi0YjC2H+sTUbZDDcfP
	jvXxPu1O4PyyzT/L0kia1MMnc0q5Y8jroV7tJJ0xoFjTgd+rDq2U7QOJ3gBcNYIwv9V/YB
	CNLTnF+HiK3z1gHLkrDX+a0HIwJLnLzWgi55L2oQ7ngEw2O2htNXzNk9LtfX1w==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1607466283; a=rsa-sha256;
	cv=none;
	b=SyME1WR2lU+ezW/2MpGNwxsqfte9xuKQHvt80wQ6JQDTH14wVePWPN5/9k7oPY9AQZvf3F
	TO6fnorPWab/8+Jh1D8OetIg0UCH54rxSajioIOeikCDZR/OPpv5rfpvsGrNEtss5OYtit
	4W/QNiacW0wWvfEs6xGJ41vLNmYYf3pEW3dL+Vu7y+nLdsFmCn0NF8DIs0eGXVw31O9J2b
	lMemxLkS4Z8EWsXxzR/OYrb86Uq7L0vXZXf/72bNeIffucShPjgai4BYyrjOfSEEaQWFl6
	in3wpuzI2fPaEfj+fcE0bGEqsh+9vRexrhfUeBgSTzqj0NuA8WcBBAywqsSWwQ==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=gmx.net header.s=badeba3b8450 header.b=H7mItoaL;
	dmarc=pass (policy=none) header.from=gmx.net;
	spf=pass (relay.mimecast.com: domain of devurandom@gmx.net designates
	212.227.15.19 as permitted sender)
	smtp.mailfrom=devurandom@gmx.net
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-277-vS-zydiYPCK1ew_5-tzhXg-1;
	Tue, 08 Dec 2020 17:24:40 -0500
X-MC-Unique: vS-zydiYPCK1ew_5-tzhXg-1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1607466279;
	bh=C446qk518Jfxp2KLf4AbEm4S6JmqCd6vg8S/lfZDwOc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H7mItoaLxITad7KV4zfDU4ianNRJNlQBkoLGczFT4r2j9MBRPrcIkRH6aXQb7m5HB
	UrirxuJu3KQ+JWDQYJv195qzQ0kLMlJo6KT7OarPDEUGIEtK3ySQncWPYWOrYeYqM+
	j3E3vKUTvurlbClSzJrhTNa3u9HtkX3ihQmGMKGE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from monk.localnet ([79.211.252.228]) by mail.gmx.com (mrgmx005
	[212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXQ5-1kTAeE084l-00JcUG;
	Tue, 08 Dec 2020 23:19:37 +0100
From: Dennis Schridde <devurandom@gmx.net>
To: linux-lvm@redhat.com
Date: Tue, 08 Dec 2020 23:19:31 +0100
Message-ID: <5447546.DvuYhMxLoT@monk>
In-Reply-To: <4384449.LvFx2qVVIh@monk>
References: <4384449.LvFx2qVVIh@monk>
MIME-Version: 1.0
X-Provags-ID: V03:K1:MAMJCgk3l/hukmc6iBkX6TDpOP1As1ukxy/6gNzPf89xWrqXYUk
	t8/+18PIoT++3TKkC5tdU+aR+SuWyGD69RWSgMWnDq3brb4Vuv0SCkwDJ7qeJHivy7BzgN1
	13HUFdrRO+D6WWTNk7OtA0tv33KSGVvYzMhXir62AThDeyt1UGwfRb8Qf9bGGx6/A0Q+VxE
	47rOBoswyk/wab1a92sRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aCKeKcEtujM=:A5i1LTjseDp/J2o4cV92Hf
	dTGe2bh1c2k/pLII6h/c5X3wVaDOLY5scboNKlwlVK39jarqw6myajhbW0PwVBxzIbfpVj3F7
	WtNs5go3Q14LkoEHKAgFbbuVjW96BNzHONd5/v78/ZYuQFsYvcpxGdOtXdugJb2q+DbA1dJdD
	/0fSpQoXnZwQQatHXmi9U+VMA3L0Yo1/I+WTmNIVZvPcv6Ia5nKT8Jn7HuSZLrTNMnshzwpww
	7rOId8U7a6ArB8E5yS0/io9qqs4S10oH01XmkDisHGWef5r9Fb/INa0BK7Cbah1cw3werywrC
	H/PAP/A26+8D8in4c0oCKxd3ggaqXqRftDYmjB12V7lBec83wRzkR0FDDM05QJ4T7o3aOXkCb
	odgJQXy1P9DVzD93usr4H2Tv5QXWhjB3sM2tqsnDJ7YDx35crIoUE5DdcWiPHIefBhmMfy9It
	ckrauo43N1+au7gZgrCMm7/PKbqFws2NRYNkmRVXxzw8M1bIEFXzabXiNDDY4VXVQhOGzm7sc
	yqoaDb9O1OsR3yTlELWpqvccPsH4tDd5C7teKN8w12myEjyf8+cq9FAP92+Td8ex3RMaK2bgk
	3PwIeUq3SsyTZqAkeXL3nwCRem5MGvvBQ+4Z7+z9cPPctF/urUVMnJe0nGpN1c+lSGZ+1mqe9
	4EJOd9F91B58oBM3Ki9ooiWWkbqBBGW2RNtZuZJcZ9+I92RQyyecCrt6mhxPXqInW0wyeiQv6
	KZZzsHA4Jj/HxezMzFZH6uwUxTWwwnjCpBzuJ6nPITdeP7g2Xxgkeoe75K3oSGKqX5FIGwHWQ
	M8b2ZypJctPGgbX9BHnPAfzpCehOTp8okuSsAE3qKLooBDe9GzrthcLyn56Zb+TnKnsfym6xE
	iMCWOec2jQF+5VAr7xtA==
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=gmx.net header.s=badeba3b8450 header.b=H7mItoaL;
	dmarc=pass (policy=none) header.from=gmx.net;
	spf=pass (relay.mimecast.com: domain of devurandom@gmx.net designates
	212.227.15.19 as permitted sender)
	smtp.mailfrom=devurandom@gmx.net
X-Mimecast-Spam-Score: 0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Cc: Dennis Schridde <devurandom@gmx.net>
Subject: Re: [linux-lvm] cache_check --clear-needs-check-flag does not clear
	needs_check flag?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1571748592519083518=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

--===============1571748592519083518==
Content-Type: multipart/signed; boundary="nextPart5695294.lOV4Wx5bFT";
	micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5695294.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Dennis Schridde <devurandom@gmx.net>
To: linux-lvm@redhat.com
Cc: Dennis Schridde <devurandom@gmx.net>
Subject: Re: [linux-lvm] cache_check --clear-needs-check-flag does not clear
	needs_check flag?
Date: Tue, 08 Dec 2020 23:19:31 +0100
Message-ID: <5447546.DvuYhMxLoT@monk>
In-Reply-To: <4384449.LvFx2qVVIh@monk>
References: <4384449.LvFx2qVVIh@monk>

On Sonntag, 6. Dezember 2020 22:01:37 CET Dennis Schridde wrote:
> [...]
> $ sudo lvchange -ay vg_ernie/lv_cache
> Do you want to activate component LV in read-only mode? [y/n]: y
>    Allowing activation of component LV.
> [...]
> Is it possible that `cache_check --clear-needs-check-flag does not clear
> needs_check flag` does not actually clear the needs_check flag in my case=
?

I suspect that this has something to do with the read only status of the LV=
...

What if the superblock gets changed, but is then not written back to the LV=
,
because it is read only, and failure to write it back was not treated as an
error?  I dd-ed lv_cache into a file, ran cache_check --clear-needs-check-f=
lag
on it, and then tried to dd it back to the LV.  Sadly that results in a
permission denied error.  I was not able to figure out how to force writing=
 it
back.

--Dennis

--nextPart5695294.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAl/P+/MACgkQz+h/M161
qdzj1wwArmvfMPEUgJfki82I60N5Nezlaw0Z05Iq5Sj+EPLiWKkHnOdOzTI7mHbe
S1HGYFIlMt0EMJ2PHavKrCx/8xlmwI7Zjzt4mrLhWXiEO5EcTMO4euzOpmxjl4HU
TFHlSIfC2AqUcY5BU2qICQylZnZJrE82hNBw47QaO7ObSVFBFGa6jGp4NvCokF6w
/AHprSb4atsYD+mLiJPNI+/WcMjPlSs1Dn548XSAFHfPuSuYqkQ0+sDcNGge0NUJ
vK+DWfLq8b+7ZoFdmx6svMfWENMAuC7vbPeoIlZQacYZ/MVi0o9C6bQH9/3bvQ7y
rC7B3iGydv+RfUcdkMZbZMzJ10VBCsE90jb3pFzAyxqskhLfEfu1zwhB3rav0gql
Hr+SpwfHMkHqS1R8ujqdeTd2qzQdDhb0/SwehK1XXfpwv7wD11xEYX8QJ8g5veR5
Xu0XvAw31XFIpcFfuSdHU6fJ7/CoTTcz6Fnoiaa4qCfiFsAk6ca2kSxSxDJRA3d/
UvSaeJ+u
=N9uM
-----END PGP SIGNATURE-----

--nextPart5695294.lOV4Wx5bFT--




--===============1571748592519083518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============1571748592519083518==--



