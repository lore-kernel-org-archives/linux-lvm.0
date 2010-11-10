Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAA0LT7Q029051
	for <linux-lvm@redhat.com>; Tue, 9 Nov 2010 19:21:29 -0500
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.120])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAA0LE91015186
	for <linux-lvm@redhat.com>; Tue, 9 Nov 2010 19:21:14 -0500
Message-ID: <4CD9E579.8070507@cfl.rr.com>
Date: Tue, 09 Nov 2010 19:21:13 -0500
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4CD35D3E.5030200@cfl.rr.com>
	<Pine.LNX.4.64.1011050022550.31032@bmsred.bmsi.com>
	<4CD5F804.3040906@cfl.rr.com>
	<Pine.LNX.4.64.1011071710110.20225@bmsred.bmsi.com>
	<Pine.LNX.4.64.1011091705030.27920@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1011091705030.27920@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM + raid + san
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
To: "Stuart D. Gathman" <stuart@bmsi.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 11/09/2010 05:15 PM, Stuart D. Gathman wrote:
> Actually, this would be an interesting driver to develop.  If each
> server primarily works on its own LV, then there shouldn't be much

I think the existing dm raid driver would work for this; it just needs 
to be finished and integrated with lvm.  Unlike mdadm, the dm raid 
driver is only activated on the physical extents of the physical volumes 
that make up the logical volume, rather than the whole disk or 
partition, so each host should be able to use the cluster locking daemon 
to make sure only one activates any given lv at a time.  If a server 
goes down then another can activate the lv and take over.

> It is an interesting idea to avoid a traditional SAN as a single point of
> failure (the switch connecting the hosts and disks would still be a single
> point of failure, but a switch is simpler than a SAN server).  All hosts would
> have to be trusted.

And switches can be redundant.  I understand that at least some sas 
drives have two redundant ports that can each be connected to a 
different expander and the servers can be connected to both expanders.
