Date: Fri, 15 Mar 2013 12:31:24 -0400
From: David Teigland <teigland@redhat.com>
Message-ID: <20130315163124.GA1061@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: Vladislav Bogdanov <bubble@hoster-ok.com>, Andreas Pflug <pgadmin@pse-consulting.de>

> I need to convert lock on a remote node during last stage of ver3
> migration in libvirt/qemu

Hi, I wrote and maintain the dlm and have more recently written a new
disk-based lock manager called sanlock, https://fedorahosted.org/sanlock/
which operates with only shared storage among nodes (no networking or
other cluster manager.)

sanlock was written to allow RHEV to manage leases for vm images on shared
storage, including the ability to migrate leases among hosts (which is the
most complicated part, as you've mentioned above.)  sanlock plugs into the
libvirt locking api, which also supports file locks (usable on local or
nfs file systems.)  (Search for "virtlockd".)

Trying to use/control vm locks via lvm commands is not a good way to solve
the vm management/migration problem at the present time (but see below).
Instead, I'd suggest doing the locking via the libvirt locking api which
was designed for this purpose.  As I mentioned, libvirt supports both
sanlock and file locks, but another option is to write a new libvirt
locking plug-in for dlm/corosync.  This would be the best way to use dlm
locks to protect vm images on shared storage; I've been hoping someone
would do this for some time.

Incidentally, I've recently started a new project which is to replace
clvmd with a new "lvmlockd".  I'm designing lvmlockd to support both dlm
and sanlock on the back side (transparent to lvm itself).  With sanlock,
you will not need a dlm/corosync cluster to have the benefits of locking
vgs and lvs on shared storage.  This project is requiring a lot of
preliminary work in the lvm code, because the clvmd approach reaches
deeply into lvm itself.  Relating back to virt environments, lvmlockd will
give you direct control of the lock types, modes and objects in each
command.  This will hopefully make it much easier to use lvm locks in a
controlled and programatic way to solve problems like vm management.

So, in preparation for lvmlockd, you should not assume that lvm commands
will operate in a dlm/corosync environment.  Any new options or
capabilities should be considered more generally.  Also, the concept of
lvm commands executing remote operations in a cluster was a poor design
choice for clvm.  lvmlockd will probably not support this notion.
Executing remote commands should be done at a higher layer.

Dave
