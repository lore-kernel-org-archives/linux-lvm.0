Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n53IlwKr011545
	for <linux-lvm@redhat.com>; Wed, 3 Jun 2009 14:47:58 -0400
Received: from nncore.ece.northwestern.edu (nncore.ece.northwestern.edu
	[129.105.8.7])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n53IlcUK026742
	for <linux-lvm@redhat.com>; Wed, 3 Jun 2009 14:47:38 -0400
Received: from m364d1.ece.northwestern.edu (m364d1.ece.northwestern.edu
	[129.105.6.180])
	by nncore.ece.northwestern.edu (Postfix) with ESMTP id 4ADEE14200
	for <linux-lvm@redhat.com>; Wed,  3 Jun 2009 13:47:38 -0500 (CDT)
Date: Wed, 3 Jun 2009 13:46:01 -0500
From: Zhengquan Zhang <zhang.zhengquan@gmail.com>
Subject: Re: [linux-lvm] lvm on a single big partition or just a single big
	partition?
Message-ID: <20090603184601.GA25936@m364d1.ece.northwestern.edu>
References: <20090603164231.GA23418@m364d1.ece.northwestern.edu>
	<Pine.LNX.4.64.0906031436460.14629@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0906031436460.14629@bmsred.bmsi.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Jun 03, 2009 at 02:42:29PM -0400, Stuart D. Gathman wrote:
> On Wed, 3 Jun 2009, Zhengquan Zhang wrote:
> 
> > For one harddrive I often create a /boot parition that is not lvm and
> > create a huge partition on the rest of the harddrive for PV of lvm. Now
> > I am thinking what is the difference between doing partition like this
> > and just a single big partition without lvm?
> 
> With LVM, you can create many logical volumes.  If you only ever create one
> logical volume that fills the entire PV, and you aren't spanning drives
> (multiple PVs) or mirroring, then LVM is not doing anything for you.

That is what I am doing, so I am not fully utilizing lvm. another
question, is it advisable to create on pv for one harddrive? 

> 
> Even with just one LV, leave some space for a snapshot.  Then you can
> take more consistent backups by creating a snapshot of your main LV
> and backing that up instead.  Put your swap space in LVM as well.

Thanks for pointing out this. I never thought of leaving space for
snapshot. and the swap too, why it is good to put swap in lvm?

> 
> One reason to create multiple LVs is for virtual machines.  If you
> run Xen, VMWare, or other virtual machine, then each virtual machine
> should have its own LVs for disk drives.  This is more efficient
> than using a filesystem file for a virtual disk.

Oh really, I never thought about this, so virtual machine can directly
use lv for the as their filesystem?

> 
> PS.  I wonder if Grub will ever support LVM?  Does LILO work with LVM?

As I know, LILO does, buy anyway we've got separate /boot.

Thanks a lot Stuart, it helped me a lot,

-- 
Zhengquan
