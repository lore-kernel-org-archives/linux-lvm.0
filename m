Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0V5I0vx009907
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 00:18:00 -0500
Received: from QMTA03.emeryville.ca.mail.comcast.net
	(qmta03.emeryville.ca.mail.comcast.net [76.96.30.32])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0V5HQmE022571
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 00:17:27 -0500
Message-ID: <47A159DE.4010401@mattgillen.net>
Date: Thu, 31 Jan 2008 00:17:18 -0500
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to create partitions using  LVM
References: <47A1A629.E775.009D.0@novell.com>
In-Reply-To: <47A1A629.E775.009D.0@novell.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Vijayababu Dandi wrote:
> Hi,
> I am very new to LVM. How to create a partition using LVM.

Not sure exactly what you mean by that.  You can set a partition's type to 
Linux LVM, but that doesn't do much (and isn't necessary with LVM 2).

Check out the FAQ:
http://tldp.org/HOWTO/LVM-HOWTO/initdisks.html
(look for the "For partitions" section on that page)

Matt
