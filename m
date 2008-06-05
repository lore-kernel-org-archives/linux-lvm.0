Date: Thu, 5 Jun 2008 11:01:15 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of snapshot
	merging
In-Reply-To: <4846A052.10607@rackable.com>
Message-ID: <Pine.LNX.4.64.0806051058200.19487@engineering.redhat.com>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
	<4846A052.10607@rackable.com>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: steeve@terrascale.net, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 4 Jun 2008, Steeve McCauley wrote:

> Is this change meant to add cluster support for merging?  I had
> been under the assumption that merging was already a feature of
> snapshots.

My implementation has nothing to do with clustering.

I think there were some userspace programs for off-line merging of 
inactive snapshots. My implementation works in kernel and can be used 
while the snapshot is mounted.

> What is the difference between the current implementation using
> lvremove (which I assumed was where the COW blocks were merged back
> into the original volume) and lvconvert as below?  Why was this
> functionality not kept in lvremove?

lvremove drops the snapshot and forgets its content. lvconvert -M copies 
the snapshot to the origin (I'm now working on to let it automatically 
drop the snapshot when the merging finishes).

Mikulas

> Mikulas Patocka wrote:
>> Hi
>> 
>> Here I release the first experimental implementation of snapshot merging. 
>> Merging allows you to copy data in snapshot back to the origin device. Once 
>> merging starts, it runs on background. When the merging finishes (you see 
>> "0%" with "lvs" command), you should remove the merging snapshot with 
>> lvremove command.
>> 
>> The userspace will still be changed, the kernel is already finished (there 
>> are no known bugs in the kernel, I'm curious about the unknown ones :)
>> 
>> Merging is initiated with "lvconvert -M vg/lv_snapshot" command. When you 
>> initiate merging, make sure that the origin device is not mounted. Snapshot 
>> can be mounted while it's merging is initiated.
>> 
>> During merging, aby reads and writes to the origin device are identical to 
>> accesses to the merging snapshots.
>> 
>> There may be multiple snapshots while one of them is being merged --- 
>> exceptions in other snapshots are being allocated and there snapshots are 
>> kept stable.
>> 
>> Don't try to concurrently merge more than one snapshot (the kernel refuses 
>> to do it, the userspace tools don't know about it --- the userspace will be 
>> rewritten anyway).
>> 
>> The patches are at:
>> http://people.redhat.com/mpatocka/patches/
>> The patches are for 2.6.26-rc4
>> 
>> (besides merging, there are some other bugfixes, I made for the kernel)
>> 
>> Mikulas
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> -- 
> Steeve McCauley
> Director of Research and Development
> Rackable Systems
> 407 McGill Street, Suite 1002
> Montreal, Quebec, H2Y 2G3 (Canada)
> Tel: 514-288-3343
> http://www.rackable.com
> :wq
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
