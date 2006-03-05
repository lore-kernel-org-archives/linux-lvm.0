Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k25NZm120208
	for <linux-lvm@redhat.com>; Sun, 5 Mar 2006 18:35:48 -0500
Received: from mail.volved.com (c-71-192-139-98.hsd1.ma.comcast.net
	[71.192.139.98])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k25NZfhO028774
	for <linux-lvm@redhat.com>; Sun, 5 Mar 2006 18:35:41 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.volved.com (Postfix) with ESMTP id 8E0691B8D
	for <linux-lvm@redhat.com>; Sun,  5 Mar 2006 18:35:35 -0500 (EST)
Received: from mail.volved.com ([127.0.0.1])
	by localhost (monolith [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 02759-20 for <linux-lvm@redhat.com>;
	Sun,  5 Mar 2006 18:35:31 -0500 (EST)
Received: from [192.168.0.210] (unknown [192.168.0.210])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.volved.com (Postfix) with ESMTP id C69151B8C
	for <linux-lvm@redhat.com>; Sun,  5 Mar 2006 18:35:31 -0500 (EST)
Message-ID: <440B75C9.2000509@volved.com>
Date: Sun, 05 Mar 2006 18:35:37 -0500
From: Barnaby Claydon <bclaydon@volved.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 intergrated 'native' mirroring support ?
References: <6dcf0dbc0603050853s6f9ec709g8ca57083a8e8c7c5@mail.gmail.com>
In-Reply-To: <6dcf0dbc0603050853s6f9ec709g8ca57083a8e8c7c5@mail.gmail.com>
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

Hi John,

In short; No.

I believe the most common, practical method to achieve some sort of data 
protection is to have your devices in a RAID array with the LVM 
configuration on top. You're probably already aware, given that you 
mentioned 'dm', but this method means the mirroring is abstracted out 
from LVM and handled by the dedicated processes.

Sorry that wasn't a great help, but thought I'd share. I'm actually 
considering the best approach myself in preparation for rebuilding my 
file-server, and I found (oddly enough) a very informative Slashdot.org 
comment thread on the general subject:

http://ask.slashdot.org/comments.pl?sid=169386&cid=14117414

Good luck!
-Barnaby


John Smith wrote:
> Hi.
>
>
> I was wondering if current releases of LVM2 included mirroring support
> in the actual logical volume manager itself ('native' mirroring
> support), without the need for any other external mirroring solutions
> (like for example 'dm') ?
>
>
>
> Sincerely,
>
>
> John Smith.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
