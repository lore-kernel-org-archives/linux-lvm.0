Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9F8FQr02196
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 04:15:26 -0400
Received: from mailbox.waw.be (212.68.202.70.brutele.be [212.68.202.70] (may
	be forged))
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9F8FNaj005919
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 04:15:24 -0400
Received: from [192.168.10.11] (powerpapa.waw.be [192.168.10.11])
	by mailbox.waw.be (8.12.11/8.12.11) with ESMTP id i9F8G0c2013455
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 10:16:01 +0200
Mime-Version: 1.0
Message-Id: <a06110401bd95356589a8@[192.168.10.11]>
In-Reply-To: <20041010032631.GO32455@omnifarious.org>
References: <20041010032631.GO32455@omnifarious.org>
Date: Fri, 15 Oct 2004 10:15:07 +0200
From: John Seifarth <lists@waw.be>
Subject: Re: [linux-lvm] LVM2 features
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Eric Hopper posted the query below last weekend, but I've seen no 
replies on the list.

I'm a happy Linux 2.4.x kernel user with LVM 1 for a couple of years 
now, with no problems and great reliability, on around 30 machines 
running various Slackware versions.

Eric's question is exactly what I'd like to know, before migrating 
these production machines to the 2.6.x kernel.

Should I wait? Should I worry? Do I have to buy a Redhat Enterprise 
to be sure I have magic patches from Redhat in the kernel for 
reliable LVM2 operation?

I'd really like to hear from the users and developers on this list 
before changing  systems that have been working fine.

Thanks to all,

John


At 20:26 -0700 9/10/04, Eric Hopper wrote:
>
>So, what features of LVM actually work in LVM2 if you have version
>2.00.15 of the tools, and version 2.6.8 of the kernel?
>
>Do snapshots work?
>Does pvmove work?
>
>Are there interesting and weird limitations people should be aware of?
>Are there things that are distinctly better about those features than
>their LVM1 equivalents?
>
>Thanks,
>-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper) --

-- 
__________________________________________________________________
John Seifarth                               http://www.waw.be/waw/
Words & Wires SPRL                                    lists@waw.be         
Computer Consulting & Language Services   Voice: (+) 32-2-660-3943
1160 Brussels, Belgium                      Fax: (+) 32-2-675-3922
