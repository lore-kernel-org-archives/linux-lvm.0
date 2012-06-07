Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q57KMOMH009889
	for <linux-lvm@redhat.com>; Thu, 7 Jun 2012 16:22:24 -0400
Received: from mta01.helmholtz-muenchen.de (mta01.helmholtz-muenchen.de
	[146.107.3.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q57KMMgt029360
	for <linux-lvm@redhat.com>; Thu, 7 Jun 2012 16:22:22 -0400
Received: from XCH21.scidom.de (xch21.helmholtz-muenchen.de [146.107.8.221])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta01.helmholtz-muenchen.de (Postfix) with ESMTP id F16AE317433
	for <linux-lvm@redhat.com>; Thu,  7 Jun 2012 22:17:56 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Thu, 7 Jun 2012 22:22:27 +0200
Message-ID: <15785B7E063D464C86DD482FCAE4EBA5016A2B3C7618@XCH11.scidom.de>
References: <15785B7E063D464C86DD482FCAE4EBA5016A2B3C7612@XCH11.scidom.de>
	<CAJrH5Gv2JZDhD7XX-bnv9zGO5J4ThR4FVFhMg5Kqysy553yn-w@mail.gmail.com>
	<15785B7E063D464C86DD482FCAE4EBA5016A2B3C7616@XCH11.scidom.de>
	<CAJrH5GtUHRpCNwWbMTmQseqL+mAtjZRcTtn0MKoGGtgz0NSzXw@mail.gmail.com>
In-Reply-To: <CAJrH5GtUHRpCNwWbMTmQseqL+mAtjZRcTtn0MKoGGtgz0NSzXw@mail.gmail.com>
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] some principal questions about cLVM
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>


Sebastian wrote:
> Yes you can have only 1 VG holding all your LVs.
> Let clvmd start normally at boot time, it will take care of the shared VG.
> In your cluster config, you'll only manage LV and FS as resources.


I will install the VM's in plain partitions, without a FS. This is more performant.
How can i manage LV's in a Cluster config ? Is there a ressource agent for LV's ?


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
