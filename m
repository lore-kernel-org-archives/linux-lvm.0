Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9FB2Ir01022
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 07:02:18 -0400
Received: from hotmail.com (bay17-f13.bay17.hotmail.com [64.4.43.63])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9FB2BIv016805
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 07:02:12 -0400
From: "Kai Leibrandt" <k_leibrandt@hotmail.com>
Subject: Re: [linux-lvm] LVM2 features
Date: Fri, 15 Oct 2004 13:01:10 +0200
Mime-Version: 1.0
Message-ID: <BAY17-F13L947FR7mOu0000dd7c@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi John,

well, most things seem to be working, but snapshots, for me at least, work 
only on non-root partitions. If anyone has any hints if this is fixable, and 
how, please let us know!

Kai.

>From: John Seifarth <lists@waw.be>
>Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
>To: LVM general discussion and development <linux-lvm@redhat.com>
>Subject: Re: [linux-lvm] LVM2 features
>Date: Fri, 15 Oct 2004 10:15:07 +0200
>
>Eric Hopper posted the query below last weekend, but I've seen no replies 
>on the list.
>
>I'm a happy Linux 2.4.x kernel user with LVM 1 for a couple of years now, 
>with no problems and great reliability, on around 30 machines running 
>various Slackware versions.
>
>Eric's question is exactly what I'd like to know, before migrating these 
>production machines to the 2.6.x kernel.
>
>Should I wait? Should I worry? Do I have to buy a Redhat Enterprise to be 
>sure I have magic patches from Redhat in the kernel for reliable LVM2 
>operation?
>
>I'd really like to hear from the users and developers on this list before 
>changing  systems that have been working fine.
>
>Thanks to all,
>
>John
>
>
>At 20:26 -0700 9/10/04, Eric Hopper wrote:
>>
>>So, what features of LVM actually work in LVM2 if you have version
>>2.00.15 of the tools, and version 2.6.8 of the kernel?
>>
>>Do snapshots work?
>>Does pvmove work?
>>
>>Are there interesting and weird limitations people should be aware of?
>>Are there things that are distinctly better about those features than
>>their LVM1 equivalents?
>>
>>Thanks,
>>-- Eric Hopper (hopper@omnifarious.org  
>>http://www.omnifarious.org/~hopper) --
>
>--
>__________________________________________________________________
>John Seifarth                               http://www.waw.be/waw/
>Words & Wires SPRL                                    lists@waw.be         
>Computer Consulting & Language Services   Voice: (+) 32-2-660-3943
>1160 Brussels, Belgium                      Fax: (+) 32-2-675-3922
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE* 
http://join.msn.com/?page=features/junkmail
