Date: Thu, 28 Jun 2012 14:16:25 +0200
From: Spelic <spelic@shiftmail.org>
In-reply-to: <4FE97CD6.70707@redhat.com>
Message-id: <4FEC4B19.5020103@shiftmail.org>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4FE8770C.7090502@shiftmail.org>
	<20120625162703.GC17857@agk-dp.fab.redhat.com>
	<4FE97CD6.70707@redhat.com>
Subject: Re: [linux-lvm] Still missing for supporting dm-thin
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@redhat.com

On 06/26/12 11:11, Zdenek Kabelac wrote:
> Dne 25.6.2012 18:27, Alasdair G Kergon napsal(a):
>>
>> We do want to find a way to do this for non-thin volumes - the current
>> restrictions are indeed tighter than they need to be.
>>
>> For thin volumes though it's a complex problem to work out what can
>> be restored safely and what can't.  (The metadata saying where a 
>> volume is is
>> now split between the LVM metadata and the thin metadata.)
>
> We need history also for all LVs used by thin-pool - so currently the 
> safest
> is to disable restore until we are sure we could provide some 
> solution, where the user does not easily break whole VG in 
> non-repairable way.
>

Setting everything artificially as non-repairable is imho worse than 
allowing the user to repair something.
I don't know about the history problem you mention, however, why don't 
you put a warning and ask for confirmation to the user, to proceed and 
repair at least the non-thin volumes? Maybe give details about the 
history problem you mentioned and ask for confirmation.

As a temporary workaround I was thinking about creating an LV for thin 
use, which contains a PV for a new VG where the thin pools and volumes 
are inside. That would allow me to repair at least the non-thin volumes, 
wouldn't it?


>>
>>> 2) less important: it is apparently not possible to change the --zero
>>> flag for a thin pool once created.
>>
>> That should be just another lvchange parameter.
>>
>
>
> While going from  --zero mode to non zero is quite ok, the opposite 
> direction might have unexpected side effects.
>
> If the block were provisioned in the non-zero mode - they may have 
> random pool content on unwritten data areas - thus if user may 
> arbitrarily switch between zeroing type - the content would be 
> unpredictable, and we would need to keep this as some history flag - 
> once the pool was started without zeroing,
> we may not guarantee, provisioned unwritten data blocks will have zero 
> content.  So for full support we have to make clear, how we will keep 
> history info - i.e. to avoid bugreports where the weird data will be 
> received in the zero mode.  (something like tainted kernel ?)
>

I think that users willing to switch between the two should be aware of 
the problems. I'd suggest putting that as a warning or in the manpage 
but don't disallow us the zero switching.


> It is getting even more complex when I play with discard options...

This one I don't understand. It's true then! I think I need to read the 
warning you will put :-)

Thank you
