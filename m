Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5L9u5000464
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 05:56:05 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5L9u3e1021500
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 05:56:03 -0400
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 74B54E6D3E
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 10:55:15 +0100 (BST)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21878-19 for <linux-lvm@redhat.com>;
	Mon, 21 Jun 2004 10:55:15 +0100 (BST)
Received: from oak.dgreaves.com (modem-2777.putangitangi.dialup.pol.co.uk
	[81.78.202.217]) by mail.ukfsn.org (Postfix) with ESMTP id C5214E6A97
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 10:55:14 +0100 (BST)
Received: from ash.dgreaves.com ([10.0.0.66])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1BcLYx-0001HL-EJ
	for linux-lvm@redhat.com; Mon, 21 Jun 2004 10:58:03 +0100
Message-ID: <40D6B0AA.4030700@dgreaves.com>
Date: Mon, 21 Jun 2004 10:55:54 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 seems to chop performance by 33%
References: <40C86F52.4090500@dgreaves.com>	<200406101105.47606.StuartHarper@tampabay.rr.com>	<40C87F8A.7080304@dgreaves.com>	<1086885029.13087.15.camel@localhost>	<40D5D4D6.9020307@dgreaves.com>
	<20040620195316.GT6302@agk.surrey.redhat.com>
In-Reply-To: <20040620195316.GT6302@agk.surrey.redhat.com>
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

>On Sun, Jun 20, 2004 at 07:17:58PM +0100, David Greaves wrote:
>  
>
>>No-one ever replied as to why blockdev --setra / --getra is not the same 
>>as that displayed in lvdisplay
>>And it's not documented that I can find. There's a comment: "Not used by 
>>device-mapper." And that means.....?
>>    
>>
>
>Any LVM read ahead setting is ignored by LVM2 i.e. not passed to the kernel.
>
>If it's demonstrated to be useful it could still be implemented, but
>the current development priorities are still correctness and new features 
>rather than performance.
>
>Alasdair
>  
>
Thanks Alasdair

It would be good to modify the docs to be clearer and maybe say "use 
blockdev --setra"

David
