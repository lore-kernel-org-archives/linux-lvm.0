Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q19GKawQ016307
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2012 11:20:37 -0500
Received: from mta01.helmholtz-muenchen.de (mta01.helmholtz-muenchen.de
	[146.107.3.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q19GKSkr003505
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2012 11:20:29 -0500
Received: from XCH22.scidom.de (xch22.helmholtz-muenchen.de [146.107.8.222])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta01.helmholtz-muenchen.de (Postfix) with ESMTP id 76B0231743B
	for <linux-lvm@redhat.com>; Thu,  9 Feb 2012 17:17:53 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Thu, 9 Feb 2012 17:20:27 +0100
Message-ID: <15785B7E063D464C86DD482FCAE4EBA50160029D9C1C@XCH11.scidom.de>
References: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
	<4ECBF8B3.6050300@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0912@XCH11.scidom.de>
	<4ECD3952.8080803@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF092C@XCH11.scidom.de>
	<4ECE74F8.3000302@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0938@XCH11.scidom.de>
	<4ECFDA00.8000303@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5015FF83D6CCD@XCH11.scidom.de>
	<4EDBDBBF.2000006@alteeve.com>
In-Reply-To: <4EDBDBBF.2000006@alteeve.com>
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
> On 12/04/2011 01:58 PM, Lentes, Bernd wrote:
> >
> > Some more questions:
> > - Is it necessary to have cLVM running as a resource in the
> cluster ?
>
> No, so long as it is running at all, it's fine. I do recommend it
> though, as you can make anything using clvmd dependent on it having
> started properly.
>
> > - And is it possible having the vm's running on different
> nodes, not all on one (because of load balancing) ?
> > Remember that i want to run the vm's in bare lv's, without
> a filesystem. The lv's reside on a SAN.
>
> That's what I do. Mount the same iSCSI target on all VM nodes, then on
> one node set it up as a PV and then a clustered VG. You will
> see the new
> PV and VG on all the other nodes in the cluster. You can then create
> LVs, setup VMs on them and move the VMs around the nodes using live
> migration.
>

Hi,

Again me :-). I lost sight of this thread.
Just for clarification:

- Is it possible having vm's running on different nodes simultaneously in a cLVM environment (one LV per VM, each LV accessing the same pv and vg on a FC SAN) ? E.g. vm1 on node 1, vm2 on node 2.
- And is cLVM able to lock the lv, so that only one host has exclusive access to that lv ? So that the case if a second node tries to access the same lv corruption is prevented.

Sorry to insist, but this is important for me. This is my basic setup, and i'd like to know if it is possible. Because if not, i have to conceive something new.


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
