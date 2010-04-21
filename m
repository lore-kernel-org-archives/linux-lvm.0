Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3LF5HrX028947
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 11:05:17 -0400
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3LF55xk007819
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 11:05:05 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1O4bU8-0007WW-4y
	for linux-lvm@redhat.com; Wed, 21 Apr 2010 17:05:04 +0200
Received: from www4us.deutsche-boerse.com ([193.29.77.101])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 17:05:04 +0200
Received: from b_rahimi by www4us.deutsche-boerse.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 17:05:04 +0200
From: behzad <b_rahimi@hotmail.com>
Date: Wed, 21 Apr 2010 14:58:32 +0000 (UTC)
Message-ID: <loom.20100421T165609-625@post.gmane.org>
References: <SNT144-w65AE38C3AAEDE1D8396FA3E40A0@phx.gbl>
	<20100421053811.GA17339@maude.comedia.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] resize an LVM physical volume
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
To: linux-lvm@redhat.com


Luca Berra <bluca <at> comedia.it> writes:

> 
> On Tue, Apr 20, 2010 at 01:19:42PM +0000, behzad r wrote:
> >On client system there is a lun(EMC) that contains one partition /dev/sde1 ,
the partition is already
> enveloped by LVM , they have  increased the lun but I need to increase the
physical partition /dev/sde1 , I
> have created the following procedure that is working on virtualized linux node
on primergy 
> ...
> >but on bladeframe when I use the fdisk to increase the partition the system
destroy everything the
> physical volume reject the partion  /dev/sde1 (when I run pvdisplay it's not
on the list anymore)and all
> the data is destroyed I got a feeling that fdisk remove the /dev/sda1 and
re-create a new one
> probably the partition has been created, as per EMC specification, with
> an offset bigger than 63 sectors, so when you destroy it and recreate it
> does not start anymore in the same place.
> 
> A better solution would have been, as Philip said, not to partition at
> all, and align the start of the data, but since you are there, you could
> try using a different tool, i.e. parted to extend the partition instead
> of recreating with fdisk.
> 
> L.
> 


I did the test by changing the sector at the start and the same things happened
,the partion was no more in pvdisplay list (I'll be on client site can verify
that hope it must be the reason) , but What might happens that the fdisk changes
the start sector of a partition when we re-create a partition ?

Regards
Behzad
