Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7TG7O92027579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2016 12:07:24 -0400
Received: from smtp2.dds.nl (smtp2.dds.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4525A85A07
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2016 16:07:21 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.dds.nl (Postfix) with ESMTP id 474F540CFF06
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2016 18:07:19 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 29 Aug 2016 18:07:19 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <62f29dda-8a04-9125-8b3e-3e9925f485e3@yahoo.co.uk>
References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
	<3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
	<a1a1c9d00457985bf312ddde42c3e5ab@dds.nl>
	<1d81389a-48bd-9374-7c09-183926f9be1e@yahoo.co.uk>
	<1004ca527029b35e6d621a2629fd6ed4@dds.nl>
	<e41054b4-573e-1960-bd97-c669c6ae9249@yahoo.co.uk>
	<40998f97-9728-c1e6-1c94-cab31fdef870@redhat.com>
	<fda6b9fe-44c6-3274-748a-394a5717c48b@yahoo.co.uk>
	<08940795-857f-f519-5866-bc1a20f86b3b@redhat.com>
	<62f29dda-8a04-9125-8b3e-3e9925f485e3@yahoo.co.uk>
Message-ID: <87893d74286043007249ca2c76cbc01a@dds.nl>
Subject: Re: [linux-lvm] LVM cache/dm-cache questions.
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

lejeczek schreef op 29-08-2016 16:22:

> I cannot debug now as for now I've given up the idea to encrypt this
> LV, but  I would say is should be easily reproducible (maybe even
> waste of time looking at my setup)

I can definitely say I have encrypted a cached volume without issue.

I have had a disk with two cached volumes, if you want to know, both 
caches originating from the same SSD.

Main caches (main origin volume) were on a HDD in a simple regular 
non-thin LVM.
