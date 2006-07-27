Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6RFE17D012271
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 11:14:01 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6RFE0iH000520
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 11:14:00 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1G67YX-0004Sb-0J
	for linux-lvm@redhat.com; Thu, 27 Jul 2006 17:13:45 +0200
Received: from servers.it.uni-wh.de ([62.206.172.225])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 17:13:44 +0200
Received: from cp by servers.it.uni-wh.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 17:13:44 +0200
From: Christoph Peus <cp@uni-wh.de>
Date: Thu, 27 Jul 2006 17:13:05 +0200
Message-ID: <eaal5p$hk3$1@sea.gmane.org>
References: <e92e0t$uit$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <e92e0t$uit$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Cannot create more than one snapshot per origin
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Christoph Peus wrote:

> when I try to create more than one snapshot of the same origin, the 
> second and following snapshots are marked "inactive" and report 
> Input/output errors all the time:

[..]

> kernel: vanilla 2.6.15.1
> device-mapper: 1.02.07
> lvm2: 2.02.05

To whom it may concern:
This problem disappeared after I had upgraded the kernel to 2.6.17.

Christoph
