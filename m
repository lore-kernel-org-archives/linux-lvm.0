Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0582Fr32317
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2005 03:02:15 -0500
Received: from mail1.speakeasy.net (mail1.speakeasy.net [216.254.0.201])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0582EQv005587
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2005 03:02:14 -0500
Received: from dsl017-004-250.ser1.dsl.speakeasy.net (HELO [192.168.1.102])
	(rbunke@[69.17.4.250]) (envelope-sender <rbunke@speakeasy.net>)
	by mail1.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 5 Jan 2005 08:02:08 -0000
Message-ID: <41DB9F2E.7090900@speakeasy.net>
Date: Wed, 05 Jan 2005 03:02:54 -0500
From: "Richard S. Bunke" <rbunke@speakeasy.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mount my lv with write permisions locks up OS
References: <41D00FDB.20000@speakeasy.net>
	<20050104194932.GD26670@agk.surrey.redhat.com>
In-Reply-To: <20050104194932.GD26670@agk.surrey.redhat.com>
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

Alasdair G Kergon wrote:

>On Mon, Dec 27, 2004 at 08:36:27AM -0500, Richard S. Bunke wrote:
>  
>
>>If I try to 
>>mount it with write access it locks up the whole OS -- no errors.
>>    
>>
> 
>  
>
>>here is the setup:
>>lvm2
>>2.6.9 kernel on Gentoo
>>    
>>
>
>Which lvm2 version?
>It's only worth investigating if you can reproduce it with at least 
>lvm2 2.00.25 (preferably 2.00.32) and a recent kernel (eg 2.6.10).
>
>Alasdair
>  
>
Thanks for your response,

    I updated my kernel to 2.6.10 and I upgraded to lvm2 2.00.32.  I 
also switched from using the old dev file system to the new udev file 
system to see if would have any impact.   Otherwise the setup is the 
same as in my original post.   Now when I try to mount with write 
permission, the system reboots instead of freezing.  I can still mount 
read only.  I'm still not getting error messages unfortunately.  Is 
there things I can turn on that will be more verbose when errors like 
this occur?

Rick
