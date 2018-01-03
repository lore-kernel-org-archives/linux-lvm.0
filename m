References: <f1be22d0-6bf3-e282-9692-92452f67122d@suse.com>
	<20180102171034.GC26695@redhat.com>
From: Eric Ren <zren@suse.com>
Message-ID: <be5b9aa6-d9fb-2e45-d250-9736d1ae49a5@suse.com>
Date: Wed, 3 Jan 2018 11:52:34 +0800
MIME-Version: 1.0
In-Reply-To: <20180102171034.GC26695@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] lvmlockd: about the limitation on lvresizing the LV
 active on multiple nodes
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>

Hello David,

Happy new year!

On 01/03/2018 01:10 AM, David Teigland wrote:
>> * resizing an LV that is active in the shared mode on multiple hosts
>>
>> It seems a big limitation to use lvmlockd in cluster:
> Only in the case where the LV is active on multiple hosts at once,
> i.e. a cluster fs, which is less common than a local fs.
>
> In the general case, it's not safe to assume that an LV can be modified by
> one node while it's being used by others, even when all of them hold
> shared locks on the LV.  You'd want to prevent that in general.
> Exceptions exist, but whether an exception is ok will likely depend on
> what the specific change is, what application is using the LV, whether
> that application can tolerate such a change.
>
> One (perhaps the only?) valid exception I know about is extending an LV
> while it's being used under a cluster fs (any cluster fs?)

The only concrete scenario I can think of is also cluster fs, like OCFS2,
tunefs.ocfs2 can enlarge the FS to use all the device space online.

> (In reference to your later email, this is not related to lock queueing,
> but rather to basic ex/sh lock incompatibility, and when/how to allow
> exceptions to that.)
I thought the procedures to allow lvresize is like below if the LV is 
used by cluster FS:

Assume the LV is active with "sh" lock on multiple nodes (node1 and node2),
and we  lvextend on node1:

- node1:  the "sh" lock on r1 (the LV resource) needs to up convert: 
"sh" -> "ex";
- node2: on behalf of the BAST, the "sh" lock on r1needs to down 
convert: "sh" -> "nl",
   which means the LV should be suspended;
- node1: on receiving AST (get "ex" lock), lvresize is allowed;

After the completion of lvresize,  the original lock state should be 
restored on every node,
meanwhile the latest metadata can be refreshed, maybe like below:

- node1: restore the original lock mode, "ex" -> "sh", the metadata 
version will be increased,
   so that request to update metadata can be sent to other nodes;
- node2: on receiving request, "nl" -> "sh", then to refresh the 
metadata from disk;

>
> The simplest approach I can think of to allow lvextend under a cluster fs
> would be a procedure like:

If there is a simple approach, I think it maybe worth a try.

>
> 1. one one node: lvextend --lockopt skip -L+1G VG/LV
>
>     That option doesn't exist, but illustrates the point that some new
>     option could be used to skip the incompatible LV locking in lvmlockd.

Hmm, is it safe to just skip the locking while the LV is active on other 
node?
Is there somewhere in the code to avoid concurrent lvm command to execute
at the same time?

>
> 2. on each node: lvchange --refresh VG/LV
>
>     This updates dm on each node with the new device size.
>
> 3. gfs2_grow VG/LV or equivalent
>
>     At this point the fs on any node can begin accessing the new space.
It would be great.

Regards,
Eric
