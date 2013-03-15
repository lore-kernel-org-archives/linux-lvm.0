Message-ID: <51432305.7020007@redhat.com>
Date: Fri, 15 Mar 2013 14:32:53 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <513090CA.8050904@pse-consulting.de>
	<aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
	<5136F2F1.3020202@pse-consulting.de>
	<5136F738.1010707@hoster-ok.com>
	<5137091A.4070300@pse-consulting.de>
	<51370DDB.5010002@hoster-ok.com>
	<5137137B.5010800@pse-consulting.de>
	<5137267A.7040000@hoster-ok.com>
	<513733C0.2020207@pse-consulting.de>
	<5137447B.7030906@hoster-ok.com>
	<514097C8.4030602@pse-consulting.de>
	<5140AF20.7060406@hoster-ok.com>
	<5140B968.4030800@pse-consulting.de>
	<5140C5E2.8050203@hoster-ok.com>
	<514247D5.8000605@pse-consulting.de>
	<5142E33F.2060002@redhat.com> <5142E9DD.30701@hoster-ok.com>
	<5142EBBC.6030300@redhat.com> <514319C7.8020601@hoster-ok.com>
In-Reply-To: <514319C7.8020601@hoster-ok.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshot with Clustered VG [SOLVED]
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
To: Vladislav Bogdanov <bubble@hoster-ok.com>
Cc: Andreas Pflug <pgadmin@pse-consulting.de>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 15.3.2013 13:53, Vladislav Bogdanov napsal(a):
> 15.03.2013 12:37, Zdenek Kabelac wrote:
>> Dne 15.3.2013 10:29, Vladislav Bogdanov napsal(a):
>>> 15.03.2013 12:00, Zdenek Kabelac wrote:
>>>> Dne 14.3.2013 22:57, Andreas Pflug napsal(a):
>>>>> On 03/13/13 19:30, Vladislav Bogdanov wrote:
>>>>>>
>>> You could activate LVs with the above syntax [ael]
>> (there is a tag support - so you could exclusively activate LV on remote
>> node in via some configuration tags)
>
> Could you please explain this - I do not see anything relevant in man pages.

Let's say - you have 3 nodes  A, B, C - each have a TAG_A, TAG_B, TAG_C,
then on node A you may exclusively activate LV which has TAG_B - this
will try to exclusively active LV on the node which has it configured
in lvm.conf  (see the  volume_list= [])

>
>>
>> And you want to 'upgrade' remote locks to something else ?
>
> Yes, shared-to-exclusive end vice verse.

So how do you convert the lock from   shared to exclusive without unlock
(if I get it right - you keep the ConcurrentRead lock - and you want to take 
Exlusive -  to  make change state from  'active' to 'active exlusive')
https://en.wikipedia.org/wiki/Distributed_lock_manager

Clvmd 'communicates' via these locks.
So the proper algorithm needs to be there for ending with some proper state 
after locks changes (and sorry I'm not a dlm expert here)


>>
>> What would be the use-case you could not resolve with current command
>> line args?
>
> I need to convert lock on a remote node during last stage of ver3
> migration in libvirt/qemu. That is a "confirm" stage, which runs on a
> "source" node, during which "old" vm is killed and disk is released.
> So, I first ("begin" stage) convert lock from exclusive to shared on a
> source node, then obtain shared lock on a target node (during "prepare"

Which most probably works only your environment - since you do not try to
'break' the logic - but it's probably not a generic concept - i.e.
in this controlled environment you may live probably happily even with
local activation of LVs - since you always know what the tool is doing.

> There is no other events on a destination node in ver3 migration
> protocol, so I'm unable to convert lock to exclusive there after
> migration is finished. So I do that from a source node, after it
> released lock.
>
>>
>> Is that supported by dlm (since lvm locks are mapped to dlm)?
> Command just sent to a specific clvm instance and performed there.

As said - the 'lock' is the thing which controls the activation state.
So faking it on the software level may possible lead to inconsistency between 
the dlm and clvmd view of the lock state.

Zdenek
