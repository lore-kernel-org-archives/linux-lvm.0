Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8R0Ugin023444
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 01:30:42 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CBjPe-000427-8T
	for linux-lvm@redhat.com; Mon, 27 Sep 2004 01:30:42 +0100
Date: Mon, 27 Sep 2004 01:30:42 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] which files, which physical volumes?
Message-ID: <20040927003042.GO11810@agk.surrey.redhat.com>
References: <41538691.2040807@myself.gen.nz>
	<20040924061754.GD13943@percy.comedia.it>
	<4153BF33.6030008@myself.gen.nz>
	<20040926202757.GG32455@omnifarious.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040926202757.GG32455@omnifarious.org>
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

On Sun, Sep 26, 2004 at 01:27:57PM -0700, Eric Hopper wrote:
> But, since pvmove doesn't seem to work yet, I

pvmove does work, but I am aware of the following restrictions 
if you want to avoid the risk of freezing:

  You must not disable o_direct when configuring;
    [I've heard some distributions/architectures may do this]
  You must not set log activation to 1 in the config file;
    [That settings's only needed for a particular sort of debugging]
  You must not pvmove a filesystem that lvm itself uses directly;
    [For 2.6.8 kernels, version 2.00.24 (if compiled against up-to-date 
    headers that define O_NOATIME correctly) is reported to improve 
    things substantially in this case; for 2.4 a kernel patch
    doing something similar gets applied by default.]
  Don't try to mix snapshots with pvmove [untested].
  I have also not tested with udev, nor with md underneath PVs.

Also:
  The allocation algorithm is as yet unable to break up contiguous 
  space: you still have to break it up yourself if it doesn't find 
  enough contiguous space. [e.g. pvmove /dev/hda:100-199]

  Test mode works a different way in LVM2 - it's designed for testing
  and simply disables all writes at the lowest level of the code 
  (to guarantee safety) - but reports success to the calling function.  
  Many code paths don't yet say 'stop here if this is test mode' so
  they stop instead with an error when they find an inconsistency
  because they thought they changed something, but it got read back
  unchanged.

Alasdair
-- 
agk@redhat.com
