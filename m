Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5ALTk009262
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 17:29:46 -0400
Received: from mailgate.Cadence.COM (mailgate.Cadence.COM [158.140.2.1])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5ALTji5028969
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 17:29:46 -0400
Received: from mailhub.Cadence.COM (mailhub.Cadence.COM [158.140.128.33])
	by mailgate.Cadence.COM (8.9.3/8.9.3) with ESMTP id OAA13940
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 14:29:10 -0700 (PDT)
Received: from d158140025182.Cadence.COM (localhost [127.0.0.1])
	by mailhub.Cadence.COM (8.12.8/8.8.5) with ESMTP id i5ALT3gR023611
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 14:29:23 -0700 (PDT)
Subject: Re: [linux-lvm] Multipath without round-robin?
From: Chris Croswhite <csc@cadence.com>
In-Reply-To: <20040610203309.GA18186@c9x.org>
References: <20040610203309.GA18186@c9x.org>
Message-Id: <1086903268.3543.2380.camel@d158140025182.Cadence.COM>
Mime-Version: 1.0
Date: Thu, 10 Jun 2004 14:34:28 -0700
Content-Transfer-Encoding: 7bit
Reply-To: csc@cadence.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Decided mdadm would not do the job for you?

mdadm --create -f -lmp -n2 -x1 /dev/md0 /dev/<channela> /dev/<channelb>

This works in fail over mode by explicitly telling md to treat one as a
spare.


On Thu, 2004-06-10 at 13:33, Jedi/Sector One wrote:
>   Hello.
>   
>   I'm trying to get multipath working with LVM2 (2.6.7-rc2-udm2 kernel) with
> an LSI storage array.
> 
>   The array has two FC controllers, HBAs are two identical Qlogic 2340.
>   
>   On the array, "preferred" controllers are assigned to each LUN.
>   
>   Unfortunately, it looks like dm-multipath always does round-robin load
> balancing.
> 
>   The result is that the array fills up the (SANtricity) error log with
> messages like "LUN was accessed through the wrong controller".
> 
>   Is there any way to keep failover abilities without load balancing?
>   
>   Best regards,
>   
>        -Frank.
>        
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
