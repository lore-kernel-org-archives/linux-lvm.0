Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7PEvC8D002718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 10:57:13 -0400
Received: from smtp2.dds.nl (smtp2.dds.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7747380F7C
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 14:57:11 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.dds.nl (Postfix) with ESMTP id 4A6FC409C402
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 16:47:18 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 25 Aug 2016 16:47:18 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
	<3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
Message-ID: <a1a1c9d00457985bf312ddde42c3e5ab@dds.nl>
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

lejeczek schreef op 25-08-2016 13:51:
> question I'd like to ask is: how to LUKS encrypt cache pool LV ?
> 
> many thanks.
> L.

In general without being any expert here you will need to encrypt the 
origin device (PV) on which it resides and likely also the PV of the 
cache pool itself. It's no different from any other volume you would 
use.

You can allow LUKS to pass-through discards if you open the volume with 
--allow-discards on the cryptsetup prompt (command).

In case you have an SSD underneath. It was said that the cache itself 
does not utilize discards just yet, but that it was in the planning.
