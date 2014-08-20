Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7KFRuRQ016874
	for <linux-lvm@redhat.com>; Wed, 20 Aug 2014 11:27:56 -0400
Received: from mta01.helmholtz-muenchen.de (mta01.helmholtz-muenchen.de
	[146.107.3.101])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7KFRrT0019565
	for <linux-lvm@redhat.com>; Wed, 20 Aug 2014 11:27:54 -0400
Received: from XCH22.scidom.de (xch22.helmholtz-muenchen.de [146.107.8.222])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mta01.helmholtz-muenchen.de (Postfix) with ESMTP id 8F2273176E6
	for <linux-lvm@redhat.com>; Wed, 20 Aug 2014 17:24:13 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Date: Wed, 20 Aug 2014 17:27:52 +0200
Message-ID: <15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F1@XCH11.scidom.de>
Content-Language: de-DE
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] problem with lvcreate and redirection of stdout/stderr
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

Hi ML,

i'm writing a script to update my servers. Before updating, i'd like to create a snapshot of the root-directory (/). If something goes wrong with the update, I have a consistent backup.
I try to redirect stdout and stderr to a logfile for being able to check everything afterwards. The redirection has problems with lvcreate.
This is my script (excerpt):

============================================================
lvremove -fv /dev/vg1/lv_root_snapshot &> /var/log/update.log

lvcreate -v -L 45G -n lv_root_snapshot -s vg1/lv_root >> /var/log/update.log 2>&1

zypper -n up -y -t patch  --skip-interactive >> /var/log/update.log 2>&1
============================================================

With the second line I try to create the lv and redirect stdout/stderr to a log file.
The whole system stop by executing the second line, this are the last lines in my log:

============================================================
lvcreate    Setting logging type to disk
lvcreate    Setting chunksize to 8 sectors.
lvcreate    Finding volume group "vg1"
lvcreate    Archiving volume group "vg1" metadata (seqno 99).
lvcreate    Creating logical volume lv_root_snapshot
lvcreate    Creating volume group backup "/etc/lvm/backup/vg1" (seqno 100).
lvcreate    Found volume group "vg1"
lvcreate    activation/volume_list configuration setting not defined: Checking only host tags for vg1/lv_root_snapshot
lvcreate    Creating vg1-lv_root_snapshot
lvcreate    Loading vg1-lv_root_snapshot table (252:1)
lvcreate    Resuming vg1-lv_root_snapshot (252:1)
lvcreate    Clearing start of logical volume "lv_root_snapshot"
lvcreate    Creating logical volume snapshot0
lvcreate    Found volume group "vg1"
lvcreate    Found volume group "vg1"
lvcreate    Creating vg1-lv_root-real
lvcreate    Loading vg1-lv_root-real table (252:2)
lvcreate    Loading vg1-lv_root table (252:0)
lvcreate    Creating vg1-lv_root_snapshot-cow
lvcreate    Loading vg1-lv_root_snapshot-cow table (252:3)
lvcreate    Resuming vg1-lv_root_snapshot-cow (252:3)
lvcreate    Loading vg1-lv_root_snapshot table (252:1)
lvcreate    Suspending vg1-lv_root (252:0) with filesystem sync with device flush
===========================================================

I tried it several times, and the system always stop at this point. When I execute the same command manually in a shell no change. Stop.
Redirecting the lvremove command on a shell in the same manner is working fine:

lvremove -fv /dev/vg1/lv_root_snapshot >> /var/log/update.log 2>&1
system continues running.

lvcreate manually in a shell and only redirecting stdout is working fine:

lvcreate -v -L 45G -n lv_root_snapshot -s vg1/lv_root >> /var/log/update.log
system continues running

Only the combination of redirecting stdout and stderr to the logfile stops the system completely:
lvcreate -v -L 45G -n lv_root_snapshot -s vg1/lv_root >> /var/log/update.log 2>&1


Any ideas ?


my system:

SLES 11 SP3 64bit
vm58820-6:~ # lvm version
  LVM version:     2.02.98(2) (2012-10-15)
  Library version: 1.03.01 (2011-10-15)
  Driver version:  4.23.0
1 lv for the root-directory, /boot is a "real" partition
1pv, 1 vg

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
