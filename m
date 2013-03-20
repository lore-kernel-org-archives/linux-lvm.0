Message-ID: <51497718.5080209@redhat.com>
Date: Wed, 20 Mar 2013 09:45:12 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<1363699970-10002-11-git-send-email-bubble@hoster-ok.com>
	<20130319153215.GB986@redhat.com> <5148874A.2060106@hoster-ok.com>
	<20130319155456.GC986@redhat.com> <514897BE.90609@hoster-ok.com>
	<20130319171608.GE986@redhat.com> <5148A215.7080004@hoster-ok.com>
In-Reply-To: <5148A215.7080004@hoster-ok.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com, Vladislav Bogdanov <bubble@hoster-ok.com>, David Teigland <teigland@redhat.com>

Dne 19.3.2013 18:36, Vladislav Bogdanov napsal(a):
> 19.03.2013 20:16, David Teigland wrote:
>> On Tue, Mar 19, 2013 at 07:52:14PM +0300, Vladislav Bogdanov wrote:
>>> And, do you have any estimations, how long may it take to have you ideas
>>> ready for production use?
>>
>> It'll be quite a while (and the new locking scheme I'm working on will not
>> include remote command execution.)
>>
>>> Also, as you're not satisfied with this implementation, what alternative
>>> way do you see? (calling ssh from libvirt or LVM API is not a good idea
>>> at all I think)
>>
>> Apart from using ovirt/rhev, I'd try one of the following behind the
>> libvirt locking api: sanlock, dlm, file locks on nfs, file locks on gfs2.
>
> Unfortunately none of these solve the main thing I need: Allow LVM
> snapshots without breaking live VM migration :(
>
> Cluster-wide snapshots (with shared lock) would solve this, but I do not
> expect to see this implemented soon.
>

Before I'll go any deeper with reviewing patches myself - I'd like to
make myself clean about this 'snapshot' issue.

(BTW there is already one thing which will surely not pass - it's the 'node' 
option for lvm command - this would have to be made diferently).

But back to snapshots -

What would be the point of having (old, non thinp) snapshots active at the 
same time on more then 1 node ?

That would simply not work - since you would have to ensure that noone will 
write to  snapshot & origin on either of those nodes?

Is your code doing some transition which needs active device on both nodes
treating them in read-only way ?

Since metadata for snapshot are only parsed during first activation of 
snapshot, there is no way, the second node could resync if you would have 
written to the snapshot/origin on the first node.

So could you please describe in more details how it's supposed to work?


Zdenek
