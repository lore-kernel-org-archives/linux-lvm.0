Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5D8L7u32326
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2005 04:21:07 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.205])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5D8Kti6014407
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2005 04:20:55 -0400
Received: by wproxy.gmail.com with SMTP id 68so1622039wra
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2005 01:20:55 -0700 (PDT)
Message-ID: <472d4b2505061301207ea3783c@mail.gmail.com>
Date: Mon, 13 Jun 2005 03:20:55 -0500
From: David Mohr <squisher@gmail.com>
Subject: Re: [linux-lvm] how to move data from one PV to other PV automaticly?
In-Reply-To: <200506130647.j5D6lG9s031447@mx3.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <20050613051331.GX2244@polop.usc.edu>
	<200506130647.j5D6lG9s031447@mx3.redhat.com>
Content-Transfer-Encoding: 8bit
Reply-To: david@mcbf.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On 6/13/05, Steven Law <cwinl-linux-lvm@lnnu.edu.cn> wrote:
> > -----Original Message-----
> > From: linux-lvm-bounces@redhat.com
> > [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Garrick Staples
> > Sent: Monday, June 13, 2005 1:14 PM
> > To: LVM general discussion and development
> > Subject: Re: [linux-lvm] how to move data from one PV to
> > other PV automaticly?
> >
> > On Mon, Jun 13, 2005 at 10:51:58AM +0800, cwinl alleged:
> > > hi,all:
> > >     i have a VG with 3 PV.
> > > here is 'pvdisplay' information:
> > >   --- Physical volume ---
> > >   PV Name               /dev/sdb1
> > >   Free PE               0
> > >
> > >   --- Physical volume ---
> > >   PV Name               /dev/sdc1
> > >   Free PE               0
> > >
> > >   --- Physical volume ---
> > >   PV Name               /dev/sdd1
> > >   Free PE               0
> > >
> > > i want to move all data from /dev/sdb1 to another two PV (/dev/sdc1
> > > and
> > > /dev/sdd1) automaticly.
> > > so i can remove the unstable PV /dev/sdb1 and repair it.
> > > then i will restore a new /dev/sdb1 device.
> > > /dev/mapper/nicvg-niclv
> > >                       2.0T  774G  1.2T  40% /ftproot
> > >
> > > ---------------------------------
> > >
> > > the volumn '/dev/mapper/nicvg-niclv' is on the VG above.
> > >
> > > how can finish it?
> > >
> > > any suggestion is regarded!
> >
> > The other 2 PVs (sdc1 and sdd1) are both full.  You can't
> > move any data on them with the current configuration.  You'll
> > need to free up ~840GB on nicvg before you can do it.
> >
> > The first step would be to shrink the filesystem using the
> > correct utility for the filesystem (you didn't mention the
> > filesystem type).  Fortunately you have 1.2TB free on the
> 
> my FS is reiserfs.
> please tell me in detail.

man resize_reiserfs, then use (c)fdisk to reduce the partition.

~David
