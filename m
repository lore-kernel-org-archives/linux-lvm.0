Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3MGmqp31810
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 12:48:52 -0400
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net
	[68.14.253.125])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3MGmq99017440
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 12:48:52 -0400
Received: from [127.0.0.1] (helo=localhost)
	by office.labsysgrp.com with esmtp (Exim 4.24) id 1BGhNW-0005Ok-J5
	for linux-lvm@redhat.com; Thu, 22 Apr 2004 09:48:46 -0700
Received: from office.labsysgrp.com ([127.0.0.1])
	by localhost (office.lsg.internal [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20574-04 for <linux-lvm@redhat.com>;
	Thu, 22 Apr 2004 09:48:45 -0700 (MST)
Received: from jeeves.kpf.internal ([192.168.170.1])
	by office.labsysgrp.com with esmtp (Exim 4.24) id 1BGhNV-0005Oe-T0
	for linux-lvm@redhat.com; Thu, 22 Apr 2004 09:48:45 -0700
Received: from [192.168.172.107] (helo=backtobasicsmgmt.com)
	by jeeves.kpf.internal with esmtp (Exim 4.05) id 1BGhNT-0007bt-00
	for linux-lvm@redhat.com; Thu, 22 Apr 2004 09:48:43 -0700
Message-ID: <4087F778.2080001@backtobasicsmgmt.com>
Date: Thu, 22 Apr 2004 09:48:56 -0700
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid
References: <01285A15-9419-11D8-B982-000A95730E92@spamaps.org>	<40875353.8020104@gbrmpa.gov.au>
	<1082652373.9271.29.camel@arthur.cbd.careercast.com>
In-Reply-To: <1082652373.9271.29.camel@arthur.cbd.careercast.com>
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

Clint Byrum wrote:

> Side Note: if anyone knows of a cheap way to hotswap PATA disks, I'd
> like to hear about it. Right now I stick 'em in a crappy old box with
> those $2 removable IDE tray things, and have to reboot that box whenever
> I'm done copying stuff to the disks. No big deal, but it seems kinda
> cheesy. :-P

I don't think there's a reliable, safe way to hotswap PATA, and even if 
the hardware exists Linux doesn't support it well. Your best bet may be 
to get some cheap USB2 enclosures for them (one per drive :-)) and then 
you can hotswap to your heart's content.
