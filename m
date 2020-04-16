Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D62013BF56
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2020 23:47:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 129988056D5
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2020 23:47:19 +0000 (UTC)
Received: from wiki.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::1010])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 03GN69VQ008936
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2020 19:06:09 -0400
Date: Thu, 16 Apr 2020 19:06:09 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
In-Reply-To: <da14b5a06730db8e918d925b4e2f1507@administratix>
Message-ID: <alpine.LRH.2.21.2004161903180.8282@mail.gathman.org>
References: <da14b5a06730db8e918d925b4e2f1507@administratix>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [1019133-4yqc8ex4] LVM hangs after volume change
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

On Wed, 15 Apr 2020, Shock Media B.V. support wrote:

> We use an mdadm raid-config consisting of 4 or more SSD's/Disks where
> we use part of the disks for a raid1,raid10 or raid5. We create
> volumes on 2 nodes and use DRBD to keep these 2 volumes in sync and we
> run a virtual machine (using KVM) on this volume.

I've used DRBD for an almost identical setup, except only raid1 - we
were even cheaper that you. :->

I would first suspect DRBD hanging - and you should check the queue
stats to see if there is a backlog.  If you are using the paid version
with a userland smart buffering process, check whether that has died.
