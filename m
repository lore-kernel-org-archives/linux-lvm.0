Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4JBZC7A013526
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 07:35:12 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4JBZAwG029346
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 07:35:11 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1SVhw9-0004y2-2w
	for linux-lvm@redhat.com; Sat, 19 May 2012 13:35:05 +0200
Received: from rain.gmane.org ([80.91.229.7])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 13:35:05 +0200
Received: from eternaleye+usenet by rain.gmane.org with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 19 May 2012 13:35:05 +0200
From: Alex Elsayed <eternaleye+usenet@gmail.com>
Date: Sat, 19 May 2012 04:28:20 -0700
Message-ID: <jp804k$r4o$3@dough.gmane.org>
References: <20120317175827.GB12111@agk-dp.fab.redhat.com>
	<1332008213-3940-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Subject: Re: [linux-lvm] [PATCH] mtd: sm_ftl: fix typo in major number.
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
Cc: linux-mtd@lists.infradead.org

Maxim Levitsky wrote:

> major == 0 allocates dynamic major, not major == -1

I would appreciate if this could be submitted for -stable, since the 
negative major number breaks LVM (regardless of whether any such devices are 
present). I found this out the hard way when my system failed to boot. 

-stable note: This is in Linus' tree as 
452380efbd72d8d41f53ea64c8a6ea1fedc4394d

For those who don't know (and potentially as a preface for -stable) the 
reason lies in LVM's filtering; in lib/filter/filter.c, lines 230-233:

        if ((line_maj <= 0) || (line_maj >= NUMBER_OF_MAJORS)) {
            blocksection = (line[i] == 'B') ? 1 : 0;
            continue;
        }

Basically, it scans through /proc/devices until it hits a line starting with 
'B', at which point it starts processing block major numbers and 
whitelisting them to be used as PVs. However, the negative number causes a 
problem because it a.) sorts to the top of the list and b.) short-circuits 
the if(). This causes blocksection to flip back to zero immediately, 
terminating the enumeration of permitted devices before any actually get 
whitelisted. As a result, *all* block devices are ignored, with messages 
such as

Skipping: Unrecognised LVM device type 259

259 being blkext, which LVM explicitly allows.
