Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m77Kk0Td001601
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 16:46:00 -0400
Received: from mule.trantor.org.uk (mule.trantor.org.uk [213.146.154.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m77KjlbX011219
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 16:45:47 -0400
Received: from lion.trantor.org.uk (cpc1-leds8-0-0-cust743.leed.cable.ntl.com
	[82.30.178.232])
	by mule.trantor.org.uk (Postfix) with ESMTP id 096401F1D6
	for <linux-lvm@redhat.com>; Thu,  7 Aug 2008 21:45:47 +0100 (BST)
Received: from [192.168.87.26] (unknown [192.168.87.26])
	by lion.trantor.org.uk (Postfix) with ESMTP id 008F7C0048
	for <linux-lvm@redhat.com>; Thu,  7 Aug 2008 22:02:15 +0100 (BST)
Subject: Re: [linux-lvm] metadata too large for circular buffer - any way
	to increase PV metadatasize?
From: John Leach <john@johnleach.co.uk>
In-Reply-To: <20080807195241.GU7257@agk.fab.redhat.com>
References: <1218132476.4013.10.camel@dogen.thepride.>
	<20080807194151.GT7257@agk.fab.redhat.com>
	<20080807195241.GU7257@agk.fab.redhat.com>
Date: Thu, 07 Aug 2008 21:45:46 +0100
Message-Id: <1218141946.4013.29.camel@dogen.thepride.>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2008-08-07 at 20:52 +0100, Alasdair G Kergon wrote:
> And if you have problems making space in the metadata to add the PV to it,
> a workaround is to temporarily use in-filesystem metadata:
> 
>   create a metadata dir in a local filesystem (NOT an LV), and place an up-to-date
>   backup copy of the metadata there (from vgcfgbackup)
> 
>   update lvm.conf to start using this metadata (metadata/dirs)
>   - use verbose display options to check it's doing this
> 
>   pvcreate as in my last message to remove the too-small metadata area
>   - you're now relying entirely on the in-filesystem metadata
> 
>   add the new PVs to the VG as before
> 
>   revert the lvm.conf change

Will this work with clustered LVM?  If so, I take it all nodes will have
to be configured to use in-filesystem metadata?

Thanks,

John.
-- 
http://johnleach.co.uk
