Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3B25D6A3
	for <linux-lvm@redhat.com>; Sun, 24 Dec 2017 14:36:07 +0000 (UTC)
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95716C04B318
	for <linux-lvm@redhat.com>; Sun, 24 Dec 2017 14:36:06 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id c19so16046153lfg.3
	for <linux-lvm@redhat.com>; Sun, 24 Dec 2017 06:36:06 -0800 (PST)
Received: from 127.0.0.1 (pc-156036.zdnet.com.pl. [194.88.244.36])
	by smtp.googlemail.com with ESMTPSA id
	b75sm5723051lfe.47.2017.12.24.06.36.02 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Dec 2017 06:36:03 -0800 (PST)
From: KARBOWSKI Piotr <piotr.karbowski@gmail.com>
Message-ID: <e0de5547-7d9e-066f-8be7-54f0e646a238@gmail.com>
Date: Sun, 24 Dec 2017 15:36:02 +0100
MIME-Version: 1.0
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problems with linking lvm statically with musl
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
To: linux-lvm@redhat.com

Hello,

I am facing some problems with linking LVM2.2.02.177 statically with 
musl, using Alpine Linux as a sysroot/chroot.

I needed to apply two patches:
- 
https://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.patch?h=3.7-stable
- 
https://git.alpinelinux.org/cgit/aports/tree/main/lvm2/mallinfo.patch?h=3.7-stable

It would be nice if you guys could upsptream it.

I've noticed that I am unable to link tools/dmsetup, as with 
LDFLAGs='-static' CFLAGS='-static' it's unable to find libdevmapper.a. 
It passes multiple -L directories, one of them is ../libdm, however, the 
libdevmapper is under ../libdm/ioctl directory, adding another -L or 
symlinking libdevmapper.a -> ioctl/libdevmapper.a does the trick

Is the ioctl location intentional or it's like that by bug?

-- Piotr.
