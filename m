Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8H7arvJ027108
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2008 03:36:54 -0400
Received: from smtp2.versatel.nl (smtp2.versatel.nl [62.58.50.89])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8H7aHAE028734
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2008 03:36:18 -0400
Received: from [172.17.145.51] (unknown [87.213.65.241])
	by mail.vermeer.tv (Postfix) with ESMTPA id F110C26F1BB
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2008 09:35:32 +0200 (CEST)
Subject: Re: [linux-lvm] Mirrored LV
From: Koen Vermeer <koen@vermeer.tv>
In-Reply-To: <20080916215759.GA11670@us.ibm.com>
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com> <1221599565.6037.82.camel@localhost>
	<20080916215759.GA11670@us.ibm.com>
Date: Wed, 17 Sep 2008 09:36:10 +0200
Message-Id: <1221636970.4118.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2008-09-16 at 14:57 -0700, malahal@us.ibm.com wrote:
> Yes, it makes sense for temporarily gone devices. Otherwise use corelog
> for your lvcreate command and you should be able to create mirrored LV.

OK, I get that. So, when using corelog, I won't risk loosing data.

But, when using corelog, what would be the expected delay at bootup?

Also, if I use a log on disk, what happens if I put it on the same disk
as either the master or the copy? And, if I do that, should it be on
it's own PV, or on it's own LV?

Best,
Koen
