Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pAOGktM2022711
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2011 11:46:55 -0500
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAOGkrD8027306
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2011 11:46:54 -0500
Message-ID: <4ECE74F8.3000302@alteeve.com>
Date: Thu, 24 Nov 2011 11:46:48 -0500
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
	<4ECBF8B3.6050300@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0912@XCH11.scidom.de>
	<4ECD3952.8080803@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF092C@XCH11.scidom.de>
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF092C@XCH11.scidom.de>
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

On 11/24/2011 11:32 AM, Lentes, Bernd wrote:
> Digimer wrote:
>
>>> Hi Digimer,
>>>
>>> we met already on the DRBD-ML.
>>> clvmd must be running on all nodes ?
>>
>> Yes, but more to the point, they must also be in the same
>> cluster. Even
>> more specifically, they must be in the same DLM lockspace. :)
>>
>>> I'm planning to implement fencing. I use two HP Server
>> which support iLO.
>>
>> Good, fencing is required. It's a good idea to also use a
>> switched PDU
>> as a backup fence device. If the iLO loses power (ie, blown
>> power supply
>> or failed BMC), the fence will fail. Having the PDU provides an
>> alternative method to confirm node death and will avoid
>> blocking. That
>> is, when a fence is pending (and it will wait forever for
>> success), DLM
>> will not give out locks so your storage will block.
>>
>>> Using this i can restart a server when the OS is not longer
>> accessible.
>>
>> The cluster, fenced specifically, will do this for you.
>
> Yes, that's logical.
>
>>
>>> I think that's a kind of STONITH. Is that what you describe
>> with "short-circuited fencing" ?
>>
>> Fencing and Stonith are two names for the same thing; Fencing was
>> traditionally used in Red Hat clusters and STONITH in
>> heartbeat/pacemaker clusters. It's arguable which is
>> preferable, but I
>> personally prefer fencing as it more directly describes the goal of
>> "fencing off" (isolating) a failed node from the rest of the cluster.
>>
>> To "short circuit" the fence, I mean return a success message
>> to fenced
>> without actually properly fencing the device. This is an
>> incredibly bad
>> idea that I've seen people try to do in the past.
>
> Strange people who have ideas like that.
>
>>
>>> You recommend not using a STONITH method ? What else can i
>> use for fencing ?
>>
>> I generally use a mix of IPMI (or iLO/RSA/DRAC, effectively the same
>> thing, but vendor-specific) as my primary fence device because it can
>> confirm that the node is off. However, as mentioned above, it
>> will fail
>> if the node it is in dies badly enough.
>>
>> In that case, a switched PDU, like the APC 7900
>> (http://www.apc.com/products/resource/include/techspec_index.c
>> fm?base_sku=AP7900)
>> makes a perfect backup. I don't use it as primary though
>> because it can
>> only confirm that power has been cut to the specified
>> port(s), not that
>> the node itself is off, leaving room for configuration or
>> cabling errors
>> returning false-positives. It is critical to test PDU fence devices
>> prior to deployment and to ensure that cables are then never moved
>> around after.
>
> I ordered one.
>
>>
>>> What is about concurrent access from both nodes to the same
>> lv ? Is that possible with cLVM ?
>>
>> Yes, that is the whole point. For example, with a cluster-enabled VG,
>> you can create a new LV on one node, and then immediately see
>> that new
>> LV on all other nodes.
>>
>> Keep in mind, this does *not* magically provide cluster awareness to
>> filesystems. For example, you can not use ext3 on a clustered
>> VG->LV on
>> two nodes at once. You will still need a cluster-aware
>> filesystem like GFS2.
>
> I don't have a filesystem. I will install the vm's (using KVM) in bare partitions (lv's).
> Is that a problem ?
> I got recommendations this is faster than installing them in partitions with a filesystem.

s/filesystem/clustered storage/

Whenever two independent servers access a shared chunk of storage, be it 
using LVM or an actual filesystem, access *must* be coordinated. Perhaps 
it is someone less risky, but the risk remains and it is non-trivial.

I also install VMs directly using raw LVs, which I also find to be 
better performing.

>>> Does cLVM sync access from the two nodes, or does it lock
>> the lv so that only one has exclusive access to the lv ?
>>
>> When a node wants access to a clustered LV, it requests a
>> lock from DLM.
>> There are a few types of locks, but let's look at exclusive, which is
>> needed to write to the LV (simplified example).
>>
>> So Node 1 decides it wants to write to an LV. It sends a
>> request to DLM
>> for an exclusive lock on the LV. DLM sees that no other node
>> has a lock,
>> so the lock is granted to Node 1 for that LV's lockspace. Node 1 then
>> proceeds to use the LV as if it was a simple local LV.
>>
>> Meanwhile, Node 2 also wants access to that LV and asks DLM
>> for a lock.
>> This time DLM sees that Node 1 has an exclusive lock in that LV's
>> lockspace and denies the request. Node 2 can not use the LV.
>>
>> At some point, Node 1 finishes and releases the lock. Now Node 2 can
>> re-request the lock, and it will be granted.
>>
>> Now let's talk about how fencing fits;
>>
>> Let's assume that Node 1 hangs or dies while it still holds the lock.
>> The fenced daemon will be triggered and it will notify DLM
>> that there is
>> a problem, and DLM will block all further requests. Next,
>> fenced tries
>> to fence the node using one of it's configured fence methods. It will
>> try the first, then the second, then the first again, looping forever
>> until one of the fence calls succeeds.
>>
>> Once a fence call succeeds, fenced notifies DLM that the node is gone
>> and then DLM will clean up any locks formerly held by Node 1. After
>> this, Node 2 can get a lock, despite Node 1 never itself releasing it.
>>
>> Now, let's imagine that a fence agent returned success but the node
>> wasn't actually fenced. Let's also assume that Node 1 was
>> hung, not dead.
>>
>> So DLM thinks that Node 1 was fenced, clears it's old locks
>> and gives a
>> new one to Node 2. Node 2 goes about recovering the
>> filesystem and the
>> proceeds to write new data. At some point later, Node 1 unfreezes,
>> thinks it still has an exclusive lock on the LV and finishes
>> writing to
>> the disk.
>
> But you said "So DLM thinks that Node 1 was fenced, clears it's old locks and gives a
> new one to Node 2" How can node 1 get access after unfreezing, when the lock is cleared ?

DLM clears the lock, but it has no way of telling Node 1 that the lock 
is no longer valid (remember, it thinks the node has been ejected from 
the cluster, removing any communication). Meanwhile, Node 1 has no 
reason to think that the lock it holds is no longer valid, so it just 
goes ahead and accesses the storage figuring it has exclusive access still.

>> Voila, you just corrupted your storage.
>>
>> You can apply this to anything using DLM lockspaces, by the way.
>>
>>> Thanks for your answer.
>>
>> Happy to help. :)
>>
>
> The situation that two nodes offer the same service should normally be prevented by the CRM.
>
> Thanks for your very detailed answer.
>
> Bernd

CRM, or any other cluster resource manager, works on the assumption that 
the nodes are in sync. By definition, a failed node is no longer in sync.

Take the use-case of a two-node cluster where, by necessity, quorum has 
been disabled. At some point, the cluster partitions and then either 
node thinks that it is the sole remaining node. The node that had been 
backup tries to start the VM while the same VM is still running on the 
former node.

There are other ways that things can go wrong. The important thing to 
understand is that, once communication has been lost to a node, it 
*must* be confirmed removed from the cluster before recovery can 
commence. DLM and the like can only work when all running nodes are 
working together.

Cheers

-- 
Digimer
E-Mail:              digimer@alteeve.com
Freenode handle:     digimer
Papers and Projects: http://alteeve.com
Node Assassin:       http://nodeassassin.org
"omg my singularity battery is dead again.
stupid hawking radiation." - epitron
