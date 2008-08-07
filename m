Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m77Ki17P032683
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 16:44:01 -0400
Received: from mule.trantor.org.uk (mule.trantor.org.uk [213.146.154.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m77KhaNo009792
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2008 16:43:37 -0400
Received: from lion.trantor.org.uk (cpc1-leds8-0-0-cust743.leed.cable.ntl.com
	[82.30.178.232])
	by mule.trantor.org.uk (Postfix) with ESMTP id 3C34D4BE
	for <linux-lvm@redhat.com>; Thu,  7 Aug 2008 21:43:35 +0100 (BST)
Received: from [192.168.87.26] (unknown [192.168.87.26])
	by lion.trantor.org.uk (Postfix) with ESMTP id 7F09AC0048
	for <linux-lvm@redhat.com>; Thu,  7 Aug 2008 22:00:03 +0100 (BST)
Subject: Re: [linux-lvm] metadata too large for circular buffer - any way
	to increase PV metadatasize?
From: John Leach <john@johnleach.co.uk>
In-Reply-To: <20080807194151.GT7257@agk.fab.redhat.com>
References: <1218132476.4013.10.camel@dogen.thepride.>
	<20080807194151.GT7257@agk.fab.redhat.com>
Date: Thu, 07 Aug 2008 21:43:35 +0100
Message-Id: <1218141815.4013.27.camel@dogen.thepride.>
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

On Thu, 2008-08-07 at 20:41 +0100, Alasdair G Kergon wrote:
> Unfortunately there is no way to increase this retrospectively.
> Nor have we written tools to manipulate metadata areas yet.
> 
> You're right that the best option is to add more PVs.
> 
> Roughly:
> 
> Create a new PV with a much larger metadata area, add it to the VG,
> then stop using the too-small metadata areas on the old PVs.

Hi Alasdair,

thanks for the advice - very much appreciated.  I'm going to test this
out on a test cluster.  It will buy some time whilst we consider what to
do next (probably pvmove things around and recreate PVs with more
metadata space).

Thanks again,

John.

-- 
http://johnleach.co.uk
