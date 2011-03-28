Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2SHOi45004339
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:24:44 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2SHOdmB011115
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:24:40 -0400
Date: Mon, 28 Mar 2011 13:24:35 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D90C374.9080106@cfl.rr.com>
Message-ID: <alpine.LRH.2.00.1103281319240.13964@bmsred.bmsi.com>
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
	<4D8D6EAF.8050403@cox.net>
	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
	<4D8D78D5.7050701@cox.net>
	<alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
	<20110326203022.GA11173@redhat.com>
	<alpine.LRH.2.00.1103271738040.8517@bmsred.bmsi.com>
	<4D90C374.9080106@cfl.rr.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Phillip Susi <psusi@cfl.rr.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 28 Mar 2011, Phillip Susi wrote:

> On 3/27/2011 5:55 PM, Stuart D. Gathman wrote:
>> Don't need help, just trying to understand the event.  So from what you
>> said, the problem probably stems from the RAID1 resync, which could
>> make one PV "older" than the other.
>
> The data is written to the primary mirror first, so this can't happen.
> Proper use of barriers will prevent this whole scenario, so my guess is
> that you are using ext3 ( which defaults to nobarrier ) or explicitly
> mounting ext4 with nobarrier.

Ah, thank you!  Yes, I am using ext3 with EL5.5 defaults, and will now learn
about the barrier option.  Seems like a good thing to turn on when "replace
battery" comes up on the ups.

It sounds like dumb luck/divine mercy that the raid 1 PV on which the
production LV resides did not have a similar issue.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
