Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 452AB2B4B1
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2019 10:51:53 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A6B5C057F3E
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2019 10:51:53 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v15so1820352wml.0
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2019 03:51:53 -0700 (PDT)
References: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
	<7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
	<40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
	<d8224c32-56bd-4e53-1090-d86b2e904678@redhat.com>
	<1f54874c-d4da-2579-955e-73e6caa8613b@linagora.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <a89a98b3-3bde-96f0-7f31-3a9ca26ef203@gmail.com>
Date: Wed, 10 Jul 2019 12:51:49 +0200
MIME-Version: 1.0
In-Reply-To: <1f54874c-d4da-2579-955e-73e6caa8613b@linagora.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Simon ELBAZ <selbaz@linagora.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 10. 07. 19 v 9:13 Simon ELBAZ napsal(a):
> Hi,
> 
> This LV seems mounted on single mountpoint.
> 
> The lsof output is:


Hmm

Which kernel version is this - aren't we tracking issue for some ancient kernel ?

Why have you actually started to hunt the reason for opencount 2 ?

Has the machine experienced some troubles ?

Aren't there some namespaces in use - so i.e. volume is used in different 
namespace ??

grep 253:3  /proc/*/mountinfo  -  showing something unusual ?



Zdenek
