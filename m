Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j81CVqV25532
	for <linux-lvm@redhat.com>; Thu, 1 Sep 2005 08:31:52 -0400
Received: from esa-av-smtp1.gmessaging.net (esa-av-smtp1.gmessaging.net
	[194.51.201.22])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j81CVdq8010755
	for <linux-lvm@redhat.com>; Thu, 1 Sep 2005 08:31:45 -0400
Received: from esa-spas2.gmessaging.net (relay [172.24.21.38])
	by esa-av-smtp1.gmessaging.net
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IM500HNE1GEIB@esa-av-smtp1.gmessaging.net> for
	linux-lvm@redhat.com; Thu, 01 Sep 2005 14:31:26 +0200 (MEST)
Received: from localhost (esa-spas2 [127.0.0.1])	by esa-spas2.gmessaging.net
	(Postfix) with ESMTP id 638E0219E6E	for <linux-lvm@redhat.com>; Thu,
	01 Sep 2005 14:31:29 +0200 (CEST)
Received: from esa-spas2.gmessaging.net ([127.0.0.1])
	by localhost (esa-spas2 [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26580-08 for <linux-lvm@redhat.com>; Thu,
	01 Sep 2005 14:31:28 +0200 (CEST)
Received: from sciops-mailgw.vilspa.esa.int
	(sciops-mailgw.vilspa.esa.int [193.147.152.105])	by
	esa-spas2.gmessaging.net
	(Postfix) with ESMTP id 0A9CE219E5B	for <linux-lvm@redhat.com>; Thu,
	01 Sep 2005 14:31:28 +0200 (CEST)
Received: from iso.vilspa.esa.es (isous5.vilspa.esa.es [193.147.153.100])
	by sciops-mailgw.vilspa.esa.int (Postfix) with ESMTP id 2FED011FAC2	for
	<linux-lvm@redhat.com>; Thu, 01 Sep 2005 14:31:28 +0200 (CEST)
Received: from isol17.vilspa.esa.int
	(IDENT:U2FsdGVkX18UOgXZLygxHfymJWP/qUKmH4TKsq5cmB8@isol17.vilspa.esa.int
	[193.147.153.52])	by iso.vilspa.esa.es (8.12.10/8.12.10)
	with ESMTP id j81CVRHD021152	for <linux-lvm@redhat.com>; Thu,
	01 Sep 2005 14:31:28 +0200 (MEST)
Date: Thu, 01 Sep 2005 14:31:27 +0200
From: Ruben Alvarez Timon <Ruben.Alvarez@sciops.esa.int>
Message-id: <1125577887.15379.168.camel@isol17.vilspa.esa.int>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] problems when moving a volume group to a new system
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


Hi there,

we are in the process of moving a volume group to a new server. We have
done the unmount/vgchange/vgexport sequence following the LVM_HOWTO but
something must have gone wrong because now when trying to import the
volume group we get:

vgimport -v fibre_vg /dev/sdc /dev/sdd
vgimport -- locking logical volume manager
vgimport -- checking volume group name
vgimport -- checking volume group "fibre_vg" existence
vgimport -- trying to read physical volumes
vgimport -- checking for duplicate physical volumes
vgimport -- checking physical volume name "/dev/sdc"
vgimport -- reading data of physical volume "/dev/sdc" from disk
vgimport -- checking for exported physical volume "/dev/sdc"
vgimport -- checking consistency of physical volume "/dev/sdc"
vgimport -- ERROR "pv_check_consistency(): PE size" checking physical
volume consistency of "/dev/sdc"
vgimport -- checking for duplicate physical volumes
vgimport -- checking physical volume name "/dev/sdd"
vgimport -- reading data of physical volume "/dev/sdd" from disk
vgimport -- checking for exported physical volume "/dev/sdd"
vgimport -- checking consistency of physical volume "/dev/sdd"
vgimport -- reallocating memory
vgimport -- reading exported volume group data  of "fibre_vg" from disk
(s)
vgimport -- only found 0 of 800 LEs for LV /dev/fibre_vg/clusterware_lv
(0)
vgimport -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" reading
data of volume group "fibre_vg"

The output of pvscan is:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdc"  is in EXPORTED VG "fibre_vg" [0 / 0
free]
pvscan -- inactive PV "/dev/sdd"  is in EXPORTED VG "fibre_vg" [1.18
TB / 1.18 TB free]
pvscan -- total: 2 [1.18 TB] / in use: 2 [1.18 TB] / in no VG: 0 [0]

Could anyone please give us a hand with it ?

Thanks a lot in advance,

Ruben
