Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1NKnWYX000968
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 15:49:32 -0500
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NKnJ8e013491
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 15:49:20 -0500
Message-ID: <4D6572C0.6070008@abpni.co.uk>
Date: Wed, 23 Feb 2011 20:49:04 +0000
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>
	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>
	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>
	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>
	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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


> But to be useful, you need to write to one or the other.  Using the origin as a
> (mostly) readonly "template" for many VM customers works efficiently with VMs
> running in snapshots.  In that case, writes to the snapshots are just one
> write.  You *could* consider the origin a "snapshot" in that case.  But then
> you are defining "snapshot" to be the readonly branch, which is a different
> sense than how LVM uses the term.
>
This is really eye opening to the useful of LVM snapshots. I never once 
considered to use them in this way :)

But back to my original question. Let me try and word it a bit better.

Give that I currently follow the current procedure for removing and 
adding customers:

To remove customer: zero out customer LV, then remove LV
To add customer: create a new LV

And I want to run backups of a customer's LV using snapshots I just:
create a snapshot of the customer LV, then use rsync, then remove the 
snapshot. Is there anything I should do to prevent cross-customer data 
leakage?

Thanks
