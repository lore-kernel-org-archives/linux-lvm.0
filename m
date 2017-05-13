Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7D3F5B82F
	for <linux-lvm@redhat.com>; Sat, 13 May 2017 12:16:24 +0000 (UTC)
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id 7FF4E15567
	for <linux-lvm@redhat.com>; Sat, 13 May 2017 12:16:21 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 13 May 2017 14:16:18 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <2dad6517-22f4-032d-6d7d-44641c4b871f@free.fr>
References: <2dad6517-22f4-032d-6d7d-44641c4b871f@free.fr>
Message-ID: <f099a6aefe6b25997971d1cbbed7dfeb@assyoma.it>
Subject: Re: [linux-lvm] Question on mixing technologies
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

You basically have two possibilities:

1) move the root fs on the M.2 disk, which will give you much higher 
system responsiveness compared to the mechanical disks; however, any 
data/application installed on the HDD will be slow as always;

2) configure lvmcache [1] for using the M.2 disk as a read-only 
(writethrough) caching device for the mechanical disks, which will give 
you somewhat lesser system responsiveness but *any* cache-friendly 
application will be accelerated from the M.2 disk.

[1] http://man7.org/linux/man-pages/man7/lvmcache.7.html

Regards.

Il 12-05-2017 18:21 Georges Giralt ha scritto:
> Hello guys,
> 
> I've an Ubuntu machine with two SATA mechanical drives on software raid 
> 1.
> 
> This md is the sole PV of the LVM installation.
> 
> As the mainboard has been changed recently, it has an M.2 plug. And
> I'm been offered a 128 GB M.2 NGFF card.
> 
> So far so good.
> 
> Question : Will I gain something adding the M.2 card as a second PV on
> my LVM setup and moving the system LV to it ?
> 
> What are your experience on the subject ?
> 
> Many thanks in advance for your advice !

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
