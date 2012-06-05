Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q55CEnPB022824
	for <linux-lvm@redhat.com>; Tue, 5 Jun 2012 08:14:49 -0400
Received: from mta02.helmholtz-muenchen.de (mta02.helmholtz-muenchen.de
	[146.107.4.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q55CElNU028969
	for <linux-lvm@redhat.com>; Tue, 5 Jun 2012 08:14:48 -0400
Received: from XCH21.scidom.de (xch21.helmholtz-muenchen.de [146.107.8.221])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta02.helmholtz-muenchen.de (Postfix) with ESMTP id 0824B3173FA
	for <linux-lvm@redhat.com>; Tue,  5 Jun 2012 14:13:11 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Tue, 5 Jun 2012 14:14:46 +0200
Message-ID: <15785B7E063D464C86DD482FCAE4EBA5016A2B3C7612@XCH11.scidom.de>
Content-Language: de-DE
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] some principal questions about cLVM
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

i'm new to cLVM. I used "normal" LVM several times, and i like it.
I want to establish a two node cluster. As resources i have VM's (using KVM). Furthermore i will have a FC SAN.
I'd like to build PV, then VG and finally LV's on top of the SAN. Every VM will reside in one LV.
Is that ok ?
My question is now: When i create virtual disks in my SAN, do i have to create a Virtual Disk (or LUN) on my SAN, then PV, VG and finally LV for every VM ?
Or can i create ONE Virtual Disk (LUN) in my SAN, on top of that create ONE PV and ONE VG and finally for every VM one LV ? This would be easier.

I'd like to have the VM's distributed between the two nodes, as a kind of Load-Balancing.
Is it possible that the VG is running on both nodes simultaneously, having some LV's (and thereby some VM's) running on node 1 and others on node 2 ?

Thanks for any answer.


Bernd


--
Bernd Lentes

Systemadministration
Institut f�r Entwicklungsgenetik
HelmholtzZentrum m�nchen
bernd.lentes@helmholtz-muenchen.de
phone: +49 89 3187 1241
fax:   +49 89 3187 3826
http://www.helmholtz-muenchen.de/idg

Wer Visionen hat, soll zum Hausarzt gehen
Helmut Schmidt

Helmholtz Zentrum M�nchen
Deutsches Forschungszentrum f�r Gesundheit und Umwelt (GmbH)
Ingolst�dter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir�in B�rbel Brumme-Bothe
Gesch�ftsf�hrer: Prof. Dr. G�nther Wess und Dr. Nikolaus Blum
Registergericht: Amtsgericht M�nchen HRB 6466
USt-IdNr: DE 129521671
