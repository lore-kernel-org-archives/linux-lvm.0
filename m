Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n81NYlBR013370
	for <linux-lvm@redhat.com>; Tue, 1 Sep 2009 19:34:47 -0400
Received: from e1.ny.us.ibm.com (e1.ny.us.ibm.com [32.97.182.141])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n81NYUqv023475
	for <linux-lvm@redhat.com>; Tue, 1 Sep 2009 19:34:30 -0400
Received: from d01relay06.pok.ibm.com (d01relay06.pok.ibm.com [9.56.227.116])
	by e1.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id n81NY0Rs003226
	for <linux-lvm@redhat.com>; Tue, 1 Sep 2009 19:34:00 -0400
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d01relay06.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n81NYMNF2625782
	for <linux-lvm@redhat.com>; Tue, 1 Sep 2009 19:34:22 -0400
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n81NYM5L020019
	for <linux-lvm@redhat.com>; Tue, 1 Sep 2009 17:34:22 -0600
Received: from [9.47.17.98] (chandra-ubuntu.beaverton.ibm.com [9.47.17.98])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n81NYLXP019970
	for <linux-lvm@redhat.com>; Tue, 1 Sep 2009 17:34:21 -0600
Subject: Re: [linux-lvm] Does LVM have any multipath failover capabilities?
From: Chandra Seetharaman <sekharan@us.ibm.com>
In-Reply-To: <f3177b9e0909011627kfc0b7c1t2a1ab35d217b522e@mail.gmail.com>
References: <f3177b9e0909011627kfc0b7c1t2a1ab35d217b522e@mail.gmail.com>
Date: Tue, 01 Sep 2009 16:34:27 -0700
Message-Id: <1251848067.9444.8.camel@chandra-ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: sekharan@linux.vnet.ibm.com,
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


On Tue, 2009-09-01 at 17:27 -0600, Chris Worley wrote:
> For example, two iSCSI drives are actually the same drive provided via
> two different subnets: if one of the drives becomes unresponsive, I
> need LVM to seamlessly failover to the other one.
> 
> Otherwise, what's the right way to handle this?

Build lvm on top of a multipathed device (which comprises of the two
paths), with a priority callout that gives higher priority to one path
than the other.
> 
> Thanks,
> 
> Chris
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
