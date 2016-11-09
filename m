Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA9CHEgK027334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 9 Nov 2016 07:17:14 -0500
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE09D3B707
	for <linux-lvm@redhat.com>; Wed,  9 Nov 2016 12:17:13 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p190so304398291wmp.1
	for <linux-lvm@redhat.com>; Wed, 09 Nov 2016 04:17:13 -0800 (PST)
MIME-Version: 1.0
From: Lorenzo Dalrio <lorenzo.dalrio@gmail.com>
Date: Wed, 9 Nov 2016 13:16:51 +0100
Message-ID: <CAFQqb_GcXvCKAXgGGJvb03MiKyzQWP4RRjyRYurMMynPdgBGXA@mail.gmail.com>
Subject: [linux-lvm] pvmove launched on inactive vg
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,
we have a 2-node cluster with some ha-lvm resources on it. Storage
folks asked us to migrate the lun where those vgs are. They provided
us with new luns of the same size.
We followed a standard procedure of

pvcreate /dev/mapper/new_lun
vgextend vg /dev/mapper/new_lun
pvmove /dev/mapper/old_lun /dev/mapper/new_lun

Here is the problem: some vgs were active on a node and some other vgs
where active on the other node. We have run pvmove for all the vgs on
the first node that completed its active vgs without problem, but left
the other in a intermediate state where pvmove detects the move in
progress but doesn't seem to proceed.

here is the output of lvs -av:

    Found same device /dev/mapper/vPLONE07 with same pvid
WH6unuymepW89nwmSLqweMPTUoeypLlW
    Found same device /dev/mapper/vPLONE06 with same pvid
mnK6EtFiLH2G5yMLSZ0179zKGdERxQI1
    Found same device /dev/mapper/vPLONE07 with same pvid
WH6unuymepW89nwmSLqweMPTUoeypLlW
    Found same device /dev/mapper/vd_PLONE_05 with same pvid
gsfXREbuaXiTj96U72Mia9UPJOGwuvxo
    Found same device /dev/mapper/vPLONE05 with same pvid
QXEsmAhzG2iFa05LfFE5kl40H8UoV6UG
    Found same device /dev/mapper/vPLONE06 with same pvid
mnK6EtFiLH2G5yMLSZ0179zKGdERxQI1
    Found same device /dev/mapper/vd_PLONE_04 with same pvid
Jkc3DYEbNAkQwvfH8HBar0BfMy56p68U
    Found same device /dev/mapper/vPLONE04 with same pvid
C0bLL0ka1j0a8msqs6h9RKOgxWfWAVtj
    Found same device /dev/mapper/vPLONE05 with same pvid
QXEsmAhzG2iFa05LfFE5kl40H8UoV6UG
    Found same device /dev/mapper/vd_PLONE_05 with same pvid
gsfXREbuaXiTj96U72Mia9UPJOGwuvxo
    Found same device /dev/mapper/vd_PLONE_03 with same pvid
cMoQ7J4qkihBUwWSPB13Wd7QkcXQlN7J
    Found same device /dev/mapper/vPLONE03 with same pvid
spC75FaZhB5l5cx1CoMtB8MO0gkSqb2r
    Found same device /dev/mapper/vd_PLONE_04 with same pvid
Jkc3DYEbNAkQwvfH8HBar0BfMy56p68U
    Found same device /dev/mapper/vPLONE04 with same pvid
C0bLL0ka1j0a8msqs6h9RKOgxWfWAVtj
    Found same device /dev/mapper/vd_PLONE_02 with same pvid
odB8kFMhlcP8UdPc7aLBsUPqM4eKRZ2H
    Found same device /dev/mapper/vPLONE02 with same pvid
bzttEe6Z0YGLfZzdvvDFUozk7MsM1mmn
    Found same device /dev/mapper/vPLONE03 with same pvid
spC75FaZhB5l5cx1CoMtB8MO0gkSqb2r
    Found same device /dev/mapper/vd_PLONE_03 with same pvid
cMoQ7J4qkihBUwWSPB13Wd7QkcXQlN7J
    Found same device /dev/mapper/vd_PLONE_01 with same pvid
