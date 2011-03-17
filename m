Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2HNlUoD008258
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2011 19:47:30 -0400
Received: from eastrmfepo203.cox.net (eastrmfepo203.cox.net [68.230.241.218])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2HNlJPR017923
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2011 19:47:20 -0400
Received: from eastrmimpo03.cox.net ([68.1.16.126]) by eastrmfepo203.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110317234719.BTUF32702.eastrmfepo203.cox.net@eastrmimpo03.cox.net>
	for <linux-lvm@redhat.com>; Thu, 17 Mar 2011 19:47:19 -0400
Message-ID: <4D829D86.3050001@cox.net>
Date: Thu, 17 Mar 2011 18:47:18 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <4D7E4689.9060300@cox.net>
	<20110314171726.GA18249@redhat.com>	<4D812183.6000901@cfl.rr.com>
	<20110316225539.GA3662@redhat.com>	<4D8151EF.5020301@cfl.rr.com>
	<yq1vczivauz.fsf@sermon.lab.mkp.net>
In-Reply-To: <yq1vczivauz.fsf@sermon.lab.mkp.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 03/16/2011 07:39 PM, Martin K. Petersen wrote:
>>>>>> "Phillip" == Phillip Susi<psusi@cfl.rr.com>  writes:
>
> Phillip>  The kernel has the ability to read it from the drive and report
> Phillip>  it to the user space tools, which have been patched to use it,
> Phillip>  but the WD EARS drives lie and claim 512/512 instead of
> Phillip>  512/4096.
>
> The saving grace is that modern util-linux/dm tooling aligns on 1MB by
> default instead of sector 63.
>

So, given the correct options ( -c -b 4096 ), v2.17.2 will handle 
the 2TB WD Caviar Green WD20EARS drives which I just bought for my 
external backup device...  Right?

(Along with a current lvm and kernel.)
https://www.redhat.com/archives/linux-lvm/2011-March/msg00053.html

-- 
I prefer banana-flavored energy bars made from tofu.
