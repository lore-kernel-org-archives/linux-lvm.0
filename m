Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5AGUW031449
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 12:30:32 -0400
Received: from email.careercast.com (email.careercast.com [216.39.101.233])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i5AGUUi5013836
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 12:30:30 -0400
Subject: Re: [linux-lvm] LVM2 seems to chop performance by 33%
From: Clint Byrum <cbyrum@spamaps.org>
In-Reply-To: <40C87F8A.7080304@dgreaves.com>
References: <40C86F52.4090500@dgreaves.com>
	<200406101105.47606.StuartHarper@tampabay.rr.com>
	<40C87F8A.7080304@dgreaves.com>
Message-Id: <1086885029.13087.15.camel@localhost>
Mime-Version: 1.0
Date: Thu, 10 Jun 2004 09:30:29 -0700
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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

On Thu, 2004-06-10 at 08:34, David Greaves wrote:
> Thanks
> 
> I'd tried that, but no real change. I started 1t 128k and also tried 
> 64k, 256k :) (oh, and 1k)
> 

I did some tests a few months ago with bonnie++.. might offer some
encouragement (please don't post this to slashdot.. ;)

http://spamaps.org/raidtests.php

There's a lot of data there, but if you look at the LVM stuff, you might
notice that the concurrent performance (having 3 processes hammering the
disks in different places instead of just one) was quite good when
compared to flat out RAID5. I'll pay 5% performance for manageability
any day. :-D
