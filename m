Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAKGCvTS003068
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 11:12:57 -0500
Received: from mailrelay02.solcon.nl (mailrelay02.solcon.nl [212.45.32.108])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAKGCO8A027098
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 11:12:25 -0500
Received: from [62.163.86.220] (helo=[192.168.0.122])
	by mailrelay02.solcon.nl with esmtp (Exim 4.60)
	(envelope-from <svh@dds.nl>) id 1IuVhv-00037H-NH
	for linux-lvm@redhat.com; Tue, 20 Nov 2007 17:12:15 +0100
Subject: Re: [linux-lvm] LVM snapshots in a iSCSI and XenSource environment
From: "S. J. van Harmelen" <svh@dds.nl>
In-Reply-To: <4742DBE7.5080706@wpkg.org>
References: <1195557183.6329.54.camel@sanderbal> <4742C6FA.6020006@wpkg.org>
	<1195561302.6329.73.camel@sanderbal>  <4742DBE7.5080706@wpkg.org>
Date: Tue, 20 Nov 2007 17:12:20 +0100
Message-Id: <1195575140.10434.21.camel@sanderbal>
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


On Tue, 2007-11-20 at 14:06 +0100, Tomasz Chmielewski wrote:
> S. J. van Harmelen schrieb:
> > Thanks for your reaction!
> > 
> > On Tue, 2007-11-20 at 12:37 +0100, Tomasz Chmielewski wrote:
> >> S. J. van Harmelen schrieb:
> >>> Hi list,
> >>>
> >>> In advance my excusses for this radar long post (although it's easy
> >>> readable ;), but I want to make sure that I understand it correctly so I
> >>> don't end up making a very costly mistake.
> >>>
> >>> I have a storage server (Debian Etch) with mutlipath-tools running and
> >>> on top of that I use IET iscsi-target software to export the multipathed
> >>> device to a XenSource server.
> >>>
> >>> XenSource creates a PV on the entire exported disk, and then creates a
> >>> few LV's when I create some virtual machines.
> >> Which IMO is a pity, as logically, LVM exists and is usable on that 
> >> given Xen server only. This means you can't really use multiple Xen 
> >> servers, live migration etc.
> > 
> > Are you sure about that? Accoring to Xen lvm over iSCSI is considered as
> > shared storage that can be used for live migration
> > (http://docs.xensource.com/XenServer/4.0.1/installation/ch03s03.html):
> > 
> > <snip>
> > 3.3.3. XenServer Hosts with shared iSCSI storage
> 
> This implies turning a Xen server into a NAS server, as I understand?
> Yes, this should work - I have a custom Xen setup, and I don't connect a 
> NAS and a Xen server on one host.
> But according to the description, yes, it should work.
> 
> 
> (...)
> 
> >>> Questions that I think of then are if it's not a problem that XenSource
> >>> then creates a new PV and some LV's in je LV I created adn exported on
> >>> the storage server. Is that a problem, or should this work fine?
> >> Hmm? I don't think I understand what you mean.
> > 
> > I mean I will have 2 sets of PV's and LV's. One set on the storage
> > server (that has one PV and one LV that both span the whole disk), and
> > one set op the Xen server (the ones that Xen makes by itself when I add
> > a new vitrual machine).
> > 
> > Now the one LV from the storage server that Xen sees is being exported
> > true iSCSI, so it wouldn't know that it is infact a LV that it's talking
> > to. As far as the Xen server conserns this is just a raw disk. So it
> > will then just create the needed PV and LV's on it to provision virtual
> > mahines.
> > 
> > The question was if this PV/LV in another PV/LV (on another physical
> > machine) can do any harm?
> 
> Should work, as long as you don't use it on two different machines 
> (i.e., target/initiator) as LVM at the same time.
> 
> 
> >>> And another question is how I can then restore a single LV Xen created,
> >>> from the snapshot of the LV that spans the whole disk on the storage
> >>> server? In that case I can not just revert to the old disk before taking
> >>> the snapshot, because then all the LV's created by Xen will be set back
> >>> to that point, and not just the LV that went bad.
> >> # Will only work if snapshot size is equal or greater than
> >> # the original volume
> >>
> >> dd if=/dev/LVM/volume-snapshot of=/dev/LVM/volume
> >>
> >> # or, if the allowed snapshot size is smaller, we don't want our
> >> # precious snapshot dropped
> >>
> >> dd if=/dev/LVM/volume-snapshot of=/dev/LVM/new-volume
> >> dd if=/dev/LVM/new-volume of=/dev/LVM/volume
> > 
> > Oke, but how about this when using LVM as I just described a few lines
> > above here with the PV/LV in another PV/LV setup. How can I then restore
> > a snapshot of a virtual machines' LV from the snapshot of the LV on the
> > storage server?
> 
> As a prerequisite, you need to "see" that LVM.
> But could you be more specific on what you want (write a bit more 
> details in points, write a small diagram etc.)?

Oke... Let's say I have a storage server with one LUN connected to it.
The LUN becomes /dev/sdi on the storage server. I will then create a PV
on /dev/sdi spanning the whole disk. In the PV I will create one LV also
spanning the whole disk. Say we name this LV lv_storage. So the path to
this LV gets to be /dev/lvm/lv_storage.

In iSCSI I will then create a target which points
to /dev/lvm/lv_storage. The Xen server will use open-iscsi to connect to
that target (/dev/lvm/lvstorage) and on the Xen server it
becomes /dev/sdb. At this point Xen has also created a PV that spans the
whole disk (/dev/sdb)

Then when I create a virtual machine on the Xen server, it creates a LV
on /dev/sdb with the size of the virtual disk. Say this LV gets named
lv_virtualmachine1 and the next gets to be named lv_virtualmachine2 and
so on.

So far everything clear?

Now my thoughts where to take snapshots on the storage server. So that
would mean I would take a snapshot of lv_storage. This should not be a
problem. But what if virtual machine 2 crashes and has to be restored?

In that case I cannot restore lv_storage with a dd command, because then
all the data will be restored (lv_virtualmachine1 and
lv_virtualmachine2, because they are both on lv_storage). So is it
possible to "restore" only lv_virtualmachine2 when I took a snapshot of
lv_storage?

I can see the PV and LV's Xen created on lv_storage on the storage
server when I run pvs by the way...

Hope you understand what I mean now?

> 
> 
