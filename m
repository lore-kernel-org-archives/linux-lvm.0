Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q35G2OKb016913
	for <linux-lvm@redhat.com>; Thu, 5 Apr 2012 12:02:24 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q35G2Nlt006763
	for <linux-lvm@redhat.com>; Thu, 5 Apr 2012 12:02:23 -0400
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id 4B17A202D5
	for <linux-lvm@redhat.com>; Thu,  5 Apr 2012 11:02:21 -0500 (CDT)
Date: Thu, 5 Apr 2012 11:02:21 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120405110221.31bf8cd4@bettercgi.com>
In-Reply-To: <4F7CE981.1080206@nuclearwinter.com>
References: <4F7CE981.1080206@nuclearwinter.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Frozen root volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

What does your storage stack look like? Something in the stack froze
up. It could be your SAN storage device, if you're using one, the switch
connecting to the SAN, if you're using one, the RAID card, if you're
using one, the software RAID, if you're using software RAID ...

A reasonable next step if there is nothing in the logs because are on
the root device might be to use rsyslog to send the log data to a
neighboring machine. That would you can see the messages in the log no
matter which local storage has a problem. 
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Wed, 04 Apr 2012 19:38:25 -0500
Larkin Lowrey <llowrey@nuclearwinter.com> wrote:

> I've been chasing problem where my root volume freezes up and will not
> process any more i/o (at least no more writes).
> 
> The iostat output below shows what is going on when it gets in this
> state. The dm-1 device is stuck with avgrq-sz of 50 but zeros for all
> other values. All disks and raid devices hosting this volume show
> zeros across the board.
> 
> I am unable to cleanly shut down as all writes to the root fs are
> blocked so I have to do a hard reset.
> 
> I've attached the output of 'echo t > /proc/sysrq-trigger'.
> 
> This phenomenon did not occur prior to updating from F15 -> F16 so I
> doubt it's a hardware issue.
> 
> Any ideas or suggestions?
> 
> --Larkin
> 
> 
> Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s
> avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
> sda               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdb               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdc               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdd               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sde               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdf               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdg               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdh               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdi               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdj               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdk               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdl               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> md0               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> md1               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> md2               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> md10              0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdm               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdn               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdo               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdq               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdp               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdr               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sds               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> sdt               0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> dm-0              0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> dm-1              0.00     0.00    0.00    0.00     0.00     0.00
> 0.00    50.00    0.00    0.00    0.00   0.00 100.00
> dm-2              0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> dm-3              0.00     0.00    0.00    0.00     0.00     0.00
> 0.00     0.00    0.00    0.00    0.00   0.00   0.00
> 
> 
