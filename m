Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9UIhYr00675
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 14:43:34 -0400
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id i9UIghvH002644
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 14:42:43 -0400
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CNy83-0003fo-00
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 20:39:07 +0200
Received: from triangulo.it.uc3m.es ([163.117.139.109])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 20:39:06 +0200
Received: from ptb by triangulo.it.uc3m.es with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 20:39:06 +0200
From: Peter T. Breuer <ptb@lab.it.uc3m.es>
Date: Sat, 30 Oct 2004 18:55:55 +0200
Message-ID: <rltc52-8uk.ln1@triangulo.it.uc3m.es>
References: <41801ADE.6030308@monjoin.net> <20041028011738.GD13737@kluge.net>
	<41814060.4040400@mikebabcock.ca>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Software raid on top of lvm logical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Michael T. Babcock <mike@mikebabcock.ca> wrote:
> Theo Van Dinter wrote:
> 
> >On Thu, Oct 28, 2004 at 12:02:06AM +0200, Eric Monjoin wrote:
> >  
> >
> >>I would like to know if it's possible (works perfectly) to create a 
> >>software mirror (md0) on top of  2 LVM logical volumes :
> >>    
> >>
> >
> >You'd usually want to make your raid devices first, then put LVM on
> >top of it.  I can't really think of any benefits of doing it the other
> >way around.
> >  
> >
> 
> I've thought about this numerous times -- there is the distinct resizing 
> advantage.  Namely, if I create a software RAID partition, I can't 
> resize it afterward without destroying it.  I have for example, on 
> occasion, had three disks set up where 1/3 of each was devoted to a 
> RAID-0 very fast striping set for data transfers that had to be fast but 
> if they were lost it wasn't critical, and 2/3 was set up as RAID-5 for 
> reliability of another set of data.

That would be LVM over raid, not the other way round. You make a raid0
out of 1/3 of each disk (set up a partition on each) nd a raid5 out of
2/3 of each disk. Then you combine and/or divvy up the two raid areas
using lvm.

If you have lvm under raid, you STILL can't change the size of the
raided device without remaking it completely, so what's the point?  (or
does lvm somehow magically permit raid0 resizing on the fly above it -
that would be just about possible, but would require cooperation).

Peter
