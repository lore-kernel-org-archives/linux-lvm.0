From: "DJ TweeQ" <djtweeq@hotmail.com>
Mime-Version: 1.0
Message-ID: <F162bThA9QRmzeyNtqM00000625@hotmail.com>
Subject: [linux-lvm] Re: LVM 1.0.3 to LVM 1.0.6 upgrade path on a Redhat 8.0 Production System
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
Date: Wed Feb 19 13:37:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks for all your help ppl you know who you are. :)
(everyone but Bill and Joe)
- definately appreciated. :)

Christian:

>>using a different version of the tools and/or kernel code won't >>change 
>>the
>>limit on your LV since that limit gets set at VG creation.  The >>default
>>limit seems to have changed with 1.0.6 but that will only affect newly
>>created VGs (which will use a larger physicial extent size by >>default).  
>>I
>>think this is well documented in the FAQ and/or mailing list 
>> >>archives[1].
>>[1] google for "lvm lv size limit" and the first hit would have 
>> >>explained
>>it...  teach a man how to fish ;-)

Thanks Christian (really). :) Honestly i did not see any mention of that in 
the documentation in the HOWTO or any of the docs included with LVM. (Is it 
really there? because i can't see it) :) But a good point nonetheless. I 
suppose i would have had to have shifted the data around but i was planning 
on doing that anyway. (ie my post about sharing LV's via NFS/Samba...not 
everyone knows that in the *nix world sharing data means something 
completely different?). :) (I was going to move data across the lan to 
another LV and resize my original LV beyond 240gigs theoretically). :) So 
technically i didn't need to fish for that info. I knew the limit had been 
surpassed and if i had to i would have rebuilt the LV. :) But really i do 
appreciate your response. A very good point and very helpfull indeed (and 
not just helpfull to myself i'm sure). :)

Wily a few words for you..

>>Your subject line says that it is a "Production System", yet there
>>is no money around.

My apologies to the list i thought a production system meant that the 
machine had to be available 24/7 :) I use the two systems for Network 
Storage and for my home studio and it's instrument/sound samples and 
soundloops and tracks currently under "production" ;) believe it or not. :) 
And i don't turn them off because they need to be available to me at any 
given moment i happen to have some inspiration and have some time on my 
hands. No i don't make any money at it. I gave up on making a living in the 
music industry years ago. lol

>>You aren't going to get magic-silver-bullet hand-holding support for
>>free.

Thanks allmighty Willy should i bow to you? I wasn't expecting 
magic-silver-bullet hand-holding support. I merely asked the list if there 
were any differences or issues with upgrading LVM on a Redhat 8 system with 
it's latest kernel and if there were any issues or differences with the 
"normal" lvm upgrade path..and if so could someone mention those 
differences. (Anyone have any comments on that in particular?) :) When i ask 
for help i don't mean magic-silver-bullet hand-holding help. But i help 
people for free all the time and so can you and if you don't want to it 
doesn't mean you have to be a smartarse about it. Maybe in your case it does 
tho huh. But let me ask you something...does it not feel good to help people 
and make a difference in peoples lives?

>>If it is not business then, generally, in all other scenarios that I
>>can think of (home, education, religion, charity etc.), there's no
>>money to speak of, but there are people around that have the time and
>>inclination (for whatever reason) to put in the extra hours to do
>>things by themselves.

Really? No kidding. Generally In all other scenarios huh. You assume alot 
don't you. I think plenty of people who join mailing lists to get an 
answer/feedback on some issue/concern their having aren't neccessarily 
involved in organizations that have people around that have time to do 
things by themselves. Your hilarious. I'm trying to do things by myself or i 
wouldn't be asking. And you assume that i haven't done the research on it. 
Sorry but i wouldn't have joined this mailing list if i had found the 
answers somewhere else. Why would i? (takes time doesn't it).

:)

And...Again for all those that actually contributed towards shedding some 
light on my issues/questions. Thanks a bunch :)












































_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*   
http://join.msn.com/?page=features/junkmail
