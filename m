Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pANFZLxm023799
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2011 10:35:21 -0500
Received: from mta01.helmholtz-muenchen.de (mta01.helmholtz-muenchen.de
	[146.107.3.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pANFZJ5D021029
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2011 10:35:20 -0500
Received: from XCH21.scidom.de (xch21.helmholtz-muenchen.de [146.107.8.221])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta01.helmholtz-muenchen.de (Postfix) with ESMTP id EB68431742A
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2011 15:35:25 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Wed, 23 Nov 2011 16:35:18 +0100
Message-ID: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF0912@XCH11.scidom.de>
References: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
	<4ECBF8B3.6050300@alteeve.com>
In-Reply-To: <4ECBF8B3.6050300@alteeve.com>
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
>
> On 11/22/2011 02:22 PM, Lentes, Bernd wrote:
> > Hi,
> >
> > i have a bit experience in LVM, but not in cLVM. So i have
> some principal questions:
> > My idea is to establish a HA-Cluster with two nodes. The
> ressources which are managed by the cluster are virtual
> machines (KVM).
> > I have a FC SAN, where the vm's will reside. I want to
> create vdisks in my SAN which are integrated as a PV in both
> hosts. On top of the PV's i will create a VG, and finally
> LV's. For each VM one LV.
> >
> > How are things going with cLVM ? Do i have to create PV ==>
>  VG ==>  LV seperately ? Or does cLVM replicate the
> information from one host to the other ? So that i have to
> create PV, VG and LV only once on the first node and this
> configuration is replicated to the second host.
> >
> > What is about e.g. resizing a LV ? Is this replicated, or
> do i have to resize twice, on each host ?
> >
> > E.g. one host is running VM3 in the corresponding lv3 on
> the first host. Is the second host able to access lv3
> simultaneously or is there a kind of locking ?
> >
> > Is it possible to run some vm's on the first host and
> others on the second (as a kind of load-balancing) ?
> >
> > Is it possible to perform a live-migration from one host to
> the other in this scenario ?
> >
> > I will not install a filesystem in the lv's, because i got
> recommendations to run the vm's in bare partitions, this
> would be faster.
> >
> >
> > Thanks for any eye-opening answer.
> >
> >
> > Bernd
>
> Clustered LVM is, effectively, just normal LVM with external
> (clustered)
> locking using DLM. Once built, anything you do on one node
> will be seen
> immediately on all other nodes.
>
> Mount your iSCSI target as your normally would on all nodes. On one
> node, with clvmd running, 'pvcreate /dev/foo' then 'vgcreate
> -c y -n bar
> /dev/foo'. If you then run 'vgscan' on all other nodes,
> you'll see the
> VG you just created.
>
> Be absolutely sure you configure fencing in your cluster! If a node
> falls silent, it must be forcibly removed from the cluster before any
> recovery can commence. Failed fencing will hang the cluster, and
> short-circuited fencing will lead to corruption.
>
> Finally, yes, you can do live migration between nodes in the same
> cluster (specifically, they need to be in the same DLM lockspace).
>
> I use clvmd quite a bit, feel free to ask if you have any more
> questions. I also have an in-progress tutorial using clvmd on
> DRBD, but
> you could just replace "/dev/drbdX" with the appropriate iSCSI target
> and the rest is the same.
>
> --

Hi Digimer,

we met already on the DRBD-ML.
clvmd must be running on all nodes ?
I'm planning to implement fencing. I use two HP Server which support iLO.
Using this i can restart a server when the OS is not longer accessible.
I think that's a kind of STONITH. Is that what you describe with "short-circuited fencing" ?
You recommend not using a STONITH method ? What else can i use for fencing ?

What is about concurrent access from both nodes to the same lv ? Is that possible with cLVM ?
Does cLVM sync access from the two nodes, or does it lock the lv so that only one has exclusive access to the lv ?

Thanks for your answer.


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
