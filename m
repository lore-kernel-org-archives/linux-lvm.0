Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5BKvE019279
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 16:57:14 -0400
Received: from mailgate.Cadence.COM (mailgate.Cadence.COM [158.140.2.1])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5BKv8Xn017603
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 16:57:09 -0400
Received: from mailhub.Cadence.COM (mailhub.Cadence.COM [158.140.128.33])
	by mailgate.Cadence.COM (8.9.3/8.9.3) with ESMTP id NAA24297
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 13:56:53 -0700 (PDT)
Received: from d158140025182.cadence.com (localhost [127.0.0.1])
	by mailhub.Cadence.COM (8.12.8/8.8.5) with ESMTP id i5BKv7gR012133
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 13:57:07 -0700 (PDT)
Subject: Re: [linux-lvm] Multipath without round-robin?
From: Chris Croswhite <csc@cadence.com>
In-Reply-To: <40CA10AB.7040502@us.ibm.com>
References: <20040610203309.GA18186@c9x.org>  <40CA10AB.7040502@us.ibm.com>
Message-Id: <1086987761.15725.51.camel@d158140025182.Cadence.COM>
Mime-Version: 1.0
Date: Fri, 11 Jun 2004 14:02:41 -0700
Content-Transfer-Encoding: 7bit
Reply-To: csc@cadence.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


> path0 in group0, path1 in group1 etc. When path0 fails you use path1. 
> Are you using multipath-tools or settiing up the table by hand. For 
> mp-tools there is a failover setting. You still cannot so explciit 
> failover but that is in the works.

mp-tools?
