Message-Id: <3C5831E7.9060705@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] software RAID over LVM
References: <3C57354D.1070601@birddog.com> <1012366706.5900.6.camel@UberGeek>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Jan 30 11:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Austin,

	Just as an aside, I have done all of those configurations with no LVM 
involved.  RAID0+1, RAID1+0, and RAID5 on top of mirrored devices.  Yes 
RAID1+0 isn't very smart, but we did it.  It is much simpiler, and more 
reliable to have RAID underneath LVM.  Not because LVM is unreliable, 
but if you forget, or don't realize both halves of a mirror got migrated 
to the same disks your mirror might be a lot less redundant then you 
believe it is.  Wow, I just restated the a FAQ entry in a very poor 
manner...

	LVM didn't try to be all incompassing.  It could have been, but it would 
have made things more complicated and duplicated a bunch of work from 
what I have read on this list.

		Kirby


Austin Gonyou wrote:
> I can think of MANY uses for this. The main one would be a relatively
> cheap way of making a RAID0+1, or stripe of mirrors. If you don't have
> any hardware to do this with, then software is next. It'd be nice to be
> able to do this, for sure. You could even do 0+5, or something crazy
> like that too.
> 
> 
> On Tue, 2002-01-29 at 17:50, Kirby C. Bohling wrote:
> 
>>Paul,
>>
>>	I haven't done it.  I have done mirrors underneath, but I am
>>curious what 
>>is the reasoning and/or application.  The only thing I can think up is 
>>so you can migrate your mirrors to faster drives easily.  However, 
>>putting the mirror underneath should allow you to move off one mirror 
>>onto another.
>>
>>	I don't believe that mirroring can be expanded like a filesystem
>>can.  In 
>>order to make the mirror bigger, you have to break the mirror as far as 
>>I know.  So what are you planning on doing with it, or is it just "to 
>>see if it could be done".
>>
>>	Thanks,
>>		Kirby
>>
>>lvm@agilecat.mailshell.com wrote:
>>
>>>Hi all,
>>>
>>>I understand the use of LVM over software RAID.
>>>But is it possible to use software RAID ON TOP
>>>of LVM?  For example, have a RAID-1 mirroring
>>>array created from two logical volumes.
>>>
>>>I've tried and it seems to be working.  Is
>>>it safe to do this?  Any pitfalls?
>>>
>>>Thanks!
>>>
>>>Paul
>>>
>>>_______________________________________________________
>>>The FREE service that prevents junk email http://www.mailshell.com
>>>
>>>_______________________________________________
>>>linux-lvm mailing list
>>>linux-lvm@sistina.com
>>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>>
>>>
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
