Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i9CN8sS9023692
	for <linux-lvm@redhat.com>; Wed, 13 Oct 2004 00:08:54 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CHVlG-0005Lt-DM
	for linux-lvm@redhat.com; Wed, 13 Oct 2004 00:08:54 +0100
Date: Wed, 13 Oct 2004 00:08:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 lockup while snapshotting root
Message-ID: <20041012230854.GZ6404@agk.surrey.redhat.com>
References: <20041012195853.GA6352@omnifarious.org>
	<20041012210331.GA4288@ti64.telemetry-investments.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041012210331.GA4288@ti64.telemetry-investments.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

It's more subtle: firstly, are you using the latest code compiled 
with O_NOATIME defined correctly, with O_DIRECT configured and
without activation=1 in the log section of lvm.conf?

If not, retest.

There is a known out-of-memory issue with snapshots (shows up
in kernel messages).

Anything other than that, run some diagnostics to see where things
are going wrong.

[It shouldn't write to /etc and it already uses mlockall]

Alasdair
-- 
agk@redhat.com
