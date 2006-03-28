Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2S1btSY000712
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 20:37:55 -0500
Received: from mail.volved.com (c-71-192-139-98.hsd1.ma.comcast.net
	[71.192.139.98])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2S1blDT025736
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 20:37:48 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.volved.com (Postfix) with ESMTP id 4F15C6AC2
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 19:39:54 -0500 (EST)
Received: from mail.volved.com ([127.0.0.1])
	by localhost (monolith [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 15119-14 for <linux-lvm@redhat.com>;
	Mon, 27 Mar 2006 19:39:45 -0500 (EST)
Received: from [192.168.0.210] (unknown [192.168.0.210])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.volved.com (Postfix) with ESMTP id C0FF06AC1
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 19:39:45 -0500 (EST)
Message-ID: <442885D1.5070509@volved.com>
Date: Mon, 27 Mar 2006 19:39:45 -0500
From: Barnaby Claydon <bclaydon@volved.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 with disks greater than 2TB
References: <44286D9D.405@the-rusty-nail.com>
In-Reply-To: <44286D9D.405@the-rusty-nail.com>
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

Dan wrote:
> I have 24 - 500GB drives raided such that 11 drives + 1 hot spare per 
> raid to get 4.54TB times 2.  I want to use LVM2 to make this into one 
> ~9TB disk, but when I create the partitions and do a df -h they show 
> up as about 560GB each instead of 4.5TB each.  I do an fdisk -l and 
> they show up correctly.  I am using Slackware 10.0.  I have 
> device-mapper and LVM2 correctly installed.  I am obviously hitting a 
> 2TB limit from what I have read, but does anyone know if it is 
> possible to even do what I want?  If so, any suggestions on what I 
> need to install to get this to work?  I am running the 2.6.15.4 
> kernel.  Thanks
>
Dan, from the LVM2 FAQ ( 
http://www.tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html ) it mentions:

* For 32-bit CPUs on 2.6 kernels, the maximum LV size is 16TB.
* For 64-bit CPUs on 2.6 kernels, the maximum LV size is 8EB. (Yes, that 
is a very large number.)

 From what I recall when I built my last LVM, it's a matter of setting 
the PE size during creation (hopefully you haven't started filling with 
data yet). I think the default causes you to hit the 2TB limit, but it 
can definitely be set higher. The default PE Size seems to depend on 
Linux distribution, but mine is at 4MB and I'm at 1.5TB right now so the 
references to a 32MB default would definitely get you to 9TB.

Sorry I can't offer any other specifics - hope that helps.

-Barnaby
