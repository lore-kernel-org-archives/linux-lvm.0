Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pB4IwErv032341
	for <linux-lvm@redhat.com>; Sun, 4 Dec 2011 13:58:14 -0500
Received: from mta02.helmholtz-muenchen.de (mta02.helmholtz-muenchen.de
	[146.107.4.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB4IwDTg032280
	for <linux-lvm@redhat.com>; Sun, 4 Dec 2011 13:58:14 -0500
Received: from XCH21.scidom.de (xch21.helmholtz-muenchen.de [146.107.8.221])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta02.helmholtz-muenchen.de (Postfix) with ESMTP id C6A4F317496
	for <linux-lvm@redhat.com>; Sun,  4 Dec 2011 19:53:58 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Sun, 4 Dec 2011 19:58:10 +0100
Message-ID: <15785B7E063D464C86DD482FCAE4EBA5015FF83D6CCD@XCH11.scidom.de>
References: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
	<4ECBF8B3.6050300@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0912@XCH11.scidom.de>
	<4ECD3952.8080803@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF092C@XCH11.scidom.de>
	<4ECE74F8.3000302@alteeve.com>
	<15785B7E063D464C86DD482FCAE4EBA5014D7BEF0938@XCH11.scidom.de>
	<4ECFDA00.8000303@alteeve.com>
In-Reply-To: <4ECFDA00.8000303@alteeve.com>
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


Some more questions:
- Is it necessary to have cLVM running as a resource in the cluster ?
- And is it possible having the vm's running on different nodes, not all on one (because of load balancing) ?
Remember that i want to run the vm's in bare lv's, without a filesystem. The lv's reside on a SAN.


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
