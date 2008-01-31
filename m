Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0V5Rp6g013886
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 00:27:51 -0500
Received: from victor.provo.novell.com (victor.provo.novell.com
	[137.65.250.26])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0V5RSsY026937
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 00:27:28 -0500
Message-Id: <47A1AA0D.E775.009D.0@novell.com>
Date: Wed, 30 Jan 2008 22:32:12 -0700
From: "Vijayababu Dandi" <dvijayababu@novell.com>
Subject: Re: [linux-lvm] How to create partitions using  LVM
References: <47A1A629.E775.009D.0@novell.com> <47A159DE.4010401@mattgillen.net>
In-Reply-To: <47A159DE.4010401@mattgillen.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hi,

I mean that from (disk) sda if i want to create sda2,sda3 .... In EVMS just like creating Segments.

Regards,
Vijay  
 
>>> Matthew Gillen <me@mattgillen.net> 01/31/08 10:47 AM >>> 
Vijayababu Dandi wrote:
> Hi,
> I am very new to LVM. How to create a partition using LVM.

Not sure exactly what you mean by that.  You can set a partition's type to 
Linux LVM, but that doesn't do much (and isn't necessary with LVM 2).

Check out the FAQ:
http://tldp.org/HOWTO/LVM-HOWTO/initdisks.html
(look for the "For partitions" section on that page)

Matt

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
