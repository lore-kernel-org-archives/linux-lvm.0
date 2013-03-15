Message-ID: <51433FFC.7040609@hoster-ok.com>
Date: Fri, 15 Mar 2013 18:36:28 +0300
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
	<51432305.7020007@redhat.com> <5143355A.2090201@hoster-ok.com>
	<51433805.7030503@redhat.com>
In-Reply-To: <51433805.7030503@redhat.com>
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

15.03.2013 18:02, Zdenek Kabelac wrote:
> Dne 15.3.2013 15:51, Vladislav Bogdanov napsal(a):
>> 15.03.2013 16:32, Zdenek Kabelac wrote:
>>> Dne 15.3.2013 13:53, Vladislav Bogdanov napsal(a):
>>>> 15.03.2013 12:37, Zdenek Kabelac wrote:
>>>>> Dne 15.3.2013 10:29, Vladislav Bogdanov napsal(a):
>>>>>> 15.03.2013 12:00, Zdenek Kabelac wrote:
>>>>>>> Dne 14.3.2013 22:57, Andreas Pflug napsal(a):
>>>>>>>> On 03/13/13 19:30, Vladislav Bogdanov wrote:
>>>>>>>>>
>>>>>> You could activate LVs with the above syntax [ael]
>>>>> (there is a tag support - so you could exclusively activate LV on
>>>>> remote
>>>>> node in via some configuration tags)
>>>>
>>>> Could you please explain this - I do not see anything relevant in man
>>>> pages.
>>>
>>> Let's say - you have 3 nodes  A, B, C - each have a TAG_A, TAG_B, TAG_C,
>>> then on node A you may exclusively activate LV which has TAG_B - this
>>> will try to exclusively active LV on the node which has it configured
>>> in lvm.conf  (see the  volume_list= [])
>>
>> Aha, if I understand correctly this is absolutely not what I need.
>> I want all this to be fully dynamic without any "config-editing voodoo".
>>
>>>
>>>>
>>>>>
>>>>> And you want to 'upgrade' remote locks to something else ?
>>>>
>>>> Yes, shared-to-exclusive end vice verse.
>>>
>>> So how do you convert the lock from   shared to exclusive without unlock
>>> (if I get it right - you keep the ConcurrentRead lock - and you want to
>>> take Exlusive -  to  make change state from  'active' to 'active
>>> exlusive')
>>> https://en.wikipedia.org/wiki/Distributed_lock_manager
>>
>> I just pass LCKF_CONVERT to dlm_controld if requested and needed. And
>> that is dlm's task to either satisfy conversion or to refuse it.
>>
> 
> So to understand myself better this thing -
> 
> the dlm sends 'unlock' requests to all other nodes except the one which
> should be converted to exclusive mode and send exclusive lock to the
> prefered node?

No.
clvmd sends request to a remote clvmd to upgrade or acquire or release
the lock.
That remote instance asks local dlm to do the job. dlm either says OK or
says ERROR.
It does not do anything except that.
It LV is locked on a remote node, be it shared or exclusive lock, dlm
says ERROR if exclusive lock (or conversion to it) is requested.

My patches also allow "-an --force" to release shared locks on other
nodes. Exclusive lock may be released or downgraded only on node which
holds it (or with --node <node>).

> 
>>>
>>> Clvmd 'communicates' via these locks.
>>
>> Not exactly true.
>>
>> clvmd does cluster communications with corosync, which implements
>> virtual synchrony, so all cluster nodes receive messages in the same
>> order.
>> At the bottom, clvmd uses libdlm to communicate with dlm_controld and
>> request it to lock/unlock.
>> dlm_controld instances use corosync for membership and locally manages
>> in-kernel dlm counter-part, which uses tcp/sctp mesh-like connections to
>> communicate.
>> So request from one clvmd instance goes to another and goes to kernel
>> from there, and then it is distributed to other nodes. Actually that
>> does not matter where does it hits kernel space if it supports
>> delegation of locks to remote nodes, but I suspect it doesn't. But if it
>> doesn't support such thing, then the only option to manage lock on a
>> remote node is to request that's node dlm instance to do the locking job.
>>
>>> So the proper algorithm needs to be there for ending with some proper
>>> state after locks changes (and sorry I'm not a dlm expert here)
>>
>> That is what actually happens.
>> There is just no difference between running (to upgrade local lock to
>> exclusive on node <node>.
>>
>> ssh <node> lvchange -aey --force VG/LV
>>
>> or
>>
>> lvchange -aey --node <node> --force VG/LV
> 
> 
> --node is exactly what the tag is for - each node may have it's tag.
> lvm doesn't work with cluster nodes.

But corosync and dlm operate node IDs, and pacemaker operates node names
and IDs. None of them use tags.

> 
> The question is - could be the code transformed to use this logic ?
> I guess you need to know  dlm node name here right ?

Node IDs are obtained from corosync membership list, and may be used for
that. If corosync is configured with nodelist in a way pacemaker wants
it
(http://clusterlabs.org/doc/en-US/Pacemaker/1.1/html/Pacemaker_Explained/s-node-name.html),
then node names may be used too.

> 
> 
>> The same command, it is just sent via different channels.
>>
>> Again, I just send locking request to a remote clvmd instance through
>> corosync.
>> It asks its local dlm to convert (acquire, release) lock and returns its
>> answer back. After dlm answers, operation is either performed, and then
>> OK is send back to a initiator, or refused, and the error is sent back.
> 
> 
>>>> There is no other events on a destination node in ver3 migration
>>>> protocol, so I'm unable to convert lock to exclusive there after
>>>> migration is finished. So I do that from a source node, after it
>>>> released lock.
>>>>
>>>>>
>>>>> Is that supported by dlm (since lvm locks are mapped to dlm)?
>>>> Command just sent to a specific clvm instance and performed there.
>>>
>>> As said - the 'lock' is the thing which controls the activation state.
>>> So faking it on the software level may possible lead to inconsistency
>>> between the dlm and clvmd view of the lock state.
>>
>> No faking. Just a remote management of the same lock.
> 
> Could you repost patches against git ?

I plan that for the next week.

> With some usage examples ?

Yes, if you give me an "example of example" ;)

Vladislav
