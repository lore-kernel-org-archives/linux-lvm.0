Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9GMZQr32473
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 18:35:26 -0400
Received: from natnoddy.rzone.de (natnoddy.rzone.de [81.169.145.166])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9GMZOOF009199
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 18:35:24 -0400
Received: from [192.168.0.10] (lsanca2-ar34-4-12-081-165.dsl-verizon.net
	[4.12.81.165])
	by post.webmailer.de (8.13.1/8.13.1) with ESMTP id i9GMZMiH020121
	for <linux-lvm@redhat.com>; Sun, 17 Oct 2004 00:35:23 +0200 (MEST)
Message-ID: <4171A227.6080901@gmx.net>
Date: Sat, 16 Oct 2004 15:35:19 -0700
From: langelino <langelino@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Missing volume group device
References: <41706483.8080409@gmx.net> <1097948615.3069.4.camel@adler>
	<20041016195234.GI24242@agk.surrey.redhat.com>
In-Reply-To: <20041016195234.GI24242@agk.surrey.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:

>On Sat, Oct 16, 2004 at 12:43:35PM -0500, David Mohr wrote:
>  
>
>>On Fri, 2004-10-15 at 19:00, langelino wrote:
>>    
>>
>>>[root]# ls -l /dev/vg*
>>>ls: /dev/vg*: No such file or directory
>>>      
>>>
>>Just a guess, but what about vgmknodes?
>>    
>>
Great. This was it. Thanks! This command appears to be a bit
hidden. It's neither mentioned in the lvm-howto nor in the lvm2 man-page.

> 
>And LVM2 tools ignore any '/dev/' prefix anyway in this
>context - 'lvresize vg01/lvol1' is sufficient.
>  
>
Well, yes but if one wants to shrink the filesystem on a logical volume
the tools to do so, like "resize_reiserfs", expect afaik a proper device.

Matt
