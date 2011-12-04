Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pB4KitQ5013442
	for <linux-lvm@redhat.com>; Sun, 4 Dec 2011 15:44:55 -0500
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB4Kisci018165
	for <linux-lvm@redhat.com>; Sun, 4 Dec 2011 15:44:55 -0500
Message-ID: <4EDBDBBF.2000006@alteeve.com>
Date: Sun, 04 Dec 2011 15:44:47 -0500
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
	<4ECBF8B3.6050300@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0912@XCH11.scidom.de>
	<4ECD3952.8080803@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF092C@XCH11.scidom.de>
	<4ECE74F8.3000302@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0938@XCH11.scidom.de>
	<4ECFDA00.8000303@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5015FF83D6CCD@XCH11.scidom.de>
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA5015FF83D6CCD@XCH11.scidom.de>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 12/04/2011 01:58 PM, Lentes, Bernd wrote:
> 
> Some more questions:
> - Is it necessary to have cLVM running as a resource in the cluster ?

No, so long as it is running at all, it's fine. I do recommend it
though, as you can make anything using clvmd dependent on it having
started properly.

> - And is it possible having the vm's running on different nodes, not all on one (because of load balancing) ?
> Remember that i want to run the vm's in bare lv's, without a filesystem. The lv's reside on a SAN.

That's what I do. Mount the same iSCSI target on all VM nodes, then on
one node set it up as a PV and then a clustered VG. You will see the new
PV and VG on all the other nodes in the cluster. You can then create
LVs, setup VMs on them and move the VMs around the nodes using live
migration.

-- 
Digimer
E-Mail:              digimer@alteeve.com
Freenode handle:     digimer
Papers and Projects: http://alteeve.com
Node Assassin:       http://nodeassassin.org
"omg my singularity battery is dead again.
stupid hawking radiation." - epitron
