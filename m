Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2SIYdCt028420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 14:34:40 -0400
Date: Mon, 28 Mar 2011 14:34:39 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110328183439.GA27675@redhat.com>
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
	<4D8D6EAF.8050403@cox.net>
	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
	<4D8D78D5.7050701@cox.net>
	<alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
	<20110326203022.GA11173@redhat.com>
	<alpine.LRH.2.00.1103271738040.8517@bmsred.bmsi.com>
	<4D90C374.9080106@cfl.rr.com>
	<alpine.LRH.2.00.1103281319240.13964@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.00.1103281319240.13964@bmsred.bmsi.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Mar 28 2011 at  1:24pm -0400,
Stuart D. Gathman <stuart@bmsi.com> wrote:

> On Mon, 28 Mar 2011, Phillip Susi wrote:
> 
> >On 3/27/2011 5:55 PM, Stuart D. Gathman wrote:
> >>Don't need help, just trying to understand the event.  So from what you
> >>said, the problem probably stems from the RAID1 resync, which could
> >>make one PV "older" than the other.
> >
> >The data is written to the primary mirror first, so this can't happen.
> >Proper use of barriers will prevent this whole scenario, so my guess is
> >that you are using ext3 ( which defaults to nobarrier ) or explicitly
> >mounting ext4 with nobarrier.
> 
> Ah, thank you!  Yes, I am using ext3 with EL5.5 defaults, and will now learn
> about the barrier option.  Seems like a good thing to turn on when "replace
> battery" comes up on the ups.

RHEL5.x's DM doesn't support barriers (nor does MD afaik).
