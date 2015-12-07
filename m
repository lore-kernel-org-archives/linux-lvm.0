Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB7FLEkO030957
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 7 Dec 2015 10:21:14 -0500
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.3.105])
	by mx1.redhat.com (Postfix) with ESMTPS id 9166A8E6E3
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 15:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 91E781412EC
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 16:21:10 +0100 (CET)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id MDq4wA1b8X3v for <linux-lvm@redhat.com>;
	Mon,  7 Dec 2015 16:21:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id EF30814217A
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 16:20:59 +0100 (CET)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IufSSgeP1X0E for <linux-lvm@redhat.com>;
	Mon,  7 Dec 2015 16:20:59 +0100 (CET)
Received: from mtaintp1.scidom.de (mtaintp1.scidom.de [146.107.8.104])
	by mtaextp1.scidom.de (Postfix) with ESMTPS id E2091142228
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 16:20:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id D7FBD1008B5
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 16:20:58 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zELpUtpE6fa1 for <linux-lvm@redhat.com>;
	Mon,  7 Dec 2015 16:20:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 527FE100902
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 16:20:58 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aTcDU7IF90ig for <linux-lvm@redhat.com>;
	Mon,  7 Dec 2015 16:20:58 +0100 (CET)
Received: from mbxp1.scidom.de (mbxp1.scidom.de [146.107.8.101])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 35ED41008B5
	for <linux-lvm@redhat.com>; Mon,  7 Dec 2015 16:20:58 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Mon, 7 Dec 2015 16:20:57 +0100 (CET)
Message-ID: <02c701d13102$e0027c90$a00775b0$@helmholtz-muenchen.de>
MIME-Version: 1.0
Content-Language: de
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] backup with snapshots - some principal questions
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
To: LVM Mailingliste <linux-lvm@redhat.com>

Hi,

i have several servers running different Linux distributions.
Our computing center provides a network-based backup solution
(Legato/EMC), which saves the disks every night. But when the servers run,
this backup is of course not consistent.
The servers are running a lvm configuration (/ on lv and /boot on a
physical partition).
My idea is to create a snapshot and mount it before the network backup
comes. When this is stored, my backup is consistent. I can configure the
networker client in such a manner that the "live" lv is not saved, just
the snapshot so that the server is not saved twice.
My questions:
Before I create a new snapshot, I'd like to remove the old one. Is there
something I have to take care of or can I just delete it using lvremove ?
No merging or s.th. like that before ?
What is if I'd like to apply the snapshot ? Which command do I have to use
for rolling back the system to a snapshot ?

Thanks.


Bernd

--
Bernd Lentes

Systemadministration
institute of developmental genetics
Geb�ude 35.34 - Raum 208
HelmholtzZentrum M�nchen
bernd.lentes@helmholtz-muenchen.de
phone: +49 (0)89 3187 1241
fax: +49 (0)89 3187 2294

Wer Visionen hat soll zum Hausarzt gehen
Helmut Schmidt

   

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir'in Baerbel Brumme-Bothe
Geschaeftsfuehrer: Prof. Dr. Guenther Wess, Dr. Nikolaus Blum, Dr. Alfons Enhsen
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671
