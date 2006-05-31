Received: from o.ww.redhat.com (vpn-4-8.stuttgart.redhat.com [10.32.4.8])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4VLVv1Z001020
	for <linux-lvm@redhat.com>; Wed, 31 May 2006 17:31:57 -0400
Received: from o.ww.redhat.com (localhost.localdomain [127.0.0.1])
	by o.ww.redhat.com (8.13.6/8.13.6) with ESMTP id k4VLVtxF031371
	for <linux-lvm@redhat.com>; Wed, 31 May 2006 23:31:56 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.13.6/8.13.6/Submit) id k4VLVsLH031370
	for linux-lvm@redhat.com; Wed, 31 May 2006 23:31:54 +0200
Date: Wed, 31 May 2006 23:31:54 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] rescue data after hd crash
Message-ID: <20060531213154.GA2236@redhat.com>
References: <optae062jz51dxvh@notebook_chl.intern>
	<20060531124546.GF13142@dragonhold.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060531124546.GF13142@dragonhold.org>
Reply-To: mauelshagen@redhat.com,
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


vgchange -ay --partial

On Wed, May 31, 2006 at 01:45:46PM +0100, Graham Wood wrote:
> On Wed, May 31, 2006 at 02:34:04PM +0200, chris wrote:
> > I have create a volume group with 4 250GByte harddisks with an ext3 file  
> > system on the 1TB result.
> Stripe or concat?
> 
> > now the third harddisk failed and the volume group is "dead" - obviously.
> The way you created the volume had no redundancy - therefore 25% of your data is gone, as 
> well as the volume's "completeness".
> 
> If you did a concat, then you (with playing) may be able to get some data back from the 
> first 500GB of the volume - but I wouldn't want to rely on anything that came back from it.  
> I'd suggest getting hold of 2 identical blank disks, and doing a binary (dd) copy of disks 1 
> and 2 to them - and then work on them.  You might be able to use vgcfg{backup,restore} to 
> tell the system that this volume is actually only on 2 disks....  However, anything that 
> references data > 500GB into the volume is almost definitely lost - because although you've 
> got 750G-1TB, it's almost all going to be linked back into the section that you've lost.
> 
> If you did a stripe, then you can forget getting any data back off it.  You've lost every 
> 4th block of whatever size you striped on.  E.g. with a 64k stripe size, you'll have lost 
> from 128k-192k, 384k-448k, etc. - and there's almost definitely going to be nothing 
> salvagable from that.
> 
> Graham
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
