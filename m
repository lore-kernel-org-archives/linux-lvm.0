Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4J5tFO25584
	for <linux-lvm@redhat.com>; Thu, 19 May 2005 01:55:15 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.199])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4J5t9MF001694
	for <linux-lvm@redhat.com>; Thu, 19 May 2005 01:55:09 -0400
Received: by wproxy.gmail.com with SMTP id 68so588319wri
	for <linux-lvm@redhat.com>; Wed, 18 May 2005 22:55:04 -0700 (PDT)
Message-ID: <e4fec31a05051822557d206341@mail.gmail.com>
Date: Thu, 19 May 2005 11:25:04 +0530
From: Aditya Kulkarni <aditya.r.kulkarni@gmail.com>
Subject: Re: [linux-lvm] query regarding lvm testing..
In-Reply-To: <002f01c55aaf$46c8f980$26051aac@pcp40963english>
Mime-Version: 1.0
Content-Disposition: inline
References: <mailman.4776.1116311444.734.linux-lvm@redhat.com>
	<002f01c55aaf$46c8f980$26051aac@pcp40963english>
Content-Transfer-Encoding: 8bit
Reply-To: Aditya Kulkarni <aditya.r.kulkarni@gmail.com>,
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
To: saurabh.grade@patni.com, LVM general discussion and development <linux-lvm@redhat.com>

Its not clear as to what you want to test -
[1] Your block driver OR
[2] Linux LVM OR
[3] Just want to check out the I/O performance with your block driver

Anyways - 

Check out the LVM2 page at - http://sourceware.org/lvm2/

Also see LVM2 cvs web interface -
http://sources.redhat.com/cgi-bin/cvsweb.cgi/LVM2/?cvsroot=lvm2

You can find test scripts in the cvs repository. 

Best Wishes,
Aditya Kulkarni


On 5/17/05, Saurabh Grade <saurabh.grade@patni.com> wrote:
> 
>     hi,
>           i have a block driver for san on scsi devices and i'm looking for
> lvm testing scripts which will be used in linux 2.6.
>     so, just suggest me the location from where i can get those scripts for
> linux 2.6.
> 
>   with regards
>   saurabh
> 
> 
> 
> 
> http://www.patni.com
> World-Wide Partnerships. World-Class Solutions.
> _____________________________________________________________________
> 
> This e-mail message may contain proprietary, confidential or legally
> privileged information for the sole use of the person or entity to
> whom this message was originally addressed. Any review, e-transmission
> dissemination or other use of or taking of any action in reliance upon
> this information by persons or entities other than the intended
> recipient is prohibited. If you have received this e-mail in error
> kindly delete  this e-mail from your records. If it appears that this
> mail has been forwarded to you without proper authority, please notify
> us immediately at netadmin@patni.com and delete this mail.
> _____________________________________________________________________
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 


-- 
Best Wishes,
Aditya Kulkarni
