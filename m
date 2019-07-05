Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80EA617509
	for <linux-lvm@redhat.com>; Fri,  5 Jul 2019 06:38:44 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4D1E2F8BFE
	for <linux-lvm@redhat.com>; Fri,  5 Jul 2019 06:38:31 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id o9so1376016iom.3
	for <linux-lvm@redhat.com>; Thu, 04 Jul 2019 23:38:31 -0700 (PDT)
MIME-Version: 1.0
From: Paul Richards <paul.richards@gmail.com>
Date: Fri, 5 Jul 2019 07:38:19 +0100
Message-ID: <CAMoswehqXRh+i16X4wHPz1YrVs4MK7gaqq4BYfSgiD7Mw9UsVA@mail.gmail.com>
Subject: [linux-lvm] lvmcache shutdown for root filesystem
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
To: linux-lvm@redhat.com

Hello there,
I am using lvmcache for my root filesystem.  This works fine except
for rebooting.  On bootup it appears that lvmcache believes the entire
cache is dirty, and begins writing it all out to the origin LV.

To me this sound like a problem discussed on linux-lvm@ previously,
whereby the lvmcache is not correctly deactivated on shutdown due to
it being in use still:

https://www.redhat.com/archives/linux-lvm/2015-October/msg00012.html

Is there a solution or workaround for this now, or is it the case that
lvmcache should not be used for caching root volumes on machines you
expect to shutdown/reboot frequently?

A possible workaround might be to partially deactivate the lvmcache by
syncing the metadata, then putting it into a frozen read-only state
(cache-pool and origin LVs no longer get written to, blocks don't
migrate, but cache LV reads can still be serviced).  Is there a
mechanism for this?

Thanks in advance for any replies!

PS.  I am ubutnu 18.04 LTS with HWE stack (kernel is currently v4.18)
if that's relevant.
