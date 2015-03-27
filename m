Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2RBj90Q020681
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 07:45:09 -0400
Received: from mail1.deriva.de (mail1.deriva.de [62.146.116.28])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2RBj63i019495
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 07:45:07 -0400
Received: from zarafa.deriva.de (zarafa.internal.deriva.de [192.168.11.46])
	by mail1.deriva.de (Postfix) with ESMTP id 99AD814BA016
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 12:45:05 +0100 (CET)
From: =?iso-8859-15?Q?Christian_Schr=F6der?= <cs@deriva.de>
Date: Fri, 27 Mar 2015 12:45:05 +0100
Mime-Version: 1.0
In-Reply-To: <55153867.80501@lixium.fr>
References: <55153867.80501@lixium.fr>
Message-Id: <zarafa.551542c1.3c12.285b727e66d54380@zarafa.deriva.de>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm]
 =?iso-8859-15?q?LVM_crashed=2C_no_superblock_on_dozen?=
 =?iso-8859-15?q?s_of_LVs_even_after_vgcfgrestore?=
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
To: =?iso-8859-15?Q?LVM_general_discussion_and_development?= <linux-lvm@redhat.com>

Hi,
None of your DRBD devices seems to be in primary mode, so you probably cannot access them at all. (You could try reading the first block of one of your DRBD devices, e.g. "dd if=/dev/raidssd/drbd0 bs=512 count=1", which should also fail.)
You should be able to promote the ressources using "drbdadm primary xxx" with "xxx" being the name of the ressource. (I think you have to promote them one by one.) See http://drbd.linbit.com/users-guide-8.4/s-switch-resource-roles.html  for an explanation.
Normally, devices should be promoted when DRBD is started. Check if "become-primary-on" is set in your ressource configuration (e.g. /etc/drbd.d/foo.res). If you use some cluster management software, it should handle promotion and demotion of DRBD devices.

Kind regards,
Christian

------------------------------------------------------------
Deriva GmbH Financial IT and Consulting
Christian Schr�der
Gesch�ftsf�hrer
Hans-B�ckler-Stra�e 2 | D-37079 G�ttingen
Tel: +49 (0)551 489 500-42
Fax: +49 (0)551 489 500-91
http://www.deriva.de

Amtsgericht G�ttingen | HRB 3240
Gesch�ftsf�hrer: Christian Schr�der

-----Urspr�ngliche Nachricht-----
Von: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] Im Auftrag von Christophe
Gesendet: Freitag, 27. M�rz 2015 12:01
An: linux-lvm@redhat.com
Betreff: [linux-lvm] LVM crashed, no superblock on dozens of LVs even after vgcfgrestore

Hi,

I use LVM on Debian Wheezy, kernel 3.2.0-4-amd64, with several dozens of LVs.

Every attempt of mounting any of these LVs says : can't read superblock

I can't imagine than each of all theses LVs were corrupted at the same time.

There should be a common problem for that. But which one ??? FYI I'm using LVM -on-DRBD-on-LVM.
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

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
