Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3LCqT3S016125
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 08:52:31 -0400
Received: from smtp02.atlngahp.sys.nuvox.net (smtp-out2.atlngahp.sys.nuvox.net
	[70.43.63.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3LCptEJ028953
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 08:51:57 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp02.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3LCpqTF009822
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 08:51:52 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 892F463335
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 08:51:52 -0400 (EDT)
Message-ID: <480C8DE8.3040208@Media-Brokers.com>
Date: Mon, 21 Apr 2008 08:51:52 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding PVs to a group
References: <48091663.2070404@Media-Brokers.com>	<480917FD.60002@Media-Brokers.com>	<20080419001857.GA21151@pretender.frop.net>
	<480C697E.2020702@redhat.com>
In-Reply-To: <480C697E.2020702@redhat.com>
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

On 4/21/2008, Bryn M. Reeves (bmr@redhat.com) wrote:
> > I had never heard of the %FREE thing though. To fill out a vg I 
> would just check how many extents are available and use that on the 
> command line with -l, remember there are no spaces between -l and the 
> number of extents given.
> 
> The %VG, %LV & %FREE suffices were introduced a while back:
> 
> Version 2.02.11 - 12th October 2006
> ===================================
> [...]
>   Add %VG, %LV and %FREE suffices to lvcreate/lvresize --extents arg.

Cool... so to confirm, the correct syntax would be:

lvextend -l%FREE /dev/vg2/var

(no space between the 'l' and '%FREE')

?

Thanks again guys...

-- 

Best regards,

Charles
