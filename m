Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5BLaS031115
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 17:36:28 -0400
Received: from e2.ny.us.ibm.com (e2.ny.us.ibm.com [32.97.182.102])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5BLaRi5007564
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 17:36:27 -0400
Message-ID: <40CA2582.7030000@us.ibm.com>
Date: Fri, 11 Jun 2004 14:34:58 -0700
From: Mike Christie <mikenc@us.ibm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Multipath without round-robin?
References: <20040610203309.GA18186@c9x.org> <40CA10AB.7040502@us.ibm.com>
	<1086987761.15725.51.camel@d158140025182.Cadence.COM>
In-Reply-To: <1086987761.15725.51.camel@d158140025182.Cadence.COM>
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
To: csc@cadence.com, LVM general discussion and development <linux-lvm@redhat.com>

Chris Croswhite wrote:

>>path0 in group0, path1 in group1 etc. When path0 fails you use path1. 
>>Are you using multipath-tools or settiing up the table by hand. For 
>>mp-tools there is a failover setting. You still cannot so explciit 
>>failover but that is in the works.
> 
> 
> mp-tools?
>

Sorry I got lazy. I wrote multipath-tools once above then just made up 
my own abbreviation. Now I have written a lot more than had I just 
written it out :) You can get the tools here btw 
http://christophe.varoqui.free.fr/

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
