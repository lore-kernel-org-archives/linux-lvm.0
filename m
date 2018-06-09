Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17284308BDA8
	for <linux-lvm@redhat.com>; Sat,  9 Jun 2018 17:23:00 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 488C4307C941
	for <linux-lvm@redhat.com>; Sat,  9 Jun 2018 17:22:58 +0000 (UTC)
Received: from shell (shell2.dds.nl [83.96.147.102])
	by smtp1.signet.nl (Postfix) with ESMTPS id 7238E5FCEE
	for <linux-lvm@redhat.com>; Sat,  9 Jun 2018 19:22:57 +0200 (CEST)
Date: Sat, 9 Jun 2018 19:22:55 +0200 (CEST)
From: Xen <list@xenhideout.nl>
In-Reply-To: <20180609164133.7EFA8240049@gemini.denx.de>
Message-ID: <alpine.LRH.2.21.1806091920450.24@localhost>
References: <20180609164133.7EFA8240049@gemini.denx.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Cannot activate LVs in VG xxx while PVs appear on
 duplicate devices.
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 9 Jun 2018, Wolfgang Denk wrote:

> Any help how to fix/avoid this problem would be highly appreciated.

You can try to create a global_filter in /etc/lvm/lvm.conf, I believe, and 
make sure it also ends up in your initramfs.

After you filter out your /dev/sdx devices, they should no longer even be 
seen by pvscan, and can also prevent this, perhaps illogical (refusal to) 
activate.

Regards.
