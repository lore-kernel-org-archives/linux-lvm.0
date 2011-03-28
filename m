Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2SHXQ3l011438
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:33:26 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2SHXLdP020194
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:33:22 -0400
Message-ID: <4D90C75A.2090203@cfl.rr.com>
Date: Mon, 28 Mar 2011 13:37:30 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
	<4D8D6EAF.8050403@cox.net>
	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
	<4D8D78D5.7050701@cox.net>
	<alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
	<20110326203022.GA11173@redhat.com>
	<alpine.LRH.2.00.1103271738040.8517@bmsred.bmsi.com>
	<4D90C374.9080106@cfl.rr.com>
	<alpine.LRH.2.00.1103281319240.13964@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1103281319240.13964@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"
To: "Stuart D. Gathman" <stuart@bmsi.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 3/28/2011 1:24 PM, Stuart D. Gathman wrote:
> Ah, thank you!  Yes, I am using ext3 with EL5.5 defaults, and will now
> learn
> about the barrier option.  Seems like a good thing to turn on when "replace
> battery" comes up on the ups.
> 
> It sounds like dumb luck/divine mercy that the raid 1 PV on which the
> production LV resides did not have a similar issue.

It actually should be on all the time, which is why it defaults to on in
ext4.  A UPS doesn't help if the kernel crashes or some hardware fails.
 I have no idea why incidents like this are not common place with ext3
since it is inherently unsafe without barriers, whether you are using
lvm or mdadm or not.
