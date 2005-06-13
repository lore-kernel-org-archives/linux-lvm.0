Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5D7Xku23443
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2005 03:33:46 -0400
Received: from mail.lnnu.edu.cn (mail.lnnu.edu.cn [218.25.162.219])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j5D7Xfh0023642
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2005 03:33:44 -0400
Message-Id: <200506130733.j5D7Xfh0023642@mx1.redhat.com>
From: "Steven Law" <cwinl-linux-lvm@lnnu.edu.cn>
Subject: RE: [linux-lvm] how to move data from one PV to other PV automaticly?
Date: Mon, 13 Jun 2005 15:33:35 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050613051331.GX2244@polop.usc.edu>
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

 

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Garrick Staples
> Sent: Monday, June 13, 2005 1:14 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] how to move data from one PV to 
> other PV automaticly?
> 
> On Mon, Jun 13, 2005 at 10:51:58AM +0800, cwinl alleged:
> > hi,all:
> >     i have a VG with 3 PV.
> > here is 'pvdisplay' information:
> >   --- Physical volume ---
> >   PV Name               /dev/sdb1
> >   Free PE               0
> >    
> >   --- Physical volume ---
> >   PV Name               /dev/sdc1
> >   Free PE               0
> >    
> >   --- Physical volume ---
> >   PV Name               /dev/sdd1
> >   Free PE               0
> >  
> > i want to move all data from /dev/sdb1 to another two PV (/dev/sdc1 
> > and
> > /dev/sdd1) automaticly.
> > so i can remove the unstable PV /dev/sdb1 and repair it.
> > then i will restore a new /dev/sdb1 device.
> > /dev/mapper/nicvg-niclv
> >                       2.0T  774G  1.2T  40% /ftproot
> >  
> > ---------------------------------
> >  
> > the volumn '/dev/mapper/nicvg-niclv' is on the VG above.
> >  
> > how can finish it?
> >  
> > any suggestion is regarded!
> 
> The other 2 PVs (sdc1 and sdd1) are both full.  You can't 
> move any data on them with the current configuration.  You'll 
> need to free up ~840GB on nicvg before you can do it.
> 
> The first step would be to shrink the filesystem using the 
> correct utility for the filesystem (you didn't mention the 
> filesystem type).  Fortunately you have 1.2TB free on the 
> filesystem so this shouldn't be a problem.

my kernel is 2.6.10

> 
> Then reduce the size of niclv and you'll be able to move the 
> PEs off of sdb1.
> 
> 

i have add 10 disks on that server and there is no space to add in even one
new disk.
data is too huge , no space on any other server to backup them.
so what i want to do is to move data from PV to PV automaticly.
i have got enough space on the VG(disk usage is 40%).

> --
> Garrick Staples, Linux/HPCC Administrator University of 
> Southern California
> 
