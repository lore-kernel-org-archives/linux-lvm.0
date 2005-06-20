Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KF36u06182
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 11:03:06 -0400
Received: from hermesnew.ex.ac.uk (dot.ex.ac.uk [144.173.6.11])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5KF2xGX005081
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 11:02:59 -0400
Received: from volt.ex.ac.uk ([144.173.228.65] helo=volt)
	by hermesnew.ex.ac.uk with esmtp (Exim 4.50/mail) id 1DkNna-0001Ul-1N
	for linux-lvm@redhat.com; Mon, 20 Jun 2005 16:02:54 +0100
Received: from rowe by volt with local (Exim 4.43) id 1DkNlZ-00051q-Mm
	for linux-lvm@redhat.com; Mon, 20 Jun 2005 16:00:49 +0100
Subject: Re: [linux-lvm] Is LVM safe?
From: John Rowe <rowe@excc.ex.ac.uk>
In-Reply-To: <20050620144233.GB12491@null.msp.redhat.com>
References: <1119268975.25392.34.camel@volt>
	<200506201517.01268.krienke@uni-koblenz.de>
	<1119275366.25392.48.camel@volt>
	<d45c7b521930741fc78fef25d061f74b@anderedomain.de>
	<20050620144233.GB12491@null.msp.redhat.com>
Content-Transfer-Encoding: 7bit
Date: Mon, 20 Jun 2005 16:00:49 +0100
Message-Id: <1119279649.18965.24.camel@volt>
Mime-Version: 1.0
Sender: John Rowe <rowe@excc.ex.ac.uk>
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


> > Yes, it's easy. You just need a kernel with DM-Support and the 

> But this is similar to what
> happens if the partition table gets busted on a normal disk.

So the previous poster's "Yes" actually means "No". And a broken
partition table will zap a disk with an LVM partition too won't it? So
the bottom line is that if I want to move an LVM partition to a
different system I have to hold my breath and pray. 

The idea that a disk partition needs Unix file to be able to read it is
absolutely astonishing.

John
