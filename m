Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m77Jqf0G029577
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 15:52:41 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m77JqfZ7016738
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 15:52:41 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1KRBXN-0006aX-4X
	for linux-lvm@redhat.com; Thu, 07 Aug 2008 20:52:41 +0100
Date: Thu, 7 Aug 2008 20:52:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] metadata too large for circular buffer - any way to
	increase PV metadatasize?
Message-ID: <20080807195241.GU7257@agk.fab.redhat.com>
References: <1218132476.4013.10.camel@dogen.thepride.>
	<20080807194151.GT7257@agk.fab.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080807194151.GT7257@agk.fab.redhat.com>
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

And if you have problems making space in the metadata to add the PV to it,
a workaround is to temporarily use in-filesystem metadata:

  create a metadata dir in a local filesystem (NOT an LV), and place an up-to-date
  backup copy of the metadata there (from vgcfgbackup)

  update lvm.conf to start using this metadata (metadata/dirs)
  - use verbose display options to check it's doing this

  pvcreate as in my last message to remove the too-small metadata area
  - you're now relying entirely on the in-filesystem metadata

  add the new PVs to the VG as before

  revert the lvm.conf change
  
Alasdair
-- 
agk@redhat.com
