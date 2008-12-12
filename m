Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBCJBmTf009147
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 14:11:48 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBCJBXhB007938
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 14:11:33 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mBCJA1qf009189
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 12:10:01 -0700
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	mBCJBTO8195538
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 12:11:29 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	mBCJBS9l025884
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 12:11:28 -0700
Received: from [9.47.17.98] (chandra-ubuntu.beaverton.ibm.com [9.47.17.98])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	mBCJBSfd025837
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 12:11:28 -0700
Subject: Re: [linux-lvm] DM-MPIO - Boot from SAN
From: Chandra Seetharaman <sekharan@us.ibm.com>
In-Reply-To: <BAY107-W39509E3F8F980D0E35961D8FF90@phx.gbl>
References: <BAY107-W39509E3F8F980D0E35961D8FF90@phx.gbl>
Date: Fri, 12 Dec 2008 11:11:26 -0800
Message-Id: <1229109086.24273.79.camel@chandra-ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: sekharan@us.ibm.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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


There are two sections (one for SLES 10 SP2 and another for RHEL 5.2) in
the documentation I created on multipath
http://sources.redhat.com/lvm2/wiki/MultipathUsageGuide which talks
about installation and boot on the multipath storage device.

Hopefully that should help you through.

chandra 
On Fri, 2008-12-12 at 10:31 +0000, Mark Reardon wrote:
> Hello All,
> 
> Would anybody have a document/procedure for how to setup DM-MPIO to
> boot from SAN?
> 
> Thank,
> 
> Kind Regards,
> 
> Mark
> 
> 
> ______________________________________________________________________
> Win John Lewis vouchers with BigSnapSearch.com Search now
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
