Message-ID: <5143355A.2090201@hoster-ok.com>
Date: Fri, 15 Mar 2013 17:51:06 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
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
	<51432305.7020007@redhat.com>
In-Reply-To: <51432305.7020007@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Andreas Pflug <pgadmin@pse-consulting.de>, LVM general discussion and development <linux-lvm@redhat.com>

15.03.2013 16:32, Zdenek Kabelac wrote:
> Dne 15.3.2013 13:53, Vladislav Bogdanov napsal(a):
>> 15.03.2013 12:37, Zdenek Kabelac wrote:
>>> Dne 15.3.2013 10:29, Vladislav Bogdanov napsal(a):
>>>> 15.03.2013 12:00, Zdenek Kabelac wrote:
>>>>> Dne 14.3.2013 22:57, Andreas Pflug napsal(a):
>>>>>> On 03/13/13 19:30, Vladislav Bogdanov wrote:
>>>>>>>
>>>> You could activate LVs with the above syntax [ael]
>>> (there is a tag support - so you could exclusively activate LV on remote
>>> node in via some configuration tags)
>>
>> Could you please explain this - I do not see anything relevant in man
>> pages.
> 
> Let's say - you have 3 nodes  A, B, C - each have a TAG_A, TAG_B, TAG_C,
> then on node A you may exclusively activate LV which has TAG_B - this
> will try to exclusively active LV on the node which has it configured
> in lvm.conf  (see the  volume_list= [])

Aha, if I understand correctly this is absolutely not what I need.
I want all this to be fully dynamic without any "config-editing voodoo".

> 
>>
>>>
>>> And you want to 'upgrade' remote locks to something else ?
>>
>> Yes, shared-to-exclusive end vice verse.
> 
> So how do you convert the lock from   shared to exclusive without unlock
> (if I get it right - you keep the ConcurrentRead lock - and you want to
> take Exlusive -  to  make change state from  'active' to 'active exlusive')
> https://en.wikipedia.org/wiki/Distributed_lock_manager

I just pass LCKF_CONVERT to dlm_controld if requested and needed. And
that is dlm's task to either satisfy conversion or to refuse it.

> 
> Clvmd 'communicates' via these locks.

Not exactly true.

clvmd does cluster communications with corosync, which implements
virtual synchrony, so all cluster nodes receive messages in the same order.
At the bottom, clvmd uses libdlm to communicate with dlm_controld and
request it to lock/unlock.
dlm_controld instances use corosync for membership and locally manages
in-kernel dlm counter-part, which uses tcp/sctp mesh-like connections to
communicate.
So request from one clvmd instance goes to another and goes to kernel
from there, and then it is distributed to other nodes. Actually that
does not matter where does it hits kernel space if it supports
delegation of locks to remote nodes, but I suspect it doesn't. But if it
doesn't support such thing, then the only option to manage lock on a
remote node is to request that's node dlm instance to do the locking job.

> So the proper algorithm needs to be there for ending with some proper
> state after locks changes (and sorry I'm not a dlm expert here)

That is what actually happens.
There is just no difference between running (to upgrade local lock to
exclusive on node <node>.

ssh <node> lvchange -aey --force VG/LV

or

lvchange -aey --node <node> --force VG/LV

The same command, it is just sent via different channels.

Again, I just send locking request to a remote clvmd instance through
corosync.
It asks its local dlm to convert (acquire, release) lock and returns its
answer back. After dlm answers, operation is either performed, and then
OK is send back to a initiator, or refused, and the error is sent back.

> 
> 
>>>
>>> What would be the use-case you could not resolve with current command
>>> line args?
>>
>> I need to convert lock on a remote node during last stage of ver3
>> migration in libvirt/qemu. That is a "confirm" stage, which runs on a
>> "source" node, during which "old" vm is killed and disk is released.
>> So, I first ("begin" stage) convert lock from exclusive to shared on a
>> source node, then obtain shared lock on a target node (during "prepare"
> 
> Which most probably works only your environment - since you do not try to
> 'break' the logic - but it's probably not a generic concept - i.e.
> in this controlled environment you may live probably happily even with
> local activation of LVs - since you always know what the tool is doing.

I prefer to do not allow anybody else to open an LV at all (and to be
able to take snapshots of it when needed on a node where it is
exclusively locked). That's why I implemented a lock-manager driver for
libvirt, which controls inter-node locks with clvm exclusive activation,
and then controls inner open attempts with local locking mechanism.

While libvirt already has two lok drivers, neither of fully satisfy me
because or shared storage requirement. And, I want to take snapshots,
that's why I need exclusive activation.

I plan to send libvirt patches to the libvirt list if lvm part is
accepted (otherwise it makes no sense to do that and I will need to
maintain everything out-of-the-tree).

> 
>> There is no other events on a destination node in ver3 migration
>> protocol, so I'm unable to convert lock to exclusive there after
>> migration is finished. So I do that from a source node, after it
>> released lock.
>>
>>>
>>> Is that supported by dlm (since lvm locks are mapped to dlm)?
>> Command just sent to a specific clvm instance and performed there.
> 
> As said - the 'lock' is the thing which controls the activation state.
> So faking it on the software level may possible lead to inconsistency
> between the dlm and clvmd view of the lock state.

No faking. Just a remote management of the same lock.

Vladislav
