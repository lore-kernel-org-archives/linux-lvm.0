Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6MDnsXM000445
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2016 09:49:54 -0400
Received: from smtp2.dds.nl (smtp2.dds.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 165EE3E2C1
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2016 13:49:51 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.dds.nl (Postfix) with ESMTP id 2B7C340F3821
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2016 15:49:55 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Fri, 22 Jul 2016 15:49:49 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <5C234A9A-A73D-4E4E-ABD9-1ADCEF255333@redhat.com>
References: <96ed1c73-85ca-f20d-f249-cf1d775c0a92@yahoo.co.uk>
	<E1976556-4D69-443C-ACB2-23A186D9A624@redhat.com>
	<1293a47ac069aa8851c5e8d2c67fad81@dds.nl>
	<5C234A9A-A73D-4E4E-ABD9-1ADCEF255333@redhat.com>
Message-ID: <8d8a6f9b8f6a621c29e80b853f6c5839@dds.nl>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Brassow Jonathan schreef op 22-07-2016 15:12:

> One advantage is that pvmove allows you to keep the device online...

Right, that is pretty advanced. Good going.


> We are also working on a feature ATM called “duplicate”.  It allows
> you to create a duplicate of any LV stack, create the duplicate where
> you want, and even change the segment type in the process.  For
> example, you could move a whole RAID5 LV, or thin-p, in one go.

I think one important "trouble spot" is that there is no operation 
yet(?) to create a duplicate of a PV that will not ruin the system 
unless you do pvchange -u and vgchange -u ;-).

It took quite a bit of time for me to realize what was going on ;-).

Is PVMOVE supposed to be a backup task? I don't think so? How are you 
supposed to back something up if you are planning to move your system to 
a new disk?
