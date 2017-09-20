Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCC995D6A4
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2017 11:34:43 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 503977E44D
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2017 11:34:40 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 9E41B40BCD58
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2017 13:34:38 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 20 Sep 2017 13:34:38 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <f10d57e3-9866-c62e-3b22-96bd810488c8@assyoma.it>
References: <da37558c-157c-3817-ca59-96202f615be9@assyoma.it>
	<20170918185551.GB6025@redhat.com>
	<3c3eefcc34a6d322b790d91f63cb9d95@assyoma.it>
	<03ce46a8-531e-0b16-b01c-f94e7ae2c6b3@gmail.com>
	<f10d57e3-9866-c62e-3b22-96bd810488c8@assyoma.it>
Message-ID: <170b1c73e067021e9843e6a4964e5986@xenhideout.nl>
Subject: Re: [linux-lvm] Option to silence "WARNING: Sum of all thin volume
 sizes exceeds the size of thin pool"
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

Gionatan Danti schreef op 19-09-2017 10:44:

> Sure, I was only describing a possible case where the warning is
> "redundant" (ie: because the admin know the snapshot will be
> short-lived).

I would only like to say that reducing the "warning" to a "notice" would 
also reduce the irritation.

Ie. instead "WARNING. Word word word" it could also be

"New volume xx overprovisions thin pool by xxx".

This way you don't give the user the idea that you think he/she is 
stupid.

I know this still implies some verbosity but it doesn't have to be an 
"error". It can simply be a "notice".
