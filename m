Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QGZkut005669
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2015 12:35:46 -0400
Received: from vm08-mail01.alteeve.ca (mail.alteeve.ca [65.39.153.71])
	by mx1.redhat.com (Postfix) with ESMTPS id 6620F8EA2B
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2015 16:35:45 +0000 (UTC)
Received: from lemass.alteeve.ca (199-7-157-65.eng.wind.ca [199.7.157.65])
	by vm08-mail01.alteeve.ca (Postfix) with ESMTPSA id B1C2820128
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2015 12:35:40 -0400 (EDT)
References: <55DC3EBF.4030703@shockmedia.nl>
From: Digimer <lists@alteeve.ca>
Message-ID: <55DDEADB.6050701@alteeve.ca>
Date: Wed, 26 Aug 2015 12:35:39 -0400
MIME-Version: 1.0
In-Reply-To: <55DC3EBF.4030703@shockmedia.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots on clustered LVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 25/08/15 06:09 AM, Bram Klein Gunnewiek wrote:
> Currently we are using LVM as backing storage for our DRBD disks in HA
> set-ups. We use QEMU instances on our node's using (local) DRBD targets
> for storage. This enables us to do live migrations between the DRBD
> primary/secondary nodes.
> 
> We want to support iSCSI targergets in our HA enviroment. We are trying
> to see if we can use (c)lvm for that by creating a volume group of our
> iSCSI block devices and use that volume group on all nodes to create
> logical volumes. This seems to work fine if we handle locking etc
> properly and make sure we only activate the logical volumes on one node
> at a time. As long as we only have a volume active on one node snapshots
> seem to work fine also.

DRBD, like an iSCSI LUN, is just another block device to LVM. So I see
no reason why clvmd won't work just fine. Main advantage is that you can
scale iscsi to 3+ nodes, but you lose data being replicated unless you
have a very nice SAN.

Once the LV is visible on all nodes though, it's up to you to make sure
they're used by apps/fses that understand clustering. I use clustered
LVs to back gfs2 and to back VMs (LV dedicated to a VM, and the cluster
resource manager ensures that a VM is only on one node at a time).

> However, we run into problems when we want to perform a live migration
> of a running QEMU instance. In order to do a live migration we have to
> start a second similar QEMU on the node we want to migrate to and start
> a QEMU live migration. In order for us to do that we have to make the
> logical volume active on the target node otherwise we can't start the
> QEMU instance. During the live migration QEMU ensures that data is only
> written on one node (e.g. during the live migration data will be written
> on the source node, QEMU wil then pause the instance for a short while
> when copying the last data and will then continue the instance on the
> target node).

If you're using clustered LVM, live migration will work just fine. This
is exactly what I do. The LV will need to be ACTIVE on both nodes though.

> This use case works fine with a clustered LVM set-up except for
> snapshots. Changes are not saved in the snapshot when the logical volume
> is active on both nodes (as expected if the manual is correct:
> https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/5/html-single/Logical_Volume_Manager_Administration/#snapshot_volumes).

Note that your link is very old, for RHEL 5.

Snapshotting is a problem. As Zdenek said, you have to set the other
nodes to inactive and then set the current host node's LV to
'exclusive'. Trick I found though was that you can't mark it as
exclusive while it's ACTIVE, and you can't make the LV inactive while
it's hosting a VM... So in practical terms, snapshotting clustered LVs
is not feasible.

> If we are correct it means we can use lvm for as clustered "file system"
> but can't trust our snapshots to be 100% reliable if a volume group has
> been made active on more then one node. E.G. when doing a live migration
> between two nodes of a QEMU instance our snapshots become unreliable.

You can never trust a snapshot 100%; It doesn't capture information in
the VM's memory. So at best, using a snapshot to recover is like
recovering from a sudden power loss. It's then up to your apps and OS to
recover, and that's not always the case with many DBs, unless they're
carefully configured.

This is the core reason why our company won't support snapshots at all.
It gives people a false sense of having good backups.

> Are these conclusions correct? Is there a solution for this problem or
> is this simply a known limitation of clustered lvm without a work-around?

Clustered LVs over a SAN-backed PV will work perfectly fine for live
migrations. Snapshots are not feasible though, and not recommended in
any case.

-- 
Digimer
Papers and Projects: https://alteeve.ca/w/
What if the cure for cancer is trapped in the mind of a person without
access to education?
