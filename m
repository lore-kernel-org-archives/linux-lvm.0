Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A003C903AA
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2018 14:03:23 +0000 (UTC)
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D15A4D400E
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2018 14:03:12 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id c6-v6so1967807oiy.0
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2018 07:03:12 -0700 (PDT)
MIME-Version: 1.0
From: Damon Wang <damon.devops@gmail.com>
Date: Wed, 27 Jun 2018 22:03:00 +0800
Message-ID: <CABZYMH6HdrtYOb-eu1VOfUAMv+OqzzuP3VBviZLX=2M5WJTX-g@mail.gmail.com>
Subject: [linux-lvm] [lvmlockd] "Duplicate sanlock global locks" warned but
 not found in "lvmlockctl -i"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

  I found duplicate sanlock locks in lvm operation:

    [root@172-20-11-108 ~]# vgs
      Duplicate sanlock global locks should be corrected
      Duplicate sanlock global lock in VG 9e9e5a689750430daff18da75c9718cc
      Couldn't find device with uuid 7oDKl3-TvVY-Q24z-Q2BC-psUZ-SFCX-j1fhQE.
      Duplicate sanlock global lock in VG 8c32e39f49024e64832c1bc3fd15f948
      VG                               #PV #LV #SN Attr   VSize    VFree
      8c32e39f49024e64832c1bc3fd15f948   4  80   0 wz--ns <291.88g <263.32g
      9e9e5a689750430daff18da75c9718cc   3  55   0 wz-pns  739.93g <702.65g
      zstack                             1   2   0 wz--n-  <59.00g       0

while lvmlockctl -i:

    [root@172-20-11-108 ~]# lvmlockctl -i
    VG 8c32e39f49024e64832c1bc3fd15f948 lock_type=sanlock
npweb0-UQs8-hviS-PA8L-mOgI-eMDO-qY5OpK
    LS sanlock lvm_8c32e39f49024e64832c1bc3fd15f948
    LK VG un ver 229
    LK GL un ver 1
    LK LV un nvnmw0-WMeY-nm4V-zEfl-Dcpc-bGJr-rL8gpG
    LK LV sh hGVNWa-wwFx-SsQJ-Y6t4-UvPJ-CKEq-1CICng
    LK LV ex YtvSmz-Mo7H-gQnV-QfLp-Pb9P-HXpO-Fw3iDZ
    ... ...
    LK LV ex sUUEqr-B38J-Cktj-fky0-g5he-xS3o-wq9Lor
    LK LV ex k943Uw-du21-EOg0-F1t5-NKrH-aPof-Wt37Mi

    VG 9e9e5a689750430daff18da75c9718cc lock_type=sanlock
JBTlB1-fjbM-YpOc-6Qnt-Spxj-nEM4-oQaBCT
    LS sanlock lvm_9e9e5a689750430daff18da75c9718cc
    LK VG un ver 208
    LK LV sh rnb8Lc-XbBu-dqPn-kfNC-SsW4-F9KF-nK6fsu
    LK LV un YftJt5-1G9S-0icO-HkbU-7vqL-OPrZ-ppO8WO

It seems not harmful, but I don't know why it happen.

Thanks,
Damon
