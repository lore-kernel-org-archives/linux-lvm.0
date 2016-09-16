Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GF9GND000447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2016 11:09:16 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8410D65726
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2016 15:09:15 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 60993F54A1
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2016 17:03:20 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 16 Sep 2016 17:03:18 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <7308a436-1459-6097-3d02-239797867e8f@redhat.com>
References: <CAEMJtDsvR-70bVC2E=aMGoA1nR_ReqW-jVELTjmJyQDY+xzXnw@mail.gmail.com>
	<c5f4003c-f3ea-1aac-1727-d14ba3281d13@redhat.com>
	<e2f9476f73b7ab05cc1e7a21643ed29e@dds.nl>
	<7308a436-1459-6097-3d02-239797867e8f@redhat.com>
Message-ID: <2ea175a6dd1d81cb7137f2db8fee55d3@dds.nl>
Subject: Re: [linux-lvm] lvm2 raid volumes
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

Heinz Mauelshagen schreef op 16-09-2016 16:13:

> Yes, looks like you don't have the 2nd PV accessible by the time when
> the raid1 is being discovered and initially activated,
> hence the superblock can't be retrieved.
> 
> These messages seem to be coming from initramfs, so check which driver
> is missing/not loaded to access the 2nd PV.
> 
> The fact that you gain access to the raid1 completely after reboot (as
> you mention further down) tells the
> aforementioned fact is reasoning this degraded activation.
> I.e. disk driver loaded after root pivot.
> Please ensure it is available in the initramfs and loaded.
> 
> Heinz

Yes, thank you.

The problem was that the VG that contained the PV used as the 2nd PV was 
not getting activated at initramfs time.

I solved it now by creating some hooks that would obtain a hierarchical 
PV list from a running system and then ensure all PVs in that list that 
were also LVs, would get activated prior to the root device.

The issue is really that (on Ubuntu) LV activation is very selective in 
the initramfs. Of course it is an embedded or "enclosed" setup, maybe it 
is not recommended. Regardless the only issue was that LVs are getting 
selectively activated (only root and swap).

Regards.
