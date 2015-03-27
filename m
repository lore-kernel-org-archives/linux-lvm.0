Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2RAxnrW023244
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 06:59:50 -0400
Received: from mx3.lixium.fr (mx2.lixium.fr [79.98.96.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2RAxjuc025146
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 06:59:47 -0400
Received: from [192.168.1.21] (nsg93-h01-31-34-69-35.dsl.sta.abo.bbox.fr
	[31.34.69.35]) (Authenticated sender:
	europeanservers-c.baegert-maildrop@mx3.lixium.fr)
	by mx3.lixium.fr (Postfix) with ESMTPSA id 059E8F03
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 11:59:42 +0100 (CET)
Message-ID: <55153867.80501@lixium.fr>
Date: Fri, 27 Mar 2015 12:00:55 +0100
From: Christophe <c.baegert-listes@lixium.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM crashed,
	no superblock on dozens of LVs even after vgcfgrestore
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I use LVM on Debian Wheezy, kernel 3.2.0-4-amd64, with several dozens of 
LVs.

Every attempt of mounting any of these LVs says : can't read superblock

I can't imagine than each of all theses LVs were corrupted at the same time.

There should be a common problem for that. But which one ??? FYI I'm 
using LVM -on-DRBD-on-LVM.
DBRD seems to be fine.

pvs
  PV                VG         Fmt  Attr PSize   PFree
   /dev/raidssd/drbd0 miroirtest lvm2 a--  124,99g   9,99g
   /dev/raidssd/drbd1 miroir1    lvm2 a--  899,97g      0
   /dev/raidssd/drbd2 miroir2    lvm2 a--  899,97g      0
   /dev/raidssd/drbd3 miroir1    lvm2 a--  899,97g      0
   /dev/raidssd/drbd4 miroir2    lvm2 a--  899,97g   9,99g
   /dev/raidssd/drbd5 miroir1    lvm2 a--  929,97g      0
   /dev/raidssd/drbd6 miroir2    lvm2 a--  929,97g   1,70g
   /dev/raidssd/drbd7 miroir1    lvm2 a--  929,97g  17,88g
   /dev/raidssd/drbd8 miroir2    lvm2 a--  935,96g 157,64g
   /dev/sda           raidssd    lvm2 a--    3,64t      0
   /dev/sdb           raidssd    lvm2 a--    3,64t      0


cat /proc/drbd
version: 8.3.11 (api:88/proto:86-96)
srcversion: 41C52C8CD882E47FB5AF767
  0: cs:Connected ro:Secondary/Primary ds:UpToDate/UpToDate A r-----
     ns:0 nr:0 dw:0 dr:0 al:0 bm:0 lo:0 pe:0 ua:0 ap:0 ep:1 wo:d oos:0
  1: cs:Connected ro:Secondary/Primary ds:UpToDate/UpToDate A r-----
     ns:0 nr:10990235 dw:10990235 dr:0 al:0 bm:178 lo:0 pe:0 ua:0 ap:0 
ep:1 wo:d oos:0
  2: cs:Connected ro:Secondary/Secondary ds:UpToDate/UpToDate A r-----
     ns:0 nr:0 dw:0 dr:0 al:0 bm:0 lo:0 pe:0 ua:0 ap:0 ep:1 wo:d oos:0
  3: cs:Connected ro:Secondary/Primary ds:UpToDate/UpToDate A r-----
     ns:0 nr:21387 dw:21387 dr:0 al:0 bm:6 lo:0 pe:0 ua:0 ap:0 ep:1 wo:d 
oos:0
  4: cs:Connected ro:Secondary/Secondary ds:UpToDate/UpToDate A r-----
     ns:0 nr:0 dw:0 dr:0 al:0 bm:0 lo:0 pe:0 ua:0 ap:0 ep:1 wo:d oos:0
  5: cs:Connected ro:Secondary/Primary ds:UpToDate/UpToDate A r-----
     ns:0 nr:2648 dw:2648 dr:0 al:0 bm:0 lo:0 pe:0 ua:0 ap:0 ep:1 wo:d oos:0
  6: cs:Connected ro:Secondary/Secondary ds:UpToDate/UpToDate A r-----
     ns:0 nr:0 dw:0 dr:0 al:0 bm:0 lo:0 pe:0 ua:0 ap:0 ep:1 wo:d oos:0
  7: cs:Connected ro:Secondary/Primary ds:UpToDate/UpToDate A r-----
     ns:0 nr:59829829 dw:59829829 dr:0 al:0 bm:93 lo:0 pe:0 ua:0 ap:0 
ep:1 wo:d oos:0
  8: cs:Connected ro:Secondary/Secondary ds:UpToDate/UpToDate A r-----
     ns:0 nr:0 dw:0 dr:0 al:0 bm:0 lo:0 pe:0 ua:0 ap:0 ep:1 wo:d oos:0

There was no error about that in the system logs.

Any idea about that ?

Regards,

-- 
Christophe
