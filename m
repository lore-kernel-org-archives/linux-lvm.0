Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6IKYmoI002333
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2016 16:34:48 -0400
Received: from smtp2.dds.nl (smtp2.dds.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80DB47F7BA
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2016 20:34:47 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.dds.nl (Postfix) with ESMTP id 69ABB4102489
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2016 22:29:03 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 18 Jul 2016 22:28:58 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <E1976556-4D69-443C-ACB2-23A186D9A624@redhat.com>
References: <96ed1c73-85ca-f20d-f249-cf1d775c0a92@yahoo.co.uk>
	<E1976556-4D69-443C-ACB2-23A186D9A624@redhat.com>
Message-ID: <1293a47ac069aa8851c5e8d2c67fad81@dds.nl>
Subject: Re: [linux-lvm] export/migrate - but only a LV - how?
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

Brassow Jonathan schreef op 18-07-2016 17:50:
> maybe pvmove the LV to a unique device and then vgsplit?
> 
>  brassow
> 
>> On Jul 12, 2016, at 10:23 AM, lejeczek <peljasz@yahoo.co.uk> wrote:
>> 
>> .. if possible?


Shouldn't you in general just recreate the LV with the same amount of 
extents and then perform a DD?

I realize an atomic move operation for an LV could conceptually be nice 
but apart from the mental effort required to do this recreation 
manually, there is not much practically in the way of doing it yourself.

In the end, it would be nothing more than a shell script doing an 
LVCREATE, DD, and LVREMOVE?

Regards.
