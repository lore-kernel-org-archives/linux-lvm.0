Date: Tue, 2 Jan 2018 11:10:34 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20180102171034.GC26695@redhat.com>
References: <f1be22d0-6bf3-e282-9692-92452f67122d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1be22d0-6bf3-e282-9692-92452f67122d@suse.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

> * resizing an LV that is active in the shared mode on multiple hosts
> 
> It seems a big limitation to use lvmlockd in cluster:

Only in the case where the LV is active on multiple hosts at once,
i.e. a cluster fs, which is less common than a local fs.

In the general case, it's not safe to assume that an LV can be modified by
one node while it's being used by others, even when all of them hold
shared locks on the LV.  You'd want to prevent that in general.
Exceptions exist, but whether an exception is ok will likely depend on
what the specific change is, what application is using the LV, whether
that application can tolerate such a change.

One (perhaps the only?) valid exception I know about is extending an LV
while it's being used under a cluster fs (any cluster fs?)

(In reference to your later email, this is not related to lock queueing,
but rather to basic ex/sh lock incompatibility, and when/how to allow
exceptions to that.)

The simplest approach I can think of to allow lvextend under a cluster fs
would be a procedure like:

1. one one node: lvextend --lockopt skip -L+1G VG/LV

   That option doesn't exist, but illustrates the point that some new
   option could be used to skip the incompatible LV locking in lvmlockd.

2. on each node: lvchange --refresh VG/LV

   This updates dm on each node with the new device size.

3. gfs2_grow VG/LV or equivalent

   At this point the fs on any node can begin accessing the new space.
