Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6KCp9a18924
	for <linux-lvm@redhat.com>; Tue, 20 Jul 2004 08:51:09 -0400
Received: from behqexch01.intra.tinc.be (tinc-associates-gw.xdsl.easynet.be
	[81.188.68.35])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6KCp2Xn025888
	for <linux-lvm@redhat.com>; Tue, 20 Jul 2004 08:51:03 -0400
Message-ID: <40FD1530.7080609@pi.be>
Date: Tue, 20 Jul 2004 14:50:56 +0200
From: David Claessens <david.claessens@pi.be>
MIME-Version: 1.0
Subject: Re: [linux-lvm] unable to create permanent physical volume on /dev/hdc
References: <40FCFE72.9030106@pi.be> <20040720123127.GE2980@tykepenguin.com>
In-Reply-To: <20040720123127.GE2980@tykepenguin.com>
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

Thanks, this is probably the case. I disconnected hdc and hdd and hooked 
up a dvd-rom to do the re-install which was /dev/hdc during the 
re-install. I will check later today when I have access to the machine.

Patrick Caulfield wrote:
> 
> 
> Check the config file (/etc/lvm/lvm.conf) for filters. By default /dev/cdrom is
> filtered out on Debian systems and this often gets mapped to /dev/hdc. Which
> would cause those symptoms.
> 
> Simply comment out the active "filter = " line and run vgscan.
> 

-- 
There is no doubt about precisely when folks began racing each other in 
automobiles. It was the day they built the second automobile. -- Richard 
Petty
