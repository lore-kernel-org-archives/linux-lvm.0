Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0591960C89
	for <linux-lvm@redhat.com>; Wed,  7 Mar 2018 00:21:48 +0000 (UTC)
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 367C0C0587CD
	for <linux-lvm@redhat.com>; Wed,  7 Mar 2018 00:21:47 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id a23so633498qtn.0
	for <linux-lvm@redhat.com>; Tue, 06 Mar 2018 16:21:47 -0800 (PST)
Received: from hornbill (mobile-107-107-59-183.mycingular.net.
	[107.107.59.183]) by smtp.gmail.com with ESMTPSA id
	e12sm7345213qtc.12.2018.03.06.16.21.45 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Mar 2018 16:21:46 -0800 (PST)
Message-ID: <1520382103.15670.8.camel@gmail.com>
From: bjornpagen@gmail.com
Date: Tue, 06 Mar 2018 19:21:43 -0500
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Fix lvm2 build against musl libc
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
To: linux-lvm@redhat.com

Hey all,

LVM2 currently does not compile against musl libc since it relies on
some glibc-specific behavior. This also means that LVM2 is not fully
POSIX compliant. The following patches have been tested on glibc and
musl.

Patch 1: https://github.com/gentoo/musl/blob/master/sys-fs/lvm2/files/l
vm2-2.02.166-fix-stdio-usage.patch

Patch 2: https://github.com/gentoo/musl/blob/master/sys-fs/lvm2/files/l
vm2-2.02.166-portability.patch

Thanks,
Bjorn Pagen
