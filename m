Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l660Cp8t009762
	for <linux-lvm@redhat.com>; Thu, 5 Jul 2007 20:12:51 -0400
Received: from mail.futurelabusa.com (c-67-165-227-32.hsd1.co.comcast.net
	[67.165.227.32])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l660CobT021077
	for <linux-lvm@redhat.com>; Thu, 5 Jul 2007 20:12:50 -0400
Received: from i0.futurelabusa.com (i0.fu-lab.com [192.168.0.101])
	by mail.futurelabusa.com (Postfix) with ESMTP id 2D0BA776F6
	for <linux-lvm@redhat.com>; Thu,  5 Jul 2007 18:12:49 -0600 (MDT)
Date: Thu, 05 Jul 2007 18:12:49 -0600
From: Jim Schatzman <james.schatzman@futurelabusa.com>
Subject: Re: [linux-lvm] Pvmove Cannot Be Aborted
In-Reply-To: <468D2221.7000004@vdberg.org>
References: <20070704140438.8BE0177702@mail.futurelabusa.com>
	<468D2221.7000004@vdberg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Message-Id: <20070706001249.2D0BA776F6@mail.futurelabusa.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

At 10:53 AM 7/5/2007, you wrote:
>Jim Schatzman wrote:
>> So... I have learned my lesson - never use pvmove on a bad drive. 
>
>Your VG and LVs are not in worse shape now (after the stuck pvmove) than
>they would have been if you did not attempt the pvmove, right? I guess
>you did not use use raid on top of or under lvm?
>
>Sincerely,
>
>Richard van den Berg
Thanks for your question.

The problem is more complicated than I explained. The drive (a late model SATA device) apparently tries to automatically relocate bad sectors. The relocate invariably fails. What happens after a while is that the system log gets filled with thousands of error messages and Linux eventually disables the drive. The drive then disables itself somehow (I have not figured this out) so that if I reboot then Linux reports "soft reset failed" and disables the drive again.

When the drive is offline, Linux LVM refuses to activate the LVs on the VG (obviously) unless I use dmsetup to error out the bad drive. If I do that, the LV ends up in a "d" state ("device present without tables"). I am not sure what "tables" are meant. I am certain that there are many EXT2 superblocks on the good drives, including the first one, so that isn't it. If I had to guess, I would think that what is meant is the LVM tables. 

I can power cycle the drive and computer about 20 times to get the drive to come back online (it would be helpful if I could get SATA hot-swap to work so I wouldn't have to reboot the computer but no joy even though the controller supposedly supports hot swap - maybe "hot swap" is different from "hot initial plug in"?). Then I can copy off a bit of data until the drive goes haywire again and Linux disables it. After a few days, I was able to retrieve all the good data I was going to get.

What would have saved me a lot of time is to have been able to mount the LV filesystems without the bad drive via the dmsetup mechanism. That did not work. My guess is that this is due to my executing "pvmove" in a vain attempt to replace the bad drive without having to rebuild the VG from scratch. Once the pvmove failed, I was hosed, apparently. No going forward and no going back.

Jim Schatzman
