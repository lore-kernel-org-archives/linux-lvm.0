Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4PFoDIU017473
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 25 May 2016 11:50:13 -0400
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B536821C3
	for <linux-lvm@redhat.com>; Wed, 25 May 2016 15:50:10 +0000 (UTC)
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=bdmcc-us.com)
	by friday.buadh-brath.com with esmtp (Exim 4.80)
	(envelope-from <bdmc@bdmcc-us.com>) id 1b5b4T-0001EN-5m
	for linux-lvm@redhat.com; Wed, 25 May 2016 15:50:09 +0000
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 6D0381831D0
	for <linux-lvm@redhat.com>; Wed, 25 May 2016 12:40:44 -0400 (EDT)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 10857-03-4 for <linux-lvm@redhat.com>;
	Wed, 25 May 2016 12:40:44 -0400 (EDT)
Date: Wed, 25 May 2016 12:40:44 -0400
From: Brian McCullough <bdmc@buadh-brath.com>
Message-ID: <20160525164044.GB10740@bdmcc-us.com>
References: <20160518002234.GA13276@bdmcc-us.com> <573C6BDF.4090209@redhat.com>
	<20160518145650.GA3394@bdmcc-us.com>
	<20160518183948.GA4143@bdmcc-us.com>
	<20160518184301.GA6299@bdmcc-us.com>
	<20160518194403.GA6878@bdmcc-us.com> <57430DA9.5050606@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57430DA9.5050606@redhat.com>
Subject: Re: [linux-lvm] Unable to find device with UUID XXX.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, May 23, 2016 at 04:03:21PM +0200, Marian Csontos wrote:
> On 05/18/2016 09:44 PM, Brian McCullough wrote:
> >
> >This is not looking good.
> 
> No, it is not :-(
> 
> ...
> 
> And it is also off topic for this list. 

Agreed.  That is why I haven't bothered with any more questions here.
First I have to fix the hardware issue, and then get back to the pvmove,
which is how this started.


> Try googling the disk model. Then
> try to get help on a more appropriate place than here, e.g. on superuser, or
> a mailing list (like ddrescue's) where you are more likely to get answers
> from data rescue experts.

Yes, good suggestions.  I have local people who have had drive issues in
the past and had good success with ddrescue.

I am collecting tools and replacement drives, as well as exploring all
of these avenues.


Thanks again,
Brian



> Good luck,
> 
> -- Martian
