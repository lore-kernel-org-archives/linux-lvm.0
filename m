Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2SHGq9A010785
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:16:52 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2SHGj11008478
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:16:47 -0400
Message-ID: <4D90C374.9080106@cfl.rr.com>
Date: Mon, 28 Mar 2011 13:20:52 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>	<4D8D6EAF.8050403@cox.net>	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>	<4D8D78D5.7050701@cox.net>	<alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>	<20110326203022.GA11173@redhat.com>
	<alpine.LRH.2.00.1103271738040.8517@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1103271738040.8517@bmsred.bmsi.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 3/27/2011 5:55 PM, Stuart D. Gathman wrote:
> Don't need help, just trying to understand the event.  So from what you
> said, the problem probably stems from the RAID1 resync, which could
> make one PV "older" than the other.

The data is written to the primary mirror first, so this can't happen.
Proper use of barriers will prevent this whole scenario, so my guess is
that you are using ext3 ( which defaults to nobarrier ) or explicitly
mounting ext4 with nobarrier.
