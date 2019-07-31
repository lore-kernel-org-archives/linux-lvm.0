Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D34BC5C1B5
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 09:33:34 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB031C049E1A
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 09:33:32 +0000 (UTC)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <julian.klode@canonical.com>) id 1hskzD-0005NN-97
	for linux-lvm@redhat.com; Wed, 31 Jul 2019 09:33:31 +0000
Received: by mail-wr1-f69.google.com with SMTP id f16so33293157wrw.5
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 02:33:31 -0700 (PDT)
Date: Wed, 31 Jul 2019 11:33:28 +0200
From: Julian Andres Klode <julian.klode@canonical.com>
Message-ID: <20190731093328.ily6u3xgpbnovyen@jak-t480s>
References: <20190725184901.24234-1-julian.klode@canonical.com>
	<e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
	<20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
	<01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jul 31, 2019 at 11:21:10AM +0200, Zdenek Kabelac wrote:
> > Debian and Ubuntu, as Debian requires support for non-systemd inits, and
> > Ubuntu requires event-based root device finding in initramfs. Surely that's

This is nonsense. No Ubuntu release has systemd-based background scanning,
and all of them work fine. Also, it's still possible to not use backgrounding
by building lvm2 accordingly - so much for "not working".

In our current development series, we did merge the new change to enable
the background handling from Debian, and this caused our initramfs to fail.

Hence, this approach to revert to the previous behavior where needed (as it
was clearly working), and still use systemd if available.

-- 
debian developer - deb.li/jak | jak-linux.org - free software dev
ubuntu core developer                              i speak de, en
