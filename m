Message-ID: <51435E8D.7090105@hoster-ok.com>
Date: Fri, 15 Mar 2013 20:46:53 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <20130315163124.GA1061@redhat.com>
In-Reply-To: <20130315163124.GA1061@redhat.com>
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
To: David Teigland <teigland@redhat.com>
Cc: Andreas Pflug <pgadmin@pse-consulting.de>, linux-lvm@redhat.com

15.03.2013 19:31, David Teigland wrote:
>> I need to convert lock on a remote node during last stage of ver3
>> migration in libvirt/qemu
> 
> Hi, I wrote and maintain the dlm and have more recently written a new
> disk-based lock manager called sanlock, https://fedorahosted.org/sanlock/
> which operates with only shared storage among nodes (no networking or
> other cluster manager.)
> 
> sanlock was written to allow RHEV to manage leases for vm images on shared
> storage, including the ability to migrate leases among hosts (which is the
> most complicated part, as you've mentioned above.)  sanlock plugs into the
> libvirt locking api, which also supports file locks (usable on local or
> nfs file systems.)  (Search for "virtlockd".)

Yes, I know, please see below.

> 
> Trying to use/control vm locks via lvm commands is not a good way to solve
> the vm management/migration problem at the present time (but see below).
> Instead, I'd suggest doing the locking via the libvirt locking api which
> was designed for this purpose.  As I mentioned, libvirt supports both
> sanlock and file locks, but another option is to write a new libvirt
> locking plug-in for dlm/corosync.  This would be the best way to use dlm
> locks to protect vm images on shared storage; I've been hoping someone
> would do this for some time.

I almost agree. That's why I developed one more locking mech for libvirt
which works and solves what I need.
I also thought about dlm one (may be the next step :) ), but I need lvm
to activate volumes, because I do not like current libvirt's "-aln
everywhere" approach with VLM, so I decided to use clvm-based locking
driver (with my additions to LVM). So, I made new "clvm2" pool type
(subtype of a "logical" together with "lvm2") which does not activate
volumes at all by itself, and "clvm" locking driver. Of course, that was
not so easy, because all current locking drivers assume that disk device
used by VM is always accessible (file on NFS f.e.), and that is not true
for clvm with exclusive activation. But, I really made it all work, so I
expect this to be a very strong alternative to all other locking mechs
in libvirt (but only for LVM volumes). Local (prevent LV from being
opened on the same node) part is not yet fully baked, only a PoC, but
that can be easily replaced with some flock-based implementation (not
released yet, but I saw some words about it is being written by Daniel)
or even allow chaining of another driver (sanlock on a local storage?)
for local (per-node) locking.
Please keep an eye on libvirt list, I want to send my work there if my
ideas are accepted here on lvm list, there is strong dependency on them.

It is very hard to inject ideas simultaneously to related projects, but
I'll try.

> 
> Incidentally, I've recently started a new project which is to replace
> clvmd with a new "lvmlockd".  I'm designing lvmlockd to support both dlm
> and sanlock on the back side (transparent to lvm itself).  With sanlock,
> you will not need a dlm/corosync cluster to have the benefits of locking
> vgs and lvs on shared storage.  This project is requiring a lot of
> preliminary work in the lvm code, because the clvmd approach reaches
> deeply into lvm itself.  Relating back to virt environments, lvmlockd will
> give you direct control of the lock types, modes and objects in each
> command.  This will hopefully make it much easier to use lvm locks in a
> controlled and programatic way to solve problems like vm management.

Anyways, I decided to go with pacemaker, so what I have now fully fits
my needs (and I have it now, not with EL7).

Of course, I fully agree that clvm is just a big hack from the today's
point of view and something need to change here.

Unfortunately I do not have a power and fundings to fully redesign
clustered LVM (I do what I do for projects which did not give me a one
dollar yet), so I decided to just solve my task, being not intrusive.

And I like a state I have it all now in.

Your idea is clean, and it reminds me idea of moving quorum to corosync,
so please keep going. ;)

> 
> So, in preparation for lvmlockd, you should not assume that lvm commands
> will operate in a dlm/corosync environment.  Any new options or
> capabilities should be considered more generally.  Also, the concept of
> lvm commands executing remote operations in a cluster was a poor design
> choice for clvm.  lvmlockd will probably not support this notion.
> Executing remote commands should be done at a higher layer.

It all takes soooo long, but I need it all to be done yesterday ;)

Anyways, please feel free to add me to CC of lvmlockd discussions.

Vladislav
