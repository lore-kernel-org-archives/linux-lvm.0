Message-ID: <54E6F1EE.9080309@redhat.com>
Date: Fri, 20 Feb 2015 09:35:58 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAEhYyLibaMTiXhyVrmt5bF5U9kaBn_gzXRjkQRaPCFVp88gYmw@mail.gmail.com>
	<54E6F10C.6060900@redhat.com>
In-Reply-To: <54E6F10C.6060900@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgmknodes --refresh blocks forever waiting on a
	semaphore
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
To: joelfriedly@gmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 02/20/2015 09:32 AM, Peter Rajnoha wrote:
> On 02/19/2015 11:19 PM, Joel Friedly wrote:
>> I'm trying to some disk failure testing, and we're using LVM on top of
>> raw disks.  After replacing the disk, the LV on the disk is unreadable
>> until I run vgmknodes --refresh.  That command hangs forever, but I can
>> kill -9 it.  After running the command, everything works again and I can
>> read the LV.
>>
>> I've seen this twice, so I ran strace the second time and you can find
>> the output here:  https://gist.github.com/jfriedly/50fe9134c4bc616f9f90
>> and Ctrl-F for "425989"
>>
>> On line 4250, LVM sets the semaphore's value to 1, then it immediately
>> checks the semaphore's value and confirms that it's 1.
>>
>> On line 4253, LVM increments the semaphore's value to 2, then it
>> immediately checks the semaphore's value and confirms that it's 2.
>>
>> On line 4295, LVM gets the semaphore's value and sees that it's 2, then
>> it immediately decrements the value to 1 and then waits indefinitely for
>> the value to hit 0.
>>
>>
>> Is LVM expecting some other process to decrement the semaphore?
> 
> Yes, it's expecting notification from udev rule - the 95-dm-notify.rules
> (usually found in /lib/udev/rules.d directory) - that one contains
> "dmsetup udevcomplete" call which decrements the semaphore. The --refresh
> causes CHANGE udev events to be generated for the LV and LVM waits for
> any udev processing to be finished before it continues further.
> 
> What Linux distribution is this?
> 

(Sorry, you've added that info already, I've noticed - it's Ubuntu.)

-- 
Peter
