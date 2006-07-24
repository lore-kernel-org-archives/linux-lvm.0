Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6OCJkwh009529
	for <linux-lvm@redhat.com>; Mon, 24 Jul 2006 08:19:46 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6OCJc7i013345
	for <linux-lvm@redhat.com>; Mon, 24 Jul 2006 08:19:41 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 9DD001F4263
	for <linux-lvm@redhat.com>; Mon, 24 Jul 2006 14:19:30 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21340-02 for <linux-lvm@redhat.com>;
	Mon, 24 Jul 2006 14:19:15 +0200 (CEST)
Message-ID: <44C4BAC0.7090508@conterra.de>
Date: Mon, 24 Jul 2006 14:19:12 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Failed PV recovery
References: <200607232019.52718.peregrine@openbrainstem.net>
In-Reply-To: <200607232019.52718.peregrine@openbrainstem.net>
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

Lamont R. Peterson wrote:
> 4.  Are there better ways I could have handled this (other than the obvious 
> like RAID to start with, etc.)?

Hi Lamont,

I strongly suggest to use: http://smartmontools.sourceforge.net/
to monitor all disks. In most cases you get warnings about
problems with your disks weeks before they fail completely.

> A few months ago, I started seeing some unreadable sectors on the 45GB drive. 

... but you have to take it seriously :-)

Dieter.
