Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pANIK8lY013309
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2011 13:20:08 -0500
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pANIK73u012726
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2011 13:20:07 -0500
Message-ID: <4ECD3952.8080803@alteeve.com>
Date: Wed, 23 Nov 2011 13:20:02 -0500
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
	<4ECBF8B3.6050300@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0912@XCH11.scidom.de>
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF0912@XCH11.scidom.de>
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

On 11/23/2011 10:35 AM, Lentes, Bernd wrote:
>
> Digimer wrote:
>>
>> On 11/22/2011 02:22 PM, Lentes, Bernd wrote:
>>> Hi,
>>>
>>> i have a bit experience in LVM, but not in cLVM. So i have
>> some principal questions:
>>> My idea is to establish a HA-Cluster with two nodes. The
>> ressources which are managed by the cluster are virtual
>> machines (KVM).
>>> I have a FC SAN, where the vm's will reside. I want to
>> create vdisks in my SAN which are integrated as a PV in both
>> hosts. On top of the PV's i will create a VG, and finally
>> LV's. For each VM one LV.
>>>
>>> How are things going with cLVM ? Do i have to create PV ==>
>>   VG ==>   LV seperately ? Or does cLVM replicate the
>> information from one host to the other ? So that i have to
>> create PV, VG and LV only once on the first node and this
>> configuration is replicated to the second host.
>>>
>>> What is about e.g. resizing a LV ? Is this replicated, or
>> do i have to resize twice, on each host ?
>>>
>>> E.g. one host is running VM3 in the corresponding lv3 on
>> the first host. Is the second host able to access lv3
>> simultaneously or is there a kind of locking ?
>>>
>>> Is it possible to run some vm's on the first host and
>> others on the second (as a kind of load-balancing) ?
>>>
>>> Is it possible to perform a live-migration from one host to
>> the other in this scenario ?
>>>
>>> I will not install a filesystem in the lv's, because i got
>> recommendations to run the vm's in bare partitions, this
>> would be faster.
>>>
>>>
>>> Thanks for any eye-opening answer.
>>>
>>>
>>> Bernd
>>
>> Clustered LVM is, effectively, just normal LVM with external
>> (clustered)
>> locking using DLM. Once built, anything you do on one node
>> will be seen
>> immediately on all other nodes.
>>
>> Mount your iSCSI target as your normally would on all nodes. On one
>> node, with clvmd running, 'pvcreate /dev/foo' then 'vgcreate
>> -c y -n bar
>> /dev/foo'. If you then run 'vgscan' on all other nodes,
>> you'll see the
>> VG you just created.
>>
>> Be absolutely sure you configure fencing in your cluster! If a node
>> falls silent, it must be forcibly removed from the cluster before any
>> recovery can commence. Failed fencing will hang the cluster, and
>> short-circuited fencing will lead to corruption.
>>
>> Finally, yes, you can do live migration between nodes in the same
>> cluster (specifically, they need to be in the same DLM lockspace).
>>
>> I use clvmd quite a bit, feel free to ask if you have any more
>> questions. I also have an in-progress tutorial using clvmd on
>> DRBD, but
>> you could just replace "/dev/drbdX" with the appropriate iSCSI target
>> and the rest is the same.
>>
>> --
>
> Hi Digimer,
>
> we met already on the DRBD-ML.
> clvmd must be running on all nodes ?

Yes, but more to the point, they must also be in the same cluster. Even 
more specifically, they must be in the same DLM lockspace. :)

> I'm planning to implement fencing. I use two HP Server which support iLO.

Good, fencing is required. It's a good idea to also use a switched PDU 
as a backup fence device. If the iLO loses power (ie, blown power supply 
or failed BMC), the fence will fail. Having the PDU provides an 
alternative method to confirm node death and will avoid blocking. That 
is, when a fence is pending (and it will wait forever for success), DLM 
will not give out locks so your storage will block.

> Using this i can restart a server when the OS is not longer accessible.

The cluster, fenced specifically, will do this for you.

