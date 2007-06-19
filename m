Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l5JDGMSj026657
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 09:16:22 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1I0dZG-0006UQ-N2
	for linux-lvm@redhat.com; Tue, 19 Jun 2007 14:16:22 +0100
Date: Tue, 19 Jun 2007 14:16:22 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvresize after extending RAID array
Message-ID: <20070619131622.GO18457@agk.fab.redhat.com>
References: <f56smj$275$1@sea.gmane.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f56smj$275$1@sea.gmane.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Exactly which version of LVM2 was this (e.g. output of 'lvm version')?

> # cat /sys/block/sdb/size
> 12695042048
 
Use the 'blockdev' command - that gets the sizes the same way that lvm2
does.

Alasdair
-- 
agk@redhat.com
