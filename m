Return-Path: <braam@mountainviewdata.com>
Date: Wed, 23 May 2001 12:26:36 -0600 (MDT)
From: "Peter J. Braam" <braam@mountainviewdata.com>
Subject: Re: [linux-lvm] LVM Snapshots & journal recovery
In-Reply-To: <OF0CE9A252.6B27B7A4-ON85256A55.0059D974@raleigh.ibm.com>
Message-ID: <Pine.LNX.4.33.0105231216430.3381-100000@lustre.us.mvd>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: linux-lvm@sistina.com, Joe Thornber <thornber@btconnect.com>, adilger@turbolinux.com, linux-fsdevel@vger.kernel.org

On Wed, 23 May 2001, Steve Pratt wrote:


> Peter, I fail to see how your proposed method of remapping writes to the
> original to the snapshot volume avoids the synchronous write penalties.

Hmm, I think you are raising many interesting issues.

>
> For example in your scenario, the filesystem journal itself will have to be
> written to the snapshot volume, so in order to ensure journal consistency
> you will need to write the remapping meta data synchronously with the
> remapped journal chunk or you would not know that the journal had been
> remapped.  Both writes must done synchronously or you have possible
> corruption.
>

The journal itself really shouldn't be on a snapshotted device - that
makes no sense.

The write operations are now idempotent: there is in fact no need
whatsoever to write anything synchronous since the journal replay will
always get it right.

For writing I believe what I have proposed is vastly superior:
no syncrhonous writes _and_ no copying of blocks.

> In addition to having to do the same number of synchronous writes, you have
> the additional penalty that you mentioned of the sync time when deleting
> the snapshot.  This resyncing also come with a whole new set of consistency
> issues (whole new code path)

It's not an additional penalty at all: this code again is idempotent too.
If it fails you can run it again - I think it has very simple logic but of
course I may be overlooking something.  Before you start the deletion
process the snapshot becomes unusable.  After it has completed the extra
partition becomes superfluous.

Also such a process can run in the background and would copy no more
blocks than doing the writes the other way around.

>
> Also, you have moved the remapping lookup processing time penalty for reads
> from the snapshot to the original.  I think it is much better to optimize
> the access to the original as opposed to the snapshot for most cases.
>

This is a serious point: the reads need an indirection.

We did benchmarking of this in SnapFS and the redirection blocks are not
many and are typically cached.  It didn't seem to cost much at all.

What do you think of this?

- Peter -


>
> Steve
>
> EVMS Development - http://www.sf.net/projects/evms
> Linux Technology Center - IBM Corporation
> (512) 838-9763  EMAIL: SLPratt@US.IBM.COM
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
>

-- 
