Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k36EnAfk000713
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 10:49:10 -0400
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <20060405232627.GA437@canterbury.faction42.com>
References: <20060405232627.GA437@canterbury.faction42.com>
Message-Id: <6738c87e4c4c4c50c5117ff7ad60e3d8@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] lvm2 pv failure
Date: Thu, 6 Apr 2006 09:50:20 -0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

All the logical volumes on the remaining drive should be recoverable.  
If you striped the two devices, you'll probably be hurting.  If the 1st 
hard drive is only partially failed (some sectors fail, others don't), 
then you should be able to retrieve most of that data too.

  brassow

On Apr 5, 2006, at 6:26 PM, Uk1ah Sm1th wrote:

> Hello-
>
> I had one of the two drives in my LVM2 array fail. It was the first
> drive. Is it possiable that any data on the second drive could be
> recovered? Or have I lost all my data on both drives?
>
> .Ukiah Smith
>
> -- 
> "Well done is better than well said."
>              - Benjamin Franklin (1706-1790)
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
