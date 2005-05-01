Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j412DeO03342
	for <linux-lvm@redhat.com>; Sat, 30 Apr 2005 22:13:40 -0400
Received: from bedevere.spamaps.org (ip-65-77-168-70-muca.aerosurf.net
	[65.77.168.70])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j412Ddnv004124
	for <linux-lvm@redhat.com>; Sat, 30 Apr 2005 22:13:39 -0400
Received: from [172.16.128.10] (helo=[172.16.128.10])
	by bedevere.spamaps.org with esmtp (Exim 3.36 #1 (Debian))
	id 1DS3xi-0002J5-00
	for <linux-lvm@redhat.com>; Sat, 30 Apr 2005 19:13:38 -0700
Subject: Re: [linux-lvm] swap on LVM
From: Clint Byrum <cbyrum@spamaps.org>
In-Reply-To: <20050430154315.GB806@bobby.schwinge.homeip.net>
References: <4270E3C4.1090408@nextra.ro> <4270ED4E.8090500@mikebabcock.ca>
	<20050430154315.GB806@bobby.schwinge.homeip.net>
Date: Sat, 30 Apr 2005 19:13:48 -0700
Message-Id: <1114913629.10456.4.camel@localhost.localdomain>
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

On Sat, 2005-04-30 at 17:43 +0200, Thomas Schwinge wrote:
> On Thu, Apr 28, 2005 at 10:03:36AM -0400, Michael T. Babcock wrote:

> I can't confirm that, as I've been using swap partitions on LVs on
> several systems with both LVM1 and LVM2 for some years without problems.
> 

I also have used swap on LVM for over a year. The only problem I've ever
had was with LVM1 not allowing me to swapoff any lvm-based swap
partitions. For that reason, on lvm1 boxes I make a big ext2 partition
and put a swap file on that. Slightly lower performance.. but I don't
mind. For me swap on servers is just there to prevent the box from OOM
killing stuff before I can get on and shut things down gracefully.
