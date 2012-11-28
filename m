Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qASDS8EB022629
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2012 08:28:08 -0500
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qASDRxTO008913
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2012 08:28:00 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1TdhgN-00057N-HC
	for linux-lvm@redhat.com; Wed, 28 Nov 2012 14:28:07 +0100
Received: from d67-193-214-242.home3.cgocable.net ([67.193.214.242])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2012 14:28:07 +0100
Received: from brian by d67-193-214-242.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2012 14:28:07 +0100
From: Brian Murrell <brian@interlinx.bc.ca>
Date: Wed, 28 Nov 2012 13:27:44 +0000 (UTC)
Message-ID: <loom.20121128T142616-703@post.gmane.org>
References: <1045065586.477.16.camel@dev-ehopper.tiecommerce.com>
	<20030214172615.GA2438@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to handle Bad Block relocation with LVM?
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

Joe Thornber <joe <at> fib011235813.fsnet.co.uk> writes:
> 
> Eric,
> 
> We would like to automate the process that you have described in LVM2
> at some point.  So if you get an error on an LV and new PE will be
> allocated, as much data as possible copied from the bad PE to the new
> PE, and then remap the LV so that it's using the new PE (very much
> like a small pvmove).
> 
> The EVMS team are writing a bad block relocator target for device
> mapper, but I don't feel it's neccessary to add yet another device
> layer to the LVs.  If I have a bad block I don't mind loosing a whole
> PE (people may not agree with me on this ?)

To resurrect a really, really, old thread, did anything ever get done in LVM2
to either automatically or manually map out PEs with bad blocks in them?

Does anyone have a recipe for doing this -- to save me the time of figuring it 
all out for myself?

Cheers,
b.
