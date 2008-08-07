Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m77JuA3i032005
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 15:56:11 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m77Ju9T0017301
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 15:56:09 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1KRBaj-0006ag-NJ
	for linux-lvm@redhat.com; Thu, 07 Aug 2008 20:56:09 +0100
Date: Thu, 7 Aug 2008 20:56:09 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] metadata too large for circular buffer - any way to
	increase PV metadatasize?
Message-ID: <20080807195609.GV7257@agk.fab.redhat.com>
References: <1218132476.4013.10.camel@dogen.thepride.>
	<20080807194151.GT7257@agk.fab.redhat.com>
	<20080807195241.GU7257@agk.fab.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080807195241.GU7257@agk.fab.redhat.com>
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

On Thu, Aug 07, 2008 at 08:52:41PM +0100, Alasdair G Kergon wrote:
> And if you have problems making space in the metadata to add the PV to it,
> a workaround is to temporarily use in-filesystem metadata:
 
I should also point out that although using in-filesystem metadata is a
fully-supported configuration, it does not receive much testing because few
people use it, so if you do need to use that method and hit any problems,
certainly let us know.

Alasdair
-- 
agk@redhat.com
