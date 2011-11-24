Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pAOGWLud023304
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2011 11:32:21 -0500
Received: from mta02.helmholtz-muenchen.de (mta02.helmholtz-muenchen.de
	[146.107.4.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAOGWDUx008789
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2011 11:32:13 -0500
Received: from XCH22.scidom.de (xch22.helmholtz-muenchen.de [146.107.8.222])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta02.helmholtz-muenchen.de (Postfix) with ESMTP id 5EEF73173D1
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2011 17:30:00 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Thu, 24 Nov 2011 17:32:12 +0100
Message-ID: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF092C@XCH11.scidom.de>
References: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
	<4ECBF8B3.6050300@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0912@XCH11.scidom.de>
	<4ECD3952.8080803@alteeve.com>
In-Reply-To: <4ECD3952.8080803@alteeve.com>
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] new to cLVM - some principal questions
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Digimer wrote:

> > Hi Digimer,
> >
> > we met already on the DRBD-ML.
> > clvmd must be running on all nodes ?
>
> Yes, but more to the point, they must also be in the same
> cluster. Even
> more specifically, they must be in the same DLM lockspace. :)
>
> > I'm planning to implement fencing. I use two HP Server
> which support iLO.
>
> Good, fencing is required. It's a good idea to also use a
> switched PDU
> as a backup fence device. If the iLO loses power (ie, blown
> power supply
> or failed BMC), the fence will fail. Having the PDU provides an
> alternative method to confirm node death and will avoid
> blocking. That
> is, when a fence is pending (and it will wait forever for
> success), DLM
> will not give out locks so your storage will block.
>
> > Using this i can restart a server when the OS is not longer
> accessible.
>
> The cluster, fenced specifically, will do this for you.

Yes, that's logical.

>
> > I think that's a kind of STONITH. Is that what you describe
> with "short-circuited fencing" ?
>
> Fencing and Stonith are two names for the same thing; Fencing was
> traditionally used in Red Hat clusters and STONITH in
> heartbeat/pacemaker clusters. It's arguable which is
> preferable, but I
> personally prefer fencing as it more directly describes the goal of
> "fencing off" (isolating) a failed node from the rest of the cluster.
>
> To "short circuit" the fence, I mean return a success message
> to fenced
> without actually properly fencing the device. This is an
> incredibly bad
> idea that I've seen people try to do in the past.

Strange people who have ideas like that.

>
> > You recommend not using a STONITH method ? What else can i
> use for fencing ?
>
> I generally use a mix of IPMI (or iLO/RSA/DRAC, effectively the same
> thing, but vendor-specific) as my primary fence device because it can
> confirm that the node is off. However, as mentioned above, it
> will fail
> if the node it is in dies badly enough.
>
> In that case, a switched PDU, like the APC 7900
> (http://www.apc.com/products/resource/include/techspec_index.c
> fm?base_sku=AP7900)
> makes a perfect backup. I don't use it as primary though
> because it can
> only confirm that power has been cut to the specified
> port(s), not that
> the node itself is off, leaving room for configuration or
> cabling errors
> returning false-positives. It is critical to test PDU fence devices
> prior to deployment and to ensure that cables are then never moved
> around after.

I ordered one.

>
> > What is about concurrent access from both nodes to the same
> lv ? Is that possible with cLVM ?
>
> Yes, that is the whole point. For example, with a cluster-enabled VG,
> you can create a new LV on one node, and then immediately see
> that new
> LV on all other nodes.
>
> Keep in mind, this does *not* magically provide cluster awareness to
> filesystems. For example, you can not use ext3 on a clustered
> VG->LV on
> two nodes at once. You will still need a cluster-aware
> filesystem like GFS2.

I don't have a filesystem. I will install the vm's (using KVM) in bare partitions (lv's).
Is that a problem ?
I got recommendations this is faster than installing them in partitions with a filesystem.

>
> > Does cLVM sync access from the two nodes, or does it lock
> the lv so that only one has exclusive access to the lv ?
>
> When a node wants access to a clustered LV, it requests a
> lock from DLM.
> There are a few types of locks, but let's look at exclusive, which is
> needed to write to the LV (simplified example).
>
> So Node 1 decides it wants to write to an LV. It sends a
> request to DLM
> for an exclusive lock on the LV. DLM sees that no other node
> has a lock,
> so the lock is granted to Node 1 for that LV's lockspace. Node 1 then
> proceeds to use the LV as if it was a simple local LV.
>
> Meanwhile, Node 2 also wants access to that LV and asks DLM
> for a lock.
> This time DLM sees that Node 1 has an exclusive lock in that LV's
> lockspace and denies the request. Node 2 can not use the LV.
>
> At some point, Node 1 finishes and releases the lock. Now Node 2 can
> re-request the lock, and it will be granted.
>
> Now let's talk about how fencing fits;
>
> Let's assume that Node 1 hangs or dies while it still holds the lock.
> The fenced daemon will be triggered and it will notify DLM
> that there is
> a problem, and DLM will block all further requests. Next,
> fenced tries
> to fence the node using one of it's configured fence methods. It will
> try the first, then the second, then the first again, looping forever
> until one of the fence calls succeeds.
>
> Once a fence call succeeds, fenced notifies DLM that the node is gone
> and then DLM will clean up any locks formerly held by Node 1. After
> this, Node 2 can get a lock, despite Node 1 never itself releasing it.
>
> Now, let's imagine that a fence agent returned success but the node
> wasn't actually fenced. Let's also assume that Node 1 was
> hung, not dead.
>
> So DLM thinks that Node 1 was fenced, clears it's old locks
> and gives a
> new one to Node 2. Node 2 goes about recovering the
> filesystem and the
> proceeds to write new data. At some point later, Node 1 unfreezes,
> thinks it still has an exclusive lock on the LV and finishes
> writing to
> the disk.

But you said "So DLM thinks that Node 1 was fenced, clears it's old locks and gives a
new one to Node 2" How can node 1 get access after unfreezing, when the lock is cleared ?

>
> Voila, you just corrupted your storage.
>
> You can apply this to anything using DLM lockspaces, by the way.
>
> > Thanks for your answer.
>
> Happy to help. :)
>

The situation that two nodes offer the same service should normally be prevented by the CRM.

Thanks for your very detailed answer.

Bernd

Helmholtz Zentrum München
Deutsches Forschungszentrum für Gesundheit und Umwelt (GmbH)
Ingolstädter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir´in Bärbel Brumme-Bothe
Geschäftsführer: Prof. Dr. Günther Wess und Dr. Nikolaus Blum
Registergericht: Amtsgericht München HRB 6466
USt-IdNr: DE 129521671
