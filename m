Message-ID: <5149A7CB.9090703@hoster-ok.com>
Date: Wed, 20 Mar 2013 15:12:59 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<1363699970-10002-11-git-send-email-bubble@hoster-ok.com>
	<20130319153215.GB986@redhat.com> <5148874A.2060106@hoster-ok.com>
	<20130319155456.GC986@redhat.com> <514897BE.90609@hoster-ok.com>
	<20130319171608.GE986@redhat.com>
	<5148A215.7080004@hoster-ok.com> <51497718.5080209@redhat.com>
In-Reply-To: <51497718.5080209@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 10/10] man: document --node option to
	lvchange
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
Cc: David Teigland <teigland@redhat.com>, linux-lvm@redhat.com

20.03.2013 11:45, Zdenek Kabelac wrote:
> Dne 19.3.2013 18:36, Vladislav Bogdanov napsal(a):
>> 19.03.2013 20:16, David Teigland wrote:
>>> On Tue, Mar 19, 2013 at 07:52:14PM +0300, Vladislav Bogdanov wrote:
>>>> And, do you have any estimations, how long may it take to have you
>>>> ideas
>>>> ready for production use?
>>>
>>> It'll be quite a while (and the new locking scheme I'm working on
>>> will not
>>> include remote command execution.)
>>>
>>>> Also, as you're not satisfied with this implementation, what
>>>> alternative
>>>> way do you see? (calling ssh from libvirt or LVM API is not a good idea
>>>> at all I think)
>>>
>>> Apart from using ovirt/rhev, I'd try one of the following behind the
>>> libvirt locking api: sanlock, dlm, file locks on nfs, file locks on
>>> gfs2.
>>
>> Unfortunately none of these solve the main thing I need: Allow LVM
>> snapshots without breaking live VM migration :(
>>
>> Cluster-wide snapshots (with shared lock) would solve this, but I do not
>> expect to see this implemented soon.
>>
> 
> Before I'll go any deeper with reviewing patches myself - I'd like to
> make myself clean about this 'snapshot' issue.
> 
> (BTW there is already one thing which will surely not pass - it's the
> 'node' option for lvm command - this would have to be made diferently).
> 
> But back to snapshots -
> 
> What would be the point of having (old, non thinp) snapshots active at
> the same time on more then 1 node ?

There is no need on this.

I need source volume itself to be active on two nodes to perform live VM
migration. libvirt/qemu controls which instance has CPUs turned on. But
qemu processes on two nodes need to have LV open simultaneously.

I'm able to take snapshot only when volume is activated exclusively.
I can open that snapshot (and take backup) only on node where source
volume is exclusive.

And I ultimately do not want to take VM down to lock LV exclusively to
take snapshot (if it runs on a shared-locked VM) and I do not want to do
offline migration (with exclusive lock on LV). To satisfy this lock
conversion is needed.

I'm still new to thinp, because it was introduced relatively recently,
and I had no chance to look at it closer (I tried to allocate pool once
on a clustered VG and the whole test cluster stuck because of this).

Does it work on clustered VGs now?
And, is it possible now to take/activate/open thinp snapshot on a node
different from one where source volume is open?

> 
> That would simply not work - since you would have to ensure that noone
> will write to  snapshot & origin on either of those nodes?
> 
> Is your code doing some transition which needs active device on both nodes
> treating them in read-only way ?

Yes, but not my, it is libvirt.
It opens block device (LV) on both source and destination nodes (it runs
qemu process in a paused state on a destination node and that process
opens block device).
After that memory state is transferred to a destination node, then qemu
process on a source node is paused (turns off virtual CPUs), then qemu
process on a destination node is resumed (turns on virtual CPUs) and
then qemu process on a source node is killed, thus releasing the LV.
Adding one more migration phase ("confirm confirmation") and thus
introducing one more migration protocol version seems to be overkill for me.

When qemu process is paused on a node, LV is effectively read-only (ok,
almost read-only, libvirt still try to set up DAC permissions and
selinux label on it, but data is not written).

There is only bit of time when both source and destination processes are
paused (less that millisecond).

When qemu is running, it writes to device.

What concerns my code in libvirt:
I made one more "logical" pool subtype - clvm, which starts with all LVs
deactivated.
I also wrote the locking driver (which works similar to sanlock an
virtlockd ones), which
* activates volume exclusively on start
* converts lock to shared on a source node before migration
* activates volume in a shared mode on a migration target
* deactivates volume on a source node after migration is finished
* converts lock from a shared to exclusive remotely on destination node
from a source node

It also has local locking concept to prevent LV to be opened more than
one time on the node it is activated exclusively.

As I wrote above, there is no event like "you can convert lock to
exclusive" available on a destination node.

> 
> Since metadata for snapshot are only parsed during first activation of
> snapshot, there is no way, the second node could resync if you would
> have written to the snapshot/origin on the first node.
> 
> So could you please describe in more details how it's supposed to work?

It is ok for me to lose snapshot during migration. I just need to be
able to backup VM data while it is constantly running on one node. If
pacemaker decides to migrate VM, then backup just fails and will be
restarted (together with new snapshot creation) from a beginning after
migration is finished.

Vladislav
