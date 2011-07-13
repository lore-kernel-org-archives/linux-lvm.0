Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6DAlM5n022057
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2011 06:47:22 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6DAlKDK016092
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2011 06:47:20 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p6DAl451029135
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2011 03:47:06 -0700
Message-ID: <4E1D77A7.4030801@tlinx.org>
Date: Wed, 13 Jul 2011 03:47:03 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E1A526F.9090700@tlinx.org>
	<20110711025811.GF7857@agk-dp.fab.redhat.com>
In-Reply-To: <20110711025811.GF7857@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Inconsistent naming...?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



Alasdair G Kergon wrote:
> On Sun, Jul 10, 2011 at 06:31:27PM -0700, Linda A. Walsh wrote:
>   
>> Notice the device name.   notice how the single dashes are now displayed
>> as two dashes?!?!
>>     
>
> Roughly: a dash is the separator we chose, and we double it to escape a
> real dash.  But we still need to extend our escaping mechanism to handle
> characters that udev states it doesn't support in primary device names
> but which the old /dev did used to support (and so we still do).
>   
----
    Roughly, if I give a script the mount point of a logical device, how 
can I find
out the name of the LV it is on?

    Before I stumbled upon this quote-hack, I could look the mount point in
/proc/mounts and get the dev name.

    But since the devname in /proc/mounts is corrupt -- that's not possible.

    So what is the recommended way to do something that should be very 
simple,
but is not because of a specialized 'quoting' scheme (sigh)...just 
tired...I should
be in bed, but was trying to do a snap and fix the scripts...but ug...

    Maybe tomorrow...I'll think of someting else, or you have something 
to recommend,
since it sounds like you want to change the mangling even more so the 
device name won't match what what is in /proc/mounts...


(How can that not be a bug?   Does proc/mounts double quote every '-'? 
with another?_


Thanks...
linda
