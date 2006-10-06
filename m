Message-ID: <4526C184.7070507@sandeen.net>
Date: Fri, 06 Oct 2006 15:50:12 -0500
From: Eric Sandeen <sandeen@sandeen.net>
MIME-Version: 1.0
References: <451A78DF.1060901@in.ibm.com> <20060927135705.GA30311@elte.hu>
In-Reply-To: <20060927135705.GA30311@elte.hu>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [RFC] Reverting "bd_mount_mutex" to "bd_mount_sem"
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
To: Ingo Molnar <mingo@elte.hu>
Cc: dm-devel@redhat.com, Srinivasa Ds <srinivasa@in.ibm.com>, linux-kernel@vger.kernel.org, agk@redhat.com, linux-lvm@redhat.com

Ingo Molnar wrote:
> * Srinivasa Ds <srinivasa@in.ibm.com> wrote:
> 
>>   On debugging I found out that,"dmsetup suspend <device name>" calls 
>> "freeze_bdev()",which locks "bd_mount_mutex" to make sure that no new 
>> mounts happen on bdev until thaw_bdev() is called.
>>   This "thaw_bdev()" is getting called when we resume the device 
>> through "dmsetup resume <device-name>".
>>   Hence we have 2 processes,one of which locks 
>> "bd_mount_mutex"(dmsetup suspend) and Another(dmsetup resume) unlocks 
>> it.
> 
> hm, to me this seems quite a fragile construct - even if the 
> mutex-debugging warning is worked around by reverting to a semaphore.
> 
> 	Ingo

Ingo, what do you feel is fragile about this?  It seems like this is a
reasonable way to go, except that maybe a down_trylock would be good if
a 2nd process tries to freeze while it's already frozen...

Thanks,

-Eric
