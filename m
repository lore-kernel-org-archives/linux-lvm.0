Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D574D60BE3
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 06:46:07 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB08FC057F93
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 06:46:05 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 65AF9407F25C
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 08:46:02 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Fri, 20 Oct 2017 08:46:02 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <541215543.377417.1508458336923@mail.yahoo.com>
References: <541215543.377417.1508458336923.ref@mail.yahoo.com>
	<541215543.377417.1508458336923@mail.yahoo.com>
Message-ID: <20caebee6f708ec9180ba192d6001d39@xenhideout.nl>
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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

matthew patton schreef op 20-10-2017 2:12:
>> It is just a backup server,
> 
> Then caching is pointless.

That's irrelevant and not up to another person to decide.

> Furthermore any half-wit caching solution
> can detect streaming read/write and will deliberately bypass the
> cache.

The problem was not performance, it was stability.

> Furthermore DD has never been a useful benchmark for anything.
> And if you're not using 'odirect' it's even more pointless.

Performance was not the issue, stability was.

>> Server has 2x SSD drives by 256Gb each
> 
> and for purposes of 'cache' should be individual VD and not waste
> capacity on RAID1.

Is probably also going to be quite irrelevant to the problem at hand.

>> 10x 3Tb drives.  In addition  there are two
>> MD1200 disk arrays attached with 12x 4Tb disks each.  All
> 
> Raid5 for this size footprint is NUTs. Raid6 is the bare minimum.

That's also irrelevant to the problem at hand.
