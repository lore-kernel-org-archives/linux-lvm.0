Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pAPIAEVb029074
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2011 13:10:14 -0500
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAPIAD9K014884
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2011 13:10:13 -0500
Message-ID: <4ECFDA00.8000303@alteeve.com>
Date: Fri, 25 Nov 2011 13:10:08 -0500
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
	<4ECBF8B3.6050300@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0912@XCH11.scidom.de>
	<4ECD3952.8080803@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF092C@XCH11.scidom.de>
	<4ECE74F8.3000302@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0938@XCH11.scidom.de>
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF0938@XCH11.scidom.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] new to cLVM - some principal questions
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 11/25/2011 12:49 PM, Lentes, Bernd wrote:
>
> Digimer wrote:
>
>
>
>>>>
>>>> Fencing and Stonith are two names for the same thing; Fencing was
>>>> traditionally used in Red Hat clusters and STONITH in
>>>> heartbeat/pacemaker clusters. It's arguable which is
>>>> preferable, but I
>>>> personally prefer fencing as it more directly describes the goal of
>>>> "fencing off" (isolating) a failed node from the rest of
>> the cluster.
>
> Yes, but "STONITH" is a wonderful acronym.
>
>
>>>>
>>>> Now let's talk about how fencing fits;
>>>>
>>>> Let's assume that Node 1 hangs or dies while it still
>> holds the lock.
>>>> The fenced daemon will be triggered and it will notify DLM
>>>> that there is
>>>> a problem, and DLM will block all further requests. Next,
>>>> fenced tries
>>>> to fence the node using one of it's configured fence
>> methods. It will
>>>> try the first, then the second, then the first again,
>> looping forever
>>>> until one of the fence calls succeeds.
>>>>
>>>> Once a fence call succeeds, fenced notifies DLM that the
>> node is gone
>>>> and then DLM will clean up any locks formerly held by Node 1. After
>>>> this, Node 2 can get a lock, despite Node 1 never itself
>> releasing it.
>>>>
>>>> Now, let's imagine that a fence agent returned success but the node
>>>> wasn't actually fenced. Let's also assume that Node 1 was
>>>> hung, not dead.
>>>>
>>>> So DLM thinks that Node 1 was fenced, clears it's old locks
>>>> and gives a
>>>> new one to Node 2. Node 2 goes about recovering the
>>>> filesystem and the
>>>> proceeds to write new data. At some point later, Node 1 unfreezes,
>>>> thinks it still has an exclusive lock on the LV and finishes
>>>> writing to
>>>> the disk.
>>>
>>> But you said "So DLM thinks that Node 1 was fenced, clears
>> it's old locks and gives a
>>> new one to Node 2" How can node 1 get access after
>> unfreezing, when the lock is cleared ?
>>
>> DLM clears the lock, but it has no way of telling Node 1 that
>> the lock
>> is no longer valid (remember, it thinks the node has been
>> ejected from
>> the cluster, removing any communication). Meanwhile, Node 1 has no
>> reason to think that the lock it holds is no longer valid, so it just
>> goes ahead and accesses the storage figuring it has exclusive
>> access still.
>
> But does DLM not prevent node 1 in this situation accessing the filesystem ?
> DLM "knows" that the lock from node 1 has been cleared. Can't DLM "say" to node 1:
> "You think you have a valid lock, but don't have. Sorry, no access !"
>
> Bernd

Nope, it doesn't work that way. There is no way for DLM to tell the 
server to discard any locks. First of all, DLM thinks the node is gone 
anyway. Secondly, Node 1 could have hung in the middle of a write. When 
it recovers, it could be quite literally in the middle of a write which 
is finished. DLM doesn't act as a barrier to the raw data... it's merely 
a lock manager.

-- 
Digimer
E-Mail:              digimer@alteeve.com
Freenode handle:     digimer
Papers and Projects: http://alteeve.com
Node Assassin:       http://nodeassassin.org
"omg my singularity battery is dead again.
stupid hawking radiation." - epitron
