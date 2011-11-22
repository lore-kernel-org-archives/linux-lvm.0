Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pAMJW96R007443
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2011 14:32:09 -0500
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAMJW8vB004198
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2011 14:32:08 -0500
Message-ID: <4ECBF8B3.6050300@alteeve.com>
Date: Tue, 22 Nov 2011 14:32:03 -0500
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 11/22/2011 02:22 PM, Lentes, Bernd wrote:
> Hi,
>
> i have a bit experience in LVM, but not in cLVM. So i have some principal questions:
> My idea is to establish a HA-Cluster with two nodes. The ressources which are managed by the cluster are virtual machines (KVM).
> I have a FC SAN, where the vm's will reside. I want to create vdisks in my SAN which are integrated as a PV in both hosts. On top of the PV's i will create a VG, and finally LV's. For each VM one LV.
>
> How are things going with cLVM ? Do i have to create PV ==>  VG ==>  LV seperately ? Or does cLVM replicate the information from one host to the other ? So that i have to create PV, VG and LV only once on the first node and this configuration is replicated to the second host.
>
> What is about e.g. resizing a LV ? Is this replicated, or do i have to resize twice, on each host ?
>
> E.g. one host is running VM3 in the corresponding lv3 on the first host. Is the second host able to access lv3 simultaneously or is there a kind of locking ?
>
> Is it possible to run some vm's on the first host and others on the second (as a kind of load-balancing) ?
>
> Is it possible to perform a live-migration from one host to the other in this scenario ?
>
> I will not install a filesystem in the lv's, because i got recommendations to run the vm's in bare partitions, this would be faster.
>
>
> Thanks for any eye-opening answer.
>
>
> Bernd

Clustered LVM is, effectively, just normal LVM with external (clustered) 
locking using DLM. Once built, anything you do on one node will be seen 
immediately on all other nodes.

Mount your iSCSI target as your normally would on all nodes. On one 
node, with clvmd running, 'pvcreate /dev/foo' then 'vgcreate -c y -n bar 
/dev/foo'. If you then run 'vgscan' on all other nodes, you'll see the 
VG you just created.

Be absolutely sure you configure fencing in your cluster! If a node 
falls silent, it must be forcibly removed from the cluster before any 
recovery can commence. Failed fencing will hang the cluster, and 
short-circuited fencing will lead to corruption.

Finally, yes, you can do live migration between nodes in the same 
cluster (specifically, they need to be in the same DLM lockspace).

I use clvmd quite a bit, feel free to ask if you have any more 
questions. I also have an in-progress tutorial using clvmd on DRBD, but 
you could just replace "/dev/drbdX" with the appropriate iSCSI target 
and the rest is the same.

-- 
Digimer
E-Mail:              digimer@alteeve.com
Freenode handle:     digimer
Papers and Projects: http://alteeve.com
Node Assassin:       http://nodeassassin.org
"omg my singularity battery is dead again.
stupid hawking radiation." - epitron
