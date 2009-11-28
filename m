Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nASGWfkc023422
	for <linux-lvm@redhat.com>; Sat, 28 Nov 2009 11:32:41 -0500
Received: from lvps87-230-0-242.dedicated.hosteurope.de
	(lvps87-230-0-242.dedicated.hosteurope.de [87.230.0.242])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nASGWPDJ003876
	for <linux-lvm@redhat.com>; Sat, 28 Nov 2009 11:32:26 -0500
Date: Sat, 28 Nov 2009 17:32:19 +0100
From: Michael Guntsche <mike@it-loops.com>
Subject: Re: [linux-lvm] Strange behaviour with initramfs and read-ahead
	settings
Message-ID: <20091128163219.GA9088@trillian.comsick.at>
References: <20091128105253.GA4389@gibson.comsick.at>
	<4B113453.1030703@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4B113453.1030703@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 2009.11.28 15:31:47 , Milan Broz wrote:
> the logic is simple here
> - if readahead is set to auto, it should inherit value from underlying device
> for all LVs on that PV
> - if there is explicitly set value in metadata, it should always use that
> (you can switch back to auto by specifying -r auto)

I updated the initramfs and all binaries and configs are the same. While
debugging it further I noticed something. Since this is a server I
connect via SSH. Immediately after reboot as soon as the ssh daemon
started the read-ahead was ok (checked via blockdev). A few seconds
later the numbers changed. Looking through my init scripts I saw that
the mdadm --monitor daemon was started as well. I temporarily disabled
it and checked after a reboot. The numbers did not change. I re-enabled
the daemon but the numbers did not change either. I tried to reproduce
the problems several times now but did not succeed. Of course this could
be a red herring and the problem will re-appear but as it is now it
seems LVM is doing the right thing and something else is changing the RA
on my setup here. I debug this further the next time the problem shows
up.

Please mind, in all this tests I only updated the initramfs only once
and the problem was still there so I am ruling out a miss-configuration.
It looks more likely that the number is changed under special
circumstances.

Kind regards,
Michael
