Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9E2kohg017059
	for <linux-lvm@redhat.com>; Tue, 13 Oct 2009 22:46:50 -0400
Received: from kcout02.prserv.net (kcout02.prserv.net [12.154.55.32])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9E2kcCw025641
	for <linux-lvm@redhat.com>; Tue, 13 Oct 2009 22:46:38 -0400
Message-ID: <4AD53B86.6070701@attglobal.net>
Date: Tue, 13 Oct 2009 19:46:30 -0700
From: Eddie <stunnel@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to Fix Bad PV Allocation
References: <4AD52D2D.70202@attglobal.net>
	<Pine.LNX.4.64.0910132150130.1055@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0910132150130.1055@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Reply-To: stunnel@attglobal.net,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Stuart D. Gathman wrote:
> On Tue, 13 Oct 2009, Eddie wrote:
>
>   
>> How can I correct the PV allocations, so that they reflect the actual device,
>> not the "incorrect" sizes, that were present when PVCREATE was originally run.
>>     
>
> pvresize
>
>   
I didn't see that one mentioned in the HOWTO, but thanks.  That was 
easy.  :)

Cheers,
Eddie
