Message-ID: <514319C7.8020601@hoster-ok.com>
Date: Fri, 15 Mar 2013 15:53:27 +0300
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
	<5142EBBC.6030300@redhat.com>
In-Reply-To: <5142EBBC.6030300@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Andreas Pflug <pgadmin@pse-consulting.de>, Zdenek Kabelac <zkabelac@redhat.com>

15.03.2013 12:37, Zdenek Kabelac wrote:
> Dne 15.3.2013 10:29, Vladislav Bogdanov napsal(a):
>> 15.03.2013 12:00, Zdenek Kabelac wrote:
>>> Dne 14.3.2013 22:57, Andreas Pflug napsal(a):
>>>> On 03/13/13 19:30, Vladislav Bogdanov wrote:
>>>>>
>>>>>> Is there a way to find out if a LV is locked exclusively? lvs
>>>>>> displaying
>>>>>> -e-- instead of -a-- would be nice. Seems not even lvdisplay knows
>>>>>> about
>>>>>> exclusive locking.
>>>>> That would break other tools which rely on their output. F.e. cluster
>>>>> resource agents of libvirt (yes, it runs lvm tools rather then using
>>>>> API, which is not yet complete btw). As I also need to obtain this
>>>>> information, I think about writing simple tool (f.e. clvm_tool) which
>>>>> would display needed info.
>>>>>
>>>>> As a workaround you can run lvchange -aly without force parameter.
>>>>> If it
>>>>> succeeds, the volume is locked in a shared mode, otherwise it is
>>>>> locked
>>>>> exclusively.
>>>>
>>>> Hm, thats one ugly workaround...
>>>> How about a clvmd option, something like -l to list all locks and exit.
>>>>
>>>
>>>
>>> I think - the extension to  'lvs' command could be relatively simple
>>> (adding a new column)
>>
>> Yes, that's correct.
>>
>>>
>>> You may query  for  exclusive/local activation on the node.
>>> (So you cannot just tell on which other node is the device active,
>>> but you could print about these states:
>>>
>>> active exclusive local
>>> active exclusive
>>> active local
>>> active
>>
>> You also may poll all know nodes, but that is a hack too.
>>
>> That's why I prefer to have this as a separate tool (with dlm_tool-like
>> params and output) which lists node IDs and lock mode. Unfortunately do
>> not have power to write it now.
>>
>> Are core LVM devels interested in these two features: lock conversion
>> and managing remote node locks? If yes, then I can (hopefully) prepare
>> git patches next week.
> 
> 
> I'm not quite sure what do you mean by  'managing remote node locks' ?

Activation/deactivation of LVs on a different corosync cluster node,
specified by its node name (with pacemaker-like method to determine that
name).
Also conversion of locks on that node.

> 
> Current login behind lvm command is  -
> 
> You could activate LVs with the above syntax [ael]
> (there is a tag support - so you could exclusively activate LV on remote
> node in via some configuration tags)

Could you please explain this - I do not see anything relevant in man pages.

> 
> And you want to 'upgrade' remote locks to something else ?

Yes, shared-to-exclusive end vice verse.

> 
> What would be the use-case you could not resolve with current command
> line args?

I need to convert lock on a remote node during last stage of ver3
migration in libvirt/qemu. That is a "confirm" stage, which runs on a
"source" node, during which "old" vm is killed and disk is released.
So, I first ("begin" stage) convert lock from exclusive to shared on a
source node, then obtain shared lock on a target node (during "prepare"
stage, when receiving qemu instance is started), then migrate vm between
two processes which have LV opened, and then release shared lock on a
source node ("confirm" stage, after source qemu is killed).

There is no other events on a destination node in ver3 migration
protocol, so I'm unable to convert lock to exclusive there after
migration is finished. So I do that from a source node, after it
released lock.

> 
> Is that supported by dlm (since lvm locks are mapped to dlm)?
Command just sent to a specific clvm instance and performed there.

> How would you resolve error path fallbacks ?

Could you please tell  what exactly do you mean?
If dlm on a remote node is unable to perform requested operation, then
error is returned to a initiator.

> Also I believe the clvmd protocol is out of free bits for extension,
> so how the protocol would look like ?
It contains 'node' field (I assume it was never actually used before)
and with some fixes that works.

Vladislav
