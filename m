Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAKCMKce010203
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 07:22:20 -0500
Received: from mailrelay02.solcon.nl (mailrelay02.solcon.nl [212.45.32.108])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAKCLlGO010345
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 07:21:47 -0500
Received: from [62.163.86.220] (helo=[192.168.0.122])
	by mailrelay02.solcon.nl with esmtp (Exim 4.60)
	(envelope-from <svh@dds.nl>) id 1IuS6l-0005Ja-SW
	for linux-lvm@redhat.com; Tue, 20 Nov 2007 13:21:39 +0100
Subject: Re: [linux-lvm] LVM snapshots in a iSCSI and XenSource environment
From: "S. J. van Harmelen" <svh@dds.nl>
In-Reply-To: <4742C6FA.6020006@wpkg.org>
References: <1195557183.6329.54.camel@sanderbal> <4742C6FA.6020006@wpkg.org>
Date: Tue, 20 Nov 2007 13:21:42 +0100
Message-Id: <1195561302.6329.73.camel@sanderbal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks for your reaction!

On Tue, 2007-11-20 at 12:37 +0100, Tomasz Chmielewski wrote:
> S. J. van Harmelen schrieb:
> > Hi list,
> > 
> > In advance my excusses for this radar long post (although it's easy
> > readable ;), but I want to make sure that I understand it correctly so I
> > don't end up making a very costly mistake.
> > 
> > I have a storage server (Debian Etch) with mutlipath-tools running and
> > on top of that I use IET iscsi-target software to export the multipathed
> > device to a XenSource server.
> > 
> > XenSource creates a PV on the entire exported disk, and then creates a
> > few LV's when I create some virtual machines.
> 
> Which IMO is a pity, as logically, LVM exists and is usable on that 
> given Xen server only. This means you can't really use multiple Xen 
> servers, live migration etc.

Are you sure about that? Accoring to Xen lvm over iSCSI is considered as
shared storage that can be used for live migration
(http://docs.xensource.com/XenServer/4.0.1/installation/ch03s03.html):

<snip>
3.3.3. XenServer Hosts with shared iSCSI storage

Adding shared storage to the XenServer network enables grouping of
XenServer Hosts into Resource Pools, enabling live relocation of VMs and
sharing of server resources.

Requirements

      * two or more x86 servers with local storage 
      * one or more Windows workstations, on same network as the
        XenServer Hosts 
      * a server providing a shared directory via iSCSI
<snip>
> 
> > Now I would like to take snapshots of these virtual machines as a
> > backup. So I want to take a snapshot every day, but hold them for only
> > one day. These are quite static machines, so I need want several
> > snapshots per machine. Just one in case something happens or a bad
> > adjustment is made.
> 
> OK, should work.
> 
> 
> > I asume that when I drop the snapshot just before creating the new one,
> > all changes are merged back to the original volume. Correct? While this
> > merging is happening, does the disk then becomes unavailable to the
> > virtual machine, or doesn't the virtual machine doesn't notice the
> > merge?
> 
> I believe there is no "merging back", as the changes are being made to 
> the snapshot volume. If you drop the snapshot, it just doesn't exist 
> anymore, and the original volume does exist as it did before.
> So yes, you can safely drop the snapshots, the process is transparent.
> 
> 
> > Also I was wondering if it's a smart idea to create a PV and a LV (both
> > spanning the whole disk) on the storage server, and then exporting the
> > LV true iSCSI to the XenSource server. In that way I can take the
> > snapshots on to storage server directly.
> 
> Yes, it is indeed better and more flexible solution.
> 
> 
> > Questions that I think of then are if it's not a problem that XenSource
> > then creates a new PV and some LV's in je LV I created adn exported on
> > the storage server. Is that a problem, or should this work fine?
> 
> Hmm? I don't think I understand what you mean.

I mean I will have 2 sets of PV's and LV's. One set on the storage
server (that has one PV and one LV that both span the whole disk), and
one set op the Xen server (the ones that Xen makes by itself when I add
a new vitrual machine).

Now the one LV from the storage server that Xen sees is being exported
true iSCSI, so it wouldn't know that it is infact a LV that it's talking
to. As far as the Xen server conserns this is just a raw disk. So it
will then just create the needed PV and LV's on it to provision virtual
mahines.

The question was if this PV/LV in another PV/LV (on another physical
machine) can do any harm?

> 
> 
> > And another question is how I can then restore a single LV Xen created,
> > from the snapshot of the LV that spans the whole disk on the storage
> > server? In that case I can not just revert to the old disk before taking
> > the snapshot, because then all the LV's created by Xen will be set back
> > to that point, and not just the LV that went bad.
> 
> # Will only work if snapshot size is equal or greater than
> # the original volume
> 
> dd if=/dev/LVM/volume-snapshot of=/dev/LVM/volume
> 
> # or, if the allowed snapshot size is smaller, we don't want our
> # precious snapshot dropped
> 
> dd if=/dev/LVM/volume-snapshot of=/dev/LVM/new-volume
> dd if=/dev/LVM/new-volume of=/dev/LVM/volume

Oke, but how about this when using LVM as I just described a few lines
above here with the PV/LV in another PV/LV setup. How can I then restore
a snapshot of a virtual machines' LV from the snapshot of the LV on the
storage server?

> 
> 
> > Last question... Without creating a PV and a LV on the storage server
> > and just letting XenSource create what it needs to provision the virtual
> > machines, I can still see the PV and the LV's Xen created on the storage
> > server. Could I take the snapshots from there, although the PV and LV's
> > where not created here?
> 
> Only when you don't use them on the Xen server at the same time (no 
> iSCSI connection; LVM modules on the Xen server unloaded, LVM modules on 
> the storage server loaded).
> Which brings us to a point: it is better to manage LVMs on a storage 
> server than on a Xen host.
> 
> 
