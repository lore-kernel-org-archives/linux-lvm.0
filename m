Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5BK7P004808
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 16:07:25 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.132])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5BK7Oi5016607
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 16:07:24 -0400
Received: from westrelay04.boulder.ibm.com (westrelay04.boulder.ibm.com
	[9.17.193.32])
	by e34.co.us.ibm.com (8.12.10/8.12.2) with ESMTP id i5BK7Ixp473176
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 16:07:18 -0400
Received: from us.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by westrelay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i5BK7DlF207860
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 14:07:17 -0600
Message-ID: <40CA10AB.7040502@us.ibm.com>
Date: Fri, 11 Jun 2004 13:06:03 -0700
From: Mike Christie <mikenc@us.ibm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Multipath without round-robin?
References: <20040610203309.GA18186@c9x.org>
In-Reply-To: <20040610203309.GA18186@c9x.org>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Jedi/Sector One wrote:
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

path0 in group0, path1 in group1 etc. When path0 fails you use path1. 
Are you using multipath-tools or settiing up the table by hand. For 
mp-tools there is a failover setting. You still cannot so explciit 
failover but that is in the works.

>   The result is that the array fills up the (SANtricity) error log with
> messages like "LUN was accessed through the wrong controller".
> 
>   Is there any way to keep failover abilities without load balancing?
>   
>   Best regards,
>   
>        -Frank.
>        
