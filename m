Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m04Ihl3w031035
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 13:43:47 -0500
Received: from mailgw.soe.ucsc.edu (mailgw.cse.ucsc.edu [128.114.48.9])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m04Ih1m6011515
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 13:43:01 -0500
Received: from [128.114.56.35] (wraith.cse.ucsc.edu [128.114.56.35])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailgw.soe.ucsc.edu (Spam Firewall) with ESMTP id 0614B423DB8
	for <linux-lvm@redhat.com>; Fri,  4 Jan 2008 10:42:59 -0800 (PST)
Message-ID: <477E7E31.6080500@soe.ucsc.edu>
Date: Fri, 04 Jan 2008 10:42:57 -0800
From: Erich Weiler <weiler@soe.ucsc.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to 'copy' a volume?
References: <Pine.LNX.4.44.0801041117060.2402-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0801041117060.2402-100000@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:
>> The machine then had a kernel panic (I think).  I'm remote so I'm not 
>> sure, but I'll be going in soon to check on it.  Not a critical system 
>> so no big deal.  I'll let everyone one what I see at the console.
> 
> Could be very slow.  On one of my systems, a blocksize of 300k is optimal.
> The default block size is usually 512 bytes.
> 
> # dd if=/dev/volgroup00/original of=/dev/volgroup00/clone bs=300k

It was probably slow, as you say, but it turns out our machines were 
powered off by one of the other guys in our group because the UPS was 
draining fast.  Power was lost because of a major storm on the central 
California coast.

I have a feeling it was working but was interrupted.  I'll try again 
when power is restored...

Thanks so much for your input!

-erich