LQ5X7UYOAW3ILCBH5Yv7np32zQrxd1cd
    Found same device /dev/mapper/vPLONE01 with same pvid
2V2lLklWhZDSh1hdYzPsfqs9kEp9pVfR
    Found same device /dev/mapper/vd_PLONE_02 with same pvid
odB8kFMhlcP8UdPc7aLBsUPqM4eKRZ2H
    Found same device /dev/mapper/vPLONE02 with same pvid
bzttEe6Z0YGLfZzdvvDFUozk7MsM1mmn
    Found same device /dev/sda2 with same pvid JYCsWcY7TjLh0UbDjjnwm2kU70itCLia
    Found same device /dev/mapper/vd_PLONE_01 with same pvid
LQ5X7UYOAW3ILCBH5Yv7np32zQrxd1cd
    Found same device /dev/mapper/vPLONE01 with same pvid
2V2lLklWhZDSh1hdYzPsfqs9kEp9pVfR
  LV            VG            #Seg Attr       LSize   Maj Min KMaj
KMin Pool Origin Data%  Meta%  Move                    Cpy%Sync Log
Convert LV UUID                                LProfile
  root          centos           1 -wi-ao----  40.54g  -1  -1  253
0
  BCGuH9-3669-xwV1-o541-XfyY-m2hI-Ulde9F
  swap          centos           1 -wi-ao----   4.56g  -1  -1  253
1
  0MKiBs-XuBd-3yUw-eXpr-7Ofj-Cva8-o0c6JY
  lv_assemblea  vg_assemblea     1 -wi-ao----  50.00g  -1  -1  253
10
   NxHrKd-RbGz-bnXW-7LQE-A4kS-2mIB-JZU2hk
  lv_bur        vg_bur           1 -wI-------  40.00g  -1  -1   -1
-1
   Mg67Sx-ke62-n3Q9-CWqO-e7Zo-R9pc-BQMhRE
  [pvmove0]     vg_bur           1 p-C---m---  40.00g  -1  -1   -1
-1                           /dev/mapper/vd_PLONE_01
   ILbHqP-IOlz-e4e9-eThD-QwGd-D7Z4-KOzsmL
  lv_ermes      vg_ermes         1 -wI-------  40.00g  -1  -1   -1
-1
   DZTKAk-X047-eOai-rpDp-Uciw-CxUr-uCgOZC
  [pvmove0]     vg_ermes         1 p-C---m---  40.00g  -1  -1   -1
-1                           /dev/mapper/vd_PLONE_03
   NOV7rE-rWbI-msda-53LT-d9tk-cutV-K2ok6s
  lv_geoportale vg_geoportale    1 -wi-ao----  10.00g  -1  -1  253
9
  I1YWt5-sHZu-fEl6-qeW2-JDlw-NHWB-jAHp0m
  lv_groupware  vg_groupware     1 -wI-------  10.00g  -1  -1   -1
-1
   a10Lpj-2Ni7-RzNA-Nf8p-3LnT-4mYh-spTIyj
  [pvmove0]     vg_groupware     1 p-C---m---  10.00g  -1  -1   -1
-1                           /dev/mapper/vd_PLONE_05
   0MVtil-lIF2-p4lu-2ZhZ-FYb8-ojdq-PmygpF
  lv_internos   vg_internos      1 -wI-------  40.00g  -1  -1   -1
-1
   cZEwfL-kZ4G-vKLy-92aX-KKOW-IFkj-Ne0VdR
  [pvmove0]     vg_internos      1 p-C---m---  40.00g  -1  -1   -1
-1                           /dev/mapper/vd_PLONE_02
   Yh9UrO-BF42-ETkw-mFxr-VDHE-s6He-dLfX1l
  lv_portali    vg_portali       1 -wI------- 300.00g  -1  -1   -1
-1
   IvfQsy-8XAF-qT7D-X52j-cR11-egyL-3WHlMf
  [pvmove0]     vg_portali       1 p-C---m--- 300.00g  -1  -1   -1
-1                           /dev/mapper/vd_PLONE_04
   cGkqJx-0R7h-at97-E8yt-BCwA-ljCm-p8rcRj



Any advice on how to proceed?

Thank you,

-- 
Lorenzo Dalrio
