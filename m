Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0V6TAIR005086
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 01:29:11 -0500
Received: from victor.provo.novell.com (victor.provo.novell.com
	[137.65.250.26])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0V6SEIY021521
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 01:28:25 -0500
Message-Id: <47A1B844.E775.009D.0@novell.com>
Date: Wed, 30 Jan 2008 23:32:51 -0700
From: "Vijayababu Dandi" <dvijayababu@novell.com>
Subject: RE: [linux-lvm] How to create partitions using  LVM
References: <47A1A629.E775.009D.0@novell.com>
	<47A159DE.4010401@mattgillen.net> <47A1AA0D.E775.009D.0@novell.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C9385030AC6855@an-ex.ActiveNetwerx.int>
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C9385030AC6855@an-ex.ActiveNetwerx.int>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Thanks Joseph  i will go through it
 
>>> "Joseph L. Casale" <jcasale@ActiveNetwerx.com> 01/31/08 11:12 AM >>> 
>I mean that from (disk) sda if i want to create sda2,sda3 .... In EVMS just like creating Segments.

So you want to carve up three partitions on an LVM disc? --> You want 3 Logical Volumes then, check out that website I gave you...

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
