Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9EMwJr30872
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 18:58:19 -0400
Received: from webmail-outgoing.us4.outblaze.com
	(webmail-outgoing.us4.outblaze.com [205.158.62.67])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9EMwD0H004140
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 18:58:13 -0400
Received: from wfilter.us4.outblaze.com (wfilter.us4.outblaze.com
	[205.158.62.180])
	by webmail-outgoing.us4.outblaze.com (Postfix) with QMQP id
	79A211804272
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 22:58:07 +0000 (GMT)
Content-Disposition: inline
MIME-Version: 1.0
From: "Daniel ." <constantine@soon.com>
Date: Thu, 14 Oct 2004 17:58:07 -0500
Subject: Re: [linux-lvm] How can I restripe LVs on addition of extra PVs?
Message-Id: <20041014225807.52888101C9@ws1-3.us4.outblaze.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

 
----- Original Message ----- 
From: Markus Baertschi <markus@markus.org> 
To: LVM general discussion and development <linux-lvm@redhat.com> 
Subject: Re: [linux-lvm] How can I restripe LVs on addition of extra PVs? 
Date: Thu, 14 Oct 2004 23:27:07 +0200 
 
>  
> Daniel . wrote: 
>  
> >Hi,  
> >  
> >[I'm only familiar with LVM1, so that's what I'm referring to in the rest of the mail.  I probably could move to LVM2 if it solves my problems.] 
> > 
> Why do you want to stripe ? 
>  
> If it is for performance you'll have to pay the price in form of inflexibility. If it is for other reasons, do you have to stripe ? 
 
Yep, performance.  It's for a database machine. 
Adding disks will be a very rare occurrence, resizing LVs an uncommon occurrence.  So having LVM just do the sizing of LVs on the striped mirrors is a managment 
advantage. 
It doesn't really sound like LVM is the right tool for doing the striping itself though. 
md can do the striping but apparently it's advised to take everything offline first if the striping is part of a stack of storage systems.  That is a bit inflexible but better than 
what LVM can give me and, like I said, adding disks will be rare. 
 
Cheers 
Daniel 
-- 
___________________________________________________________
Sign-up for Ads Free at Mail.com
http://promo.mail.com/adsfreejump.htm
