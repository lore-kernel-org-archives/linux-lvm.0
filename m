Received: from lacrosse.corp.redhat.com (lacrosse.corp.redhat.com
	[172.16.52.154])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1LH9eVS014018
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2008 12:09:40 -0500
Received: from [10.11.14.152] (vpn-14-152.rdu.redhat.com [10.11.14.152])
	by lacrosse.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	m1LH9deK008583
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2008 12:09:39 -0500
Subject: Re: [linux-lvm] I have started writing a KDE program for LVM
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <200802162126.09898.benscott@nwlink.com>
References: <269300.77497.qm@web57704.mail.re3.yahoo.com>
	<200802162126.09898.benscott@nwlink.com>
Date: Thu, 21 Feb 2008 12:10:38 -0500
Message-Id: <1203613838.3540.1.camel@localhost.localdomain>
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

On Sat, 2008-02-16 at 21:26 -0800, ben scott wrote:
> I have a program on sourceforge.net called kvpm. It is a KDE version 4 gui 
> wrapper for the LVM tools. It needs the kdelibs version 4 headers but not the 
> full kde 4 base installation. It is still very alpha but I really would like 
> to get some feedback on it. 
> 
> Also, has there been any progress towards an lvm library?
> 

Slow progress so far but it is being worked on.

Do you have specific requirements and/or use cases you can share?  Are
they straightforward things such as pvcreate, vgcreate, lvcreate, and
displaying of PVs, VGs, and LVs, or are there more complicated things?

Anything you can share would be appreciated.
