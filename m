Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2SHQIK3014748
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:26:18 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2SHQDol011920
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 13:26:13 -0400
Received: from ns4.futuresource.com ([208.10.26.50])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id p2SHPB03030794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 12:25:12 -0500
Received: from [172.22.181.98] ([172.22.181.98])
	by ns4.futuresource.com (8.13.8/8.13.8) with ESMTP id p2SHQATf026724
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2011 12:26:11 -0500
Message-ID: <4D90C4B2.6020902@gmail.com>
Date: Mon, 28 Mar 2011 12:26:10 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>	<4D8D6EAF.8050403@cox.net>	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>	<4D8D78D5.7050701@cox.net>
	<alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
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

On 3/26/2011 11:07 AM, Stuart D. Gathman wrote:
>
> It is not a bug. Some progress can be made with barriers (similar to
> fsync())
> that block until all affected blocks are confirmed written on all devices
> through all levels of the storage stack (e.g. written to all legs
> of a raid1 device). My database does an fsync after each journal batch,
> and I think it reasonable to hope that this guarantees that the writes
> from the journal batch complete before any subsequent writes. I don't
> depend on any other ordering.

Is there some non-destructive diagnostic that can tell you if a running 
machine can or can't manage write ordering correctly through all of its 
software and hardware layers?

-- 
   Les Mikesell
    lesmikesell@gmail.com
