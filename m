Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3MLCtp24922
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 17:12:55 -0400
Received: from solwarra.gbrmpa.gov.au (solwarra.gbrmpa.gov.au [146.116.1.5])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3MLCrKG009262
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 17:12:54 -0400
Received: from gbrmpa.gov.au (pandemonium.gbrmpa.gov.au [146.116.2.0])
	by solwarra.gbrmpa.gov.au (8.11.6+Sun/8.10.2) with ESMTP id
	i3ML7bK06658
	for <linux-lvm@redhat.com>; Fri, 23 Apr 2004 07:07:37 +1000 (EST)
Message-ID: <4088354D.3080503@gbrmpa.gov.au>
Date: Fri, 23 Apr 2004 07:12:45 +1000
From: Glen Harris <glen@gbrmpa.gov.au>
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

PATA disks are difficult. There is a very slight chance of damaging the
interface electronics, and motor driver electronics. There is also a
chance of data loss, as it is difficult to guarantee that no write-
behind cache is in operation. Finally, the operating system has to
be able to disable an IDE device and redetect it, including partition
tables, etc - somewhat of a grey area in the Linux kernel from my
reading of the kernel sources. If that's changed, please let me know!

There are cheap($30) hotswap caddies with a power switch which removes
power from the drive and places the interface bus in Hi-Z state, but
this still leaves the caching and operating system disable/redetect
issues.

Cheers, glen.