> I think that's a kind of STONITH. Is that what you describe with "short-circuited fencing" ?

Fencing and Stonith are two names for the same thing; Fencing was 
traditionally used in Red Hat clusters and STONITH in 
heartbeat/pacemaker clusters. It's arguable which is preferable, but I 
personally prefer fencing as it more directly describes the goal of 
"fencing off" (isolating) a failed node from the rest of the cluster.

To "short circuit" the fence, I mean return a success message to fenced 
without actually properly fencing the device. This is an incredibly bad 
idea that I've seen people try to do in the past.

> You recommend not using a STONITH method ? What else can i use for fencing ?

I generally use a mix of IPMI (or iLO/RSA/DRAC, effectively the same 
thing, but vendor-specific) as my primary fence device because it can 
confirm that the node is off. However, as mentioned above, it will fail 
if the node it is in dies badly enough.

In that case, a switched PDU, like the APC 7900 
(http://www.apc.com/products/resource/include/techspec_index.cfm?base_sku=AP7900) 
makes a perfect backup. I don't use it as primary though because it can 
only confirm that power has been cut to the specified port(s), not that 
the node itself is off, leaving room for configuration or cabling errors 
returning false-positives. It is critical to test PDU fence devices 
prior to deployment and to ensure that cables are then never moved 
around after.

> What is about concurrent access from both nodes to the same lv ? Is that possible with cLVM ?

Yes, that is the whole point. For example, with a cluster-enabled VG, 
you can create a new LV on one node, and then immediately see that new 
LV on all other nodes.

Keep in mind, this does *not* magically provide cluster awareness to 
filesystems. For example, you can not use ext3 on a clustered VG->LV on 
two nodes at once. You will still need a cluster-aware filesystem like GFS2.

> Does cLVM sync access from the two nodes, or does it lock the lv so that only one has exclusive access to the lv ?

When a node wants access to a clustered LV, it requests a lock from DLM. 
There are a few types of locks, but let's look at exclusive, which is 
needed to write to the LV (simplified example).

So Node 1 decides it wants to write to an LV. It sends a request to DLM 
for an exclusive lock on the LV. DLM sees that no other node has a lock, 
so the lock is granted to Node 1 for that LV's lockspace. Node 1 then 
proceeds to use the LV as if it was a simple local LV.

Meanwhile, Node 2 also wants access to that LV and asks DLM for a lock. 
This time DLM sees that Node 1 has an exclusive lock in that LV's 
lockspace and denies the request. Node 2 can not use the LV.

At some point, Node 1 finishes and releases the lock. Now Node 2 can 
re-request the lock, and it will be granted.

Now let's talk about how fencing fits;

Let's assume that Node 1 hangs or dies while it still holds the lock. 
The fenced daemon will be triggered and it will notify DLM that there is 
a problem, and DLM will block all further requests. Next, fenced tries 
to fence the node using one of it's configured fence methods. It will 
try the first, then the second, then the first again, looping forever 
until one of the fence calls succeeds.

Once a fence call succeeds, fenced notifies DLM that the node is gone 
and then DLM will clean up any locks formerly held by Node 1. After 
this, Node 2 can get a lock, despite Node 1 never itself releasing it.

Now, let's imagine that a fence agent returned success but the node 
wasn't actually fenced. Let's also assume that Node 1 was hung, not dead.

So DLM thinks that Node 1 was fenced, clears it's old locks and gives a 
new one to Node 2. Node 2 goes about recovering the filesystem and the 
proceeds to write new data. At some point later, Node 1 unfreezes, 
thinks it still has an exclusive lock on the LV and finishes writing to 
the disk.

Voila, you just corrupted your storage.

You can apply this to anything using DLM lockspaces, by the way.

> Thanks for your answer.

Happy to help. :)

-- 
Digimer
E-Mail:              digimer@alteeve.com
Freenode handle:     digimer
Papers and Projects: http://alteeve.com
Node Assassin:       http://nodeassassin.org
"omg my singularity battery is dead again.
stupid hawking radiation." - epitron
