Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 946E85D961
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 13:00:12 +0000 (UTC)
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.103.20])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7063D655B
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 13:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id BB29C150715
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 15:00:07 +0200 (CEST)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 71HDviWmzQV9 for <linux-lvm@redhat.com>;
	Tue,  9 Apr 2019 15:00:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 3D8341506A9
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 15:00:07 +0200 (CEST)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QOlm0hd7JuB1 for <linux-lvm@redhat.com>;
	Tue,  9 Apr 2019 15:00:07 +0200 (CEST)
Received: from mtaintp1.scidom.de (mtaintp1.scidom.de [146.107.8.104])
	by mtaextp1.scidom.de (Postfix) with ESMTPS id 16234150563
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 15:00:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 022A5102C2A
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 15:00:06 +0200 (CEST)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id t-F4_vmS9R-y for <linux-lvm@redhat.com>;
	Tue,  9 Apr 2019 15:00:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 69460102C2C
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 15:00:06 +0200 (CEST)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iWMrYJZxuf9z for <linux-lvm@redhat.com>;
	Tue,  9 Apr 2019 15:00:06 +0200 (CEST)
Received: from mbxp1.scidom.de (mbxp1.scidom.de [146.107.8.101])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 42BDD102C2A
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 15:00:06 +0200 (CEST)
Date: Tue, 9 Apr 2019 15:00:05 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <1674381816.392064.1554814805982.JavaMail.zimbra@helmholtz-muenchen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] can't remove snapshot
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
To: "LVM Mailingliste, (RedHat)" <linux-lvm@redhat.com>

Hello list,

I have a two-node HA-cluster which uses local and cluster LVM.
cLVM is currently stopped, I try to remove a snapshot from the root lv which 
is located on a local VG.
I get this error:
ha-idg-2:/mnt/spp # lvremove -fv vg_local/lv_snap_pre_sp4
  connect() failed on local socket: No such file or directory
  Internal cluster locking initialisation failed.
  WARNING: Falling back to local file-based locking.
  Volume Groups with the clustered attribute will be inaccessible.
    Archiving volume group "vg_local" metadata (seqno 26).
    Removing snapshot volume vg_local/lv_snap_pre_sp4.
    Loading table for vg_local-lv_root (254:8).
  device-mapper: reload ioctl on  (254:8) failed: Invalid argument
  Failed to refresh lv_root without snapshot.

dmesg says: 
device-mapper: ioctl: can't change device type after initial table load

My LV's:
...
  --- Logical volume ---
  LV Path                /dev/vg_local/lv_root
  LV Name                lv_root
  VG Name                vg_local
  LV UUID                t79QZ8-0zYm-Qrwd-di2B-BMOb-pN1g-LssjEF
  LV Write Access        read/write
  LV Creation host, time ha-idg-2, 2018-08-06 16:52:56 +0200
  LV snapshot status     source of
                         lv_snap_pre_sp4 [active]
  LV Status              available
  # open                 1
  LV Size                100.00 GiB
  Current LE             3200
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           254:8

  --- Logical volume ---
  LV Path                /dev/vg_local/lv_snap_pre_sp4
  LV Name                lv_snap_pre_sp4
  VG Name                vg_local
  LV UUID                RANlNE-Yz9O-BICs-XXWf-DNtF-d1kQ-Covks3
  LV Write Access        read/write
  LV Creation host, time ha-idg-2, 2019-01-15 11:05:44 +0100
  LV snapshot status     active destination for lv_root
  LV Status              available
  # open                 0
  LV Size                100.00 GiB
  Current LE             3200
  COW-table size         50.00 GiB
  COW-table LE           1600
  Allocated to snapshot  12.04%
  Snapshot chunk size    4.00 KiB
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           254:10

I never experienced this before and don't have any clue what's going wrong.
Help is much appreciated.

Many thanks.

Bernd


-- 

Bernd Lentes 
Systemadministration 
Institut für Entwicklungsgenetik 
Gebäude 35.34 - Raum 208 
HelmholtzZentrum münchen 
bernd.lentes@helmholtz-muenchen.de 
phone: +49 89 3187 1241 
phone: +49 89 3187 3827 
fax: +49 89 3187 2294 
http://www.helmholtz-muenchen.de/idg 

wer Fehler macht kann etwas lernen 
wer nichts macht kann auch nichts lernen
 

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Stellv. Aufsichtsratsvorsitzender: MinDirig. Dr. Manfred Wolter
Geschaeftsfuehrung: Prof. Dr. med. Dr. h.c. Matthias Tschoep, Heinrich Bassler, Kerstin Guenther
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671
