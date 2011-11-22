Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pAMJM9sN023675
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2011 14:22:10 -0500
Received: from mta01.helmholtz-muenchen.de (mta01.helmholtz-muenchen.de
	[146.107.3.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAMJM8MM020653
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2011 14:22:08 -0500
Received: from XCH22.scidom.de (xch22.helmholtz-muenchen.de [146.107.8.222])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta01.helmholtz-muenchen.de (Postfix) with ESMTP id 6771F31742C
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2011 19:22:02 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Tue, 22 Nov 2011 20:22:06 +0100
Message-ID: <15785B7E063D464C86DD482FCAE4EBA5014D7BEF090B@XCH11.scidom.de>
Content-Language: de-DE
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] new to cLVM - some principal questions
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

i have a bit experience in LVM, but not in cLVM. So i have some principal questions:
My idea is to establish a HA-Cluster with two nodes. The ressources which are managed by the cluster are virtual machines (KVM).
I have a FC SAN, where the vm's will reside. I want to create vdisks in my SAN which are integrated as a PV in both hosts. On top of the PV's i will create a VG, and finally LV's. For each VM one LV.

How are things going with cLVM ? Do i have to create PV ==> VG ==> LV seperately ? Or does cLVM replicate the information from one host to the other ? So that i have to create PV, VG and LV only once on the first node and this configuration is replicated to the second host.

What is about e.g. resizing a LV ? Is this replicated, or do i have to resize twice, on each host ?

E.g. one host is running VM3 in the corresponding lv3 on the first host. Is the second host able to access lv3 simultaneously or is there a kind of locking ?

Is it possible to run some vm's on the first host and others on the second (as a kind of load-balancing) ?

Is it possible to perform a live-migration from one host to the other in this scenario ?

I will not install a filesystem in the lv's, because i got recommendations to run the vm's in bare partitions, this would be faster.


Thanks for any eye-opening answer.


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

Es gibt nur eines, was auf Dauer teuerer ist, als in die Bildung zu investieren: Nicht in die Bildung zu investieren
John F. Kennedy

Helmholtz Zentrum M�nchen
Deutsches Forschungszentrum f�r Gesundheit und Umwelt (GmbH)
Ingolst�dter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir�in B�rbel Brumme-Bothe
Gesch�ftsf�hrer: Prof. Dr. G�nther Wess und Dr. Nikolaus Blum
Registergericht: Amtsgericht M�nchen HRB 6466
USt-IdNr: DE 129521671
