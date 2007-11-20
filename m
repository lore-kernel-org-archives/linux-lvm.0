Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAKBhb3Z027129
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 06:43:37 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAKBcE63014254
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 06:38:14 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 238704E57C
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 12:37:36 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 379FF9488
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 12:37:35 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id cNGYDte0SGXz for <linux-lvm@redhat.com>;
	Tue, 20 Nov 2007 12:37:31 +0100 (CET)
Received: from [192.168.10.145] (xdsl-87-79-105-93.netcologne.de
	[87.79.105.93]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 12:37:31 +0100 (CET)
Message-ID: <4742C6FA.6020006@wpkg.org>
Date: Tue, 20 Nov 2007 12:37:30 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM snapshots in a iSCSI and XenSource environment
References: <1195557183.6329.54.camel@sanderbal>
In-Reply-To: <1195557183.6329.54.camel@sanderbal>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

S. J. van Harmelen schrieb:
> Hi list,
> 
> In advance my excusses for this radar long post (although it's easy
> readable ;), but I want to make sure that I understand it correctly so I
> don't end up making a very costly mistake.
> 
> I have a storage server (Debian Etch) with mutlipath-tools running and
> on top of that I use IET iscsi-target software to export the multipathed
> device to a XenSource server.
> 
> XenSource creates a PV on the entire exported disk, and then creates a
> few LV's when I create some virtual machines.

Which IMO is a pity, as logically, LVM exists and is usable on that 
given Xen server only. This means you can't really use multiple Xen 
servers, live migration etc.


> Now I would like to take snapshots of these virtual machines as a
> backup. So I want to take a snapshot every day, but hold them for only
> one day. These are quite static machines, so I need want several
> snapshots per machine. Just one in case something happens or a bad
> adjustment is made.

OK, should work.


> I asume that when I drop the snapshot just before creating the new one,
> all changes are merged back to the original volume. Correct? While this
> merging is happening, does the disk then becomes unavailable to the
> virtual machine, or doesn't the virtual machine doesn't notice the
> merge?

I believe there is no "merging back", as the changes are being made to 
the snapshot volume. If you drop the snapshot, it just doesn't exist 
anymore, and the original volume does exist as it did before.
So yes, you can safely drop the snapshots, the process is transparent.


> Also I was wondering if it's a smart idea to create a PV and a LV (both
> spanning the whole disk) on the storage server, and then exporting the
> LV true iSCSI to the XenSource server. In that way I can take the
> snapshots on to storage server directly.

Yes, it is indeed better and more flexible solution.


> Questions that I think of then are if it's not a problem that XenSource
> then creates a new PV and some LV's in je LV I created adn exported on
> the storage server. Is that a problem, or should this work fine?

Hmm? I don't think I understand what you mean.


> And another question is how I can then restore a single LV Xen created,
> from the snapshot of the LV that spans the whole disk on the storage
> server? In that case I can not just revert to the old disk before taking
> the snapshot, because then all the LV's created by Xen will be set back
> to that point, and not just the LV that went bad.

# Will only work if snapshot size is equal or greater than
# the original volume

dd if=/dev/LVM/volume-snapshot of=/dev/LVM/volume

# or, if the allowed snapshot size is smaller, we don't want our
# precious snapshot dropped

dd if=/dev/LVM/volume-snapshot of=/dev/LVM/new-volume
dd if=/dev/LVM/new-volume of=/dev/LVM/volume


> Last question... Without creating a PV and a LV on the storage server
> and just letting XenSource create what it needs to provision the virtual
> machines, I can still see the PV and the LV's Xen created on the storage
> server. Could I take the snapshots from there, although the PV and LV's
> where not created here?

Only when you don't use them on the Xen server at the same time (no 
iSCSI connection; LVM modules on the Xen server unloaded, LVM modules on 
the storage server loaded).
Which brings us to a point: it is better to manage LVMs on a storage 
server than on a Xen host.


-- 
Tomasz Chmielewski
http://lists.wpkg.org
