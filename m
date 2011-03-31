Received: from [10.34.27.192] (dhcp-27-192.brq.redhat.com [10.34.27.192])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2VCF4NE029276
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2011 08:15:05 -0400
Message-ID: <4D947048.8060006@redhat.com>
Date: Thu, 31 Mar 2011 14:15:04 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20110329124814.7fd059c7@bettercgi.com>	<784dab.9d29.12f01ad2e6f.Coremail.ooolinux@163.com>	<5fe2faea.20827.12f07068fe6.Coremail.ooolinux@163.com>	<20110330132837.07e8d0ea@bettercgi.com>
	<alpine.LRH.2.00.1103302019060.412@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1103302019060.412@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] copy lv from lv?
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

Dne 31.3.2011 02:27, Stuart D. Gathman napsal(a):
> On Wed, 30 Mar 2011, Ray Morris wrote:
> 
>>> 1..how to pipe two copy  together
>>
>> This is what I use after some experimenting.  I've found
>> it's often far faster than the more obvious use of dd:
>>
>> nice -5 dd if=/dev/clones/from bs=64M iflag=direct |
>>        dd of=/dev/scratch/to bs=64M oflag=direct
>>
>> I use 64 MB extents. For smaller extents, a matching dd
>> block size might be good.
> 
> Thanks for that recipe.  It ought to be in lvm2 as an lvcopy utility
> (dynamically determining extent size, etc).
> 


Isn't this already done in a better way by 'dd' using 'zero' copy mechanism ??
(assuming it is already using either  'mmap()' -> 'write()' or 'splice()'  as
your proposed piped copy is doing a lot of pointless memory copies and cache
trashing.

If it's still faster - then your kernel setting for buffering are most probaly
not tuned for the best performance.

Zdenek
