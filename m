Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3AAneMb016398
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 06:49:40 -0400
Received: from oceanic.CalvaEDI.COM (oceanic.CalvaEDI.COM [81.252.197.184])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3AAmanX007817
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 06:48:37 -0400
Received: from f.baltic (baltic.CalvaEDI.COM [192.168.6.66])
	(authenticated (0 bits))
	by oceanic.CalvaEDI.COM (8.11.1-20030923/8.11.1/6.31) with ESMTP id
	n3AAmZr29118
	(using TLSv1/SSLv3 with cipher RC4-MD5 (128 bits) verified NO)
	for <linux-lvm@redhat.com>; Fri, 10 Apr 2009 12:48:36 +0200 (CEST)
Message-ID: <49DF2403.10009@Calva.COM>
Date: Fri, 10 Apr 2009 12:48:35 +0200
From: John Hughes <john@Calva.COM>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"?
References: <49DCA275.8070203@Calva.COM> <49DF02A7.50606@Calva.COM>
	<20090410101959.GA21846@us.ibm.com>
In-Reply-To: <20090410101959.GA21846@us.ibm.com>
Content-Transfer-Encoding: 7bit
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

malahal@us.ibm.com wrote:
> John Hughes [john@Calva.COM] wrote:
>   
>> John Hughes wrote:
>>     
>>>                if (lp->stripes > 1) {
>>>                        log_error("mirrors and stripes are currently "
>>>                                  "incompatible");
>>>                        return 0;
>>>                }
>>>
>>> Should I just stick with mdadm for my mirroring and striping needs?
>>>       
>
> You can do it today with some hassle or wait until someone implements a
> feature called 'generic layering'. The feature really means, treat some
> LVs as PVs!
>
> How can you do raid10 today? Create two raid0 LVs. Lets us call these
> lvgroup0/lv0 and lvgroup0/lv1. Now create raid1 lv in lvgroup1 where
> lvgroup1's PVs are lvgroup0/lv0 and lvgroup0/lv1.
>
> Isn't that a rai10 volume?
>   
To increase the chances of surviving a double-disk failure it would be 
better to raid-0 a bunch of raid-1's.

Are we sure there are no deadlock problems with LVM2 layered on top of LVM2?
