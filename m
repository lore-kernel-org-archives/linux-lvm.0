Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2SJhQbd004838
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 15:43:26 -0400
Received: from eastrmfepo202.cox.net (eastrmfepo202.cox.net [68.230.241.217])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2SJhLnq000763
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 15:43:21 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmfepo202.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110328194321.DXRI32466.eastrmfepo202.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 15:43:21 -0400
Message-ID: <4D90E4D8.4020702@cox.net>
Date: Mon, 28 Mar 2011 14:43:20 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>	<4D8D6EAF.8050403@cox.net>	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>	<4D8D78D5.7050701@cox.net>	<alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>	<4D90C4B2.6020902@gmail.com>
	<alpine.LRH.2.00.1103281346250.14152@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1103281346250.14152@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Powerfailure and snapshot consistency
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 03/28/2011 12:54 PM, Stuart D. Gathman wrote:
> On Mon, 28 Mar 2011, Les Mikesell wrote:
>
>> On 3/26/2011 11:07 AM, Stuart D. Gathman wrote:
>>>
>> Is there some non-destructive diagnostic that can tell you if a
>> running machine can or can't manage write ordering correctly through
>> all of its software and hardware layers?
>
> http://blog.nirkabel.org/2008/12/07/ext3-write-barriers-and-write-caching/
>
> The above mentions a test program that demonstrates the ext3 weakness.
> You should be able to run it in a test VM, and destroy (virtual power off)
> the VM. When the barrier=1 mount option is turned on, the mapper is
> supposed
> to log a warning if this is not supported at some level. There appear to
> be disks, however, with hardware write caching that do not correct support
> barriers. You must turn off hardware write caching on these models.
>

"Why did our reports sudden take 85 hours to run?"

-- 
"Neither the wisest constitution nor the wisest laws will secure
the liberty and happiness of a people whose manners are universally
corrupt."
Samuel Adams, essay in The Public Advertiser, 1749
