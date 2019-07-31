Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8C160BF7
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 10:51:49 +0000 (UTC)
Received: from mr014msb.fastweb.it (mr014msb.fastweb.it [85.18.95.103])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47D138552A
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 10:51:46 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 31 Jul 2019 12:51:43 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <dd20d3cf-36a8-167c-a46b-3f06bf27e079@redhat.com>
References: <20190725184901.24234-1-julian.klode@canonical.com>
	<e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
	<20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
	<01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
	<20190731093328.ily6u3xgpbnovyen@jak-t480s>
	<dd20d3cf-36a8-167c-a46b-3f06bf27e079@redhat.com>
Message-ID: <c327e92c17a00f327f1e7690fc820e4b@assyoma.it>
Subject: Re: [linux-lvm] [PATCH] Detect systemd at run-time in
	69-dm-lvm-metad.rules
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Julian Andres Klode <julian.klode@canonical.com>

Il 31-07-2019 12:16 Zdenek Kabelac ha scritto:
> When it appears to work on a system with a single disk really doesn't
> make it 'clearly working' - we are providing solution for thousands
> disks based heavily loaded servers as well, so there is not much wish
> to 'hack-in' occasionally working fix.

Not related to the core question - just to ask if you really have 
servers with thousands disks connected...
Is this a (relatively) common scenario, so much to hamper very common 
one/few disks system?
No intention to flame - I am genuinely curious...
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
