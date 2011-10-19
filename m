Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9JE9AFd005790
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 10:09:10 -0400
Received: from mx-out.ocsa-data.net (mx-out.ocsa-data.net [194.36.166.37])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9JE99wH001183
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 10:09:10 -0400
Received: from [127.0.0.1] (helo=localhost)
	by mx-out.ocsa-data.net with esmtp (Exim - FreeBSD Rulez)
	id 1RGWq2-000A1t-AC
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 16:09:46 +0200
Received: from mx-out.ocsa-data.net ([127.0.0.1])
	by localhost (node2-3.ouvaton.local [127.0.0.1]) (amavisd-new,
	port 10028) with ESMTP id X4ih0N+pbXb7 for <linux-lvm@redhat.com>;
	Wed, 19 Oct 2011 16:09:45 +0200 (CEST)
Received: from [88.183.94.176] (helo=[192.168.2.34])
	by mx-out.ocsa-data.net with esmtpsa (Exim - FreeBSD Rulez)
	id 1RGWq1-000A1X-C7
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 16:09:45 +0200
From: Yann Droneaud <yann@droneaud.fr>
Date: Wed, 19 Oct 2011 16:09:05 +0200
In-Reply-To: <6198ad06f8735602ebb56546ec3469b6.squirrel@webmail.ocsa-data.net>
References: <6198ad06f8735602ebb56546ec3469b6.squirrel@webmail.ocsa-data.net>
Message-ID: <1319033348.1827.41.camel@deela.quest-ce.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM blocks discard for remove commands
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Le mercredi 19 octobre 2011 à 12:45 +0200, Yann Droneaud a écrit :
> Hi,
> 
> Does lvremove, vgremove, pvremove issue discard (eg. TRIM) commands
> in order to release LE/PE/metadata blocks from the underlying devices (SSD) ?
> 

It seems the discard feature was added to LVM2 since version 2.02.85
(released on 29th April 2011), in WHATS_NEW:

  Add "devices/issue_discards" to lvm.conf.
  Issue discards on lvremove and lvreduce etc. if enabled and supported.

But the documentation is unclear about it. In example.conf.in /
lvm.conf.5.in:

"
Issue discards to a logical volumes's underlying physical volume(s) when
the logical volume is no longer using the physical volumes' space (e.g.
lvremove, lvreduce, etc).  Discards inform the storage that a region is
no longer in use.  Storage that supports discards advertise the protocol
specific way discards should be issued by the kernel (TRIM, UNMAP, or
WRITE SAME with UNMAP bit set).  Not all storage will support or benefit
from discards but SSDs and thinly provisioned LUNs generally do.  If set
to 1, discards will only be issued if both the storage and kernel
provide support.
"


Does it apply for the blocks holding meta data,
e.g. will pvremove issue discard requests for the PV meta data ?

Regards.

-- 
Yann Droneaud
