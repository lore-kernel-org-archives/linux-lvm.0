Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9EI8IED032206
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2014 14:08:18 -0400
Received: from mta01.helmholtz-muenchen.de (mta01.helmholtz-muenchen.de
	[146.107.3.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9EI8FDQ011173
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2014 14:08:15 -0400
Received: from XCH22.scidom.de (xch22.helmholtz-muenchen.de [146.107.8.222])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta01.helmholtz-muenchen.de (Postfix) with ESMTP id 6A7843177C9
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2014 20:03:31 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Tue, 14 Oct 2014 20:08:14 +0200
Message-ID: <15785B7E063D464C86DD482FCAE4EBA501B7EB057A20@XCH11.scidom.de>
Content-Language: de-DE
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] kernel errors from a merging snapshot
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

i have a /-filesystem residing on a lv. I also had a snapshot of that lv because I tried some software. After testing the software I merged the snapshot into the origin, by rebooting. It seemed to went fine.
Btw: how do I know when merging is finished ? Where can I see results from the merging ?
But in /var/log/messages I have error messages about a block device:

Oct 14 16:22:45 vm59093-4 kernel: [    7.580247] Buffer I/O error on device dm-3, logical block 0
Oct 14 16:22:45 vm59093-4 kernel: [    7.580254] Buffer I/O error on device dm-3, logical block 1
Oct 14 16:22:45 vm59093-4 kernel: [    7.580258] Buffer I/O error on device dm-3, logical block 2
Oct 14 16:22:45 vm59093-4 kernel: [    7.580261] Buffer I/O error on device dm-3, logical block 3
Oct 14 16:22:45 vm59093-4 kernel: [    7.580264] Buffer I/O error on device dm-3, logical block 0
Oct 14 16:22:45 vm59093-4 kernel: [    7.580271] Buffer I/O error on device dm-3, logical block 9961471
Oct 14 16:22:45 vm59093-4 kernel: [    7.580274] Buffer I/O error on device dm-3, logical block 9961471
Oct 14 16:22:45 vm59093-4 kernel: [    7.580341] Buffer I/O error on device dm-3, logical block 0
Oct 14 16:22:45 vm59093-4 kernel: [    7.580345] Buffer I/O error on device dm-3, logical block 1

Dm-3 is the snapshot I merged (although I named it root-snapshot while creating, not root--snapshot !):

Dmsetup info says:

...
Name:              vg_1-root--snapshot
State:             ACTIVE
Read Ahead:        1024
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      252, 3
Number of targets: 1
UUID: LVM-ZfsXYr9bkOt1d9bMNpcrn7MxH2aX6H0bhELCnywHd7rbddry6f63xtkk1vqs1hvv
...

The errors appeared during the reboot. Is that normal ?


Bernd

--
Bernd Lentes

Systemadministration
Institut f�r Entwicklungsgenetik
Geb�ude 35.34 - Raum 208
HelmholtzZentrum m�nchen
bernd.lentes@helmholtz-muenchen.de
phone: +49 89 3187 1241
fax:   +49 89 3187 2294
http://www.helmholtz-muenchen.de/idg

Die Freiheit wird nicht durch weniger Freiheit verteidigt


Helmholtz Zentrum M�nchen
Deutsches Forschungszentrum f�r Gesundheit und Umwelt (GmbH)
Ingolst�dter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir�in B�rbel Brumme-Bothe
Gesch�ftsf�hrer: Prof. Dr. G�nther Wess, Dr. Nikolaus Blum, Dr. Alfons Enhsen
Registergericht: Amtsgericht M�nchen HRB 6466
USt-IdNr: DE 129521671
