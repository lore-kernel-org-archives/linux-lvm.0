Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4VCk4Iq025736
	for <linux-lvm@redhat.com>; Wed, 31 May 2006 08:46:04 -0400
Received: from wirenth.dragonhold.org (wirenth.dragonhold.org [217.147.94.178])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4VCjquZ020402
	for <linux-lvm@redhat.com>; Wed, 31 May 2006 08:45:57 -0400
Received: from gwood by wirenth.dragonhold.org with local (Exim 4.50)
	id 1FlQ54-0001QT-Ti
	for linux-lvm@redhat.com; Wed, 31 May 2006 13:45:46 +0100
Date: Wed, 31 May 2006 13:45:46 +0100
From: Graham Wood <gwood@dragonhold.org>
Subject: Re: [linux-lvm] rescue data after hd crash
Message-ID: <20060531124546.GF13142@dragonhold.org>
References: <optae062jz51dxvh@notebook_chl.intern>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <optae062jz51dxvh@notebook_chl.intern>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 31, 2006 at 02:34:04PM +0200, chris wrote:
> I have create a volume group with 4 250GByte harddisks with an ext3 file  
> system on the 1TB result.
Stripe or concat?

> now the third harddisk failed and the volume group is "dead" - obviously.
The way you created the volume had no redundancy - therefore 25% of your data is gone, as 
well as the volume's "completeness".

If you did a concat, then you (with playing) may be able to get some data back from the 
first 500GB of the volume - but I wouldn't want to rely on anything that came back from it.  
I'd suggest getting hold of 2 identical blank disks, and doing a binary (dd) copy of disks 1 
and 2 to them - and then work on them.  You might be able to use vgcfg{backup,restore} to 
tell the system that this volume is actually only on 2 disks....  However, anything that 
references data > 500GB into the volume is almost definitely lost - because although you've 
got 750G-1TB, it's almost all going to be linked back into the section that you've lost.

If you did a stripe, then you can forget getting any data back off it.  You've lost every 
4th block of whatever size you striped on.  E.g. with a 64k stripe size, you'll have lost 
from 128k-192k, 384k-448k, etc. - and there's almost definitely going to be nothing 
salvagable from that.

Graham
