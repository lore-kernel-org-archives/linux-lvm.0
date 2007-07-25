Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6PGAZnW026988
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2007 12:10:35 -0400
Received: from smtp4-g19.free.fr (smtp4-g19.free.fr [212.27.42.30])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6PGAVbA022770
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2007 12:10:31 -0400
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 0D66D6F2E3
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2007 18:10:31 +0200 (CEST)
Received: from [192.168.0.1] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp4-g19.free.fr (Postfix) with ESMTP id D02886F252
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2007 18:10:30 +0200 (CEST)
Message-ID: <46A775F6.6000307@free.fr>
Date: Wed, 25 Jul 2007 18:10:30 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Strange messages on my Fedora Box
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi !
The context :
Fedora Core 7 on an X86-64  AMD Athlon 64x2 box.
lvm> version
   LVM version:     2.02.24 (2007-03-19)
   Library version: 1.02.17 (2007-01-29)
   Driver version:  4.11.0
lvm>
Kernel : 2.6.22.1-27.fc7
3 X 160 Gb disks with 4 primary partitions
the 3 last partitions in each disks make 3 VG : vgF32, vgF64 and vg-Ext.
I use LVM mirroring.
The vgF32 vg hold a FC7 32 bits version, vgF64 the FC7 64 bits version 
(the one I use now) and vg-Ext the home and various data.
Today, i ran lvs and get the following message.
I've nothing in the system message file nor in the dmesg ring.
/bott is an md made with the 2 first partitions of the 2 first disks and 
is fine.
Questions :
Is it serious ? What should I do ? How to recover ?
TIA
lvm> vgchange -a n vgF32
   0 logical volume(s) in volume group "vgF32" now active
lvm> lvs
   Failure parsing mirror status fraction: 3 disk 253:16 A
   Failure parsing mirror status fraction: 3 disk 253:16 A
   Failure parsing mirror status fraction: 3 disk 253:20 A
   Failure parsing mirror status fraction: 3 disk 253:20 A
   Failure parsing mirror status fraction: 3 disk 253:24 A
   Failure parsing mirror status fraction: 3 disk 253:24 A
   Failure parsing mirror status fraction: 3 disk 253:0 A
   Failure parsing mirror status fraction: 3 disk 253:0 A
   Failure parsing mirror status fraction: 3 disk 253:4 A
   Failure parsing mirror status fraction: 3 disk 253:4 A
   Failure parsing mirror status fraction: 3 disk 253:8 A
   Failure parsing mirror status fraction: 3 disk 253:8 A
   Failure parsing mirror status fraction: 3 disk 253:12 A
   Failure parsing mirror status fraction: 3 disk 253:12 A
   LV   VG     Attr   LSize  Origin Snap%  Move Log       Copy%
   CD   vg-Ext mwi-ao 12,00G                    CD_mlog
   Home vg-Ext mwi-ao 20,00G                    Home_mlog
   Root vg-Ext mwi-ao  5,00G                    Root_mlog
   lv1  vgF32  mwi--- 10,00G                    lv1_mlog
   lv2  vgF32  mwi---  4,00G                    lv2_mlog
   lv3  vgF32  mwi--- 10,00G                    lv3_mlog
   lv4  vgF32  mwi--- 10,00G                    lv4_mlog
   lv1  vgF64  mwi-ao 10,00G                    lv1_mlog
   lv2  vgF64  mwi-ao  4,00G                    lv2_mlog
   lv3  vgF64  mwi-ao 10,00G                    lv3_mlog
   lv4  vgF64  mwi-ao 10,00G                    lv4_mlog
lvm>
-- 
Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
S'il vous pla�t, aidez nous � conserver nos ressources,
recyclez vos �lectrons !
