Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6RFVO4j017897
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 11:31:24 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6RFVN5D009521
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 11:31:24 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 231AD1F41EF
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 17:31:12 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27270-07 for <linux-lvm@redhat.com>;
	Thu, 27 Jul 2006 17:30:59 +0200 (CEST)
Message-ID: <44C8DC2D.3000408@conterra.de>
Date: Thu, 27 Jul 2006 17:30:53 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Performance impact of LVM
References: <20060727120250.GB17454@freshdot.net>
In-Reply-To: <20060727120250.GB17454@freshdot.net>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Sander Smeenk wrote:
> I've recently subscribed here as i have some questions about LVM,
> particularly the performance impact of LVM on disk IO.

impact? no, I don't think so.

LVM does not interfere with the IO system too much.
For an IO request LVM decides where (device/sector)
to find the data. The transfer of the data itself,
to or from the device, happens as before, without LVM.
I think the delay for the lookup to find the data
is negligible compared to the transfer time itself.

But LVM may improve the performance indirectly, if
you spread your data over several disk by using striping.
But this is not guaranteed and depends on the structure
of your data and the access pattern.

there are several studies about this topic, i.E:

http://www.suse.com/en/whitepapers/lvm/lvm1.html#perf

.. although, its a bit outdated, as they still use LVM1... 

Dieter.
