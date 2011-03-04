Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p248g9MI016499
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 03:42:09 -0500
Received: from ns.mindbit.ro (ns.mindbit.ro [80.86.127.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p248ful7006632
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 03:41:58 -0500
Received: from [192.168.244.97] ([193.39.73.67]) (authenticated bits=0)
	by ns.mindbit.ro (8.13.8/8.13.8) with ESMTP id p248fsCY012942
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 10:41:55 +0200
From: Radu Rendec <radu.rendec@mindbit.ro>
In-Reply-To: <Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
	<Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
Date: Fri, 04 Mar 2011 10:41:55 +0200
Message-ID: <1299228115.13997.37.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Resizing underlying LVM partition after cloning to
 bigger disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2011-03-03 at 15:18 -0500, Stuart D. Gathman wrote:
> On Thu, 3 Mar 2011, Scott Arthur wrote:
> 
> > Partition Table: msdos
> > 
> > Number  Start   End     Size    Type      File system  Flags
> >  1      32.3kB  296MB   296MB   primary   ext4         boot
> >  2      296MB   1000GB  1000GB  extended
> >  5      296MB   1000GB  1000GB  logical                lvm
> > 
> > I'm obviously wanting to expand the LVM partition to fill the remaining 1TB
> > of space.
> > 
> > Am I able to simply use parted to resize the partition before doing a
> > pvresize etc?
> > 
> > Or is it risky to resize the underlying LVM partition?

I wouldn't do that. Instead, I would create a new logical partition,
"format" it as lvm physical volume and then extend the volume group to
use this partition as well.

I think this can be safely done like this:

* turn off lvm;
* note down the exact starting and ending *sector* of partition 5 (using
fdisk -lu)
* use fdisk and delete partition 5 and 2, then re-create partition 2 up
to the full disk size
* re-create partition 5 making sure it's on exactly the same starting
and ending sector as it was before
* create new partition 6

> You are getting to a size where msdos partition tables are risky.
> Don't they crap out at 2TB?

They do. But the "2TB" disk is actually 2000GB, which is safe (it takes
more than 2048GB to run into trouble with m$dos partitions).

Best regards,

Radu Rendec
