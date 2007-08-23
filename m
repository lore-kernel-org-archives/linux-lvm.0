Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7N8vJ4a018836
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2007 04:57:20 -0400
Received: from bay0-omc2-s17.bay0.hotmail.com (bay0-omc2-s17.bay0.hotmail.com
	[65.54.246.153])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7N8vHGH031658
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2007 04:57:17 -0400
Message-ID: <BAY115-W274EC6B50C58F0EADF27EB85D60@phx.gbl>
From: Achievement <achievement.hk@hotmail.com>
Date: Thu, 23 Aug 2007 16:37:55 +0800
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-lvm] Guest os running with lvm under xen (lvm-backed vbd)
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com


Dear All,
I've installed CentOS5 and configured the system with Xen+LVM

All guest domain are installed in logical volume, lvm-backed vbd.
and the guest domain will also use lvm too.

My example.
1. Install centos5 with software raid (raid 1)
2. create pv, vg, lv on the md device
3. install guest domain (centos5) in one of the lv '/dev/VolGroup00/xen2vbd1'
4. the guest domain also use lvm, vg 'Xen1Vbd1VG00' created within the guest domain.

I can get the guest domain up and run correctly. 

and able to clone the guest domain by adding new lv and using dd

dd if=/dev/VolGroup00/xen2vbd1  of=/dev/VolGroup00/xen2vbd2

Then, i have several guest domain with same data.

After several add/delete action of the lv under domain-0 for testing and cloning guest domain.

I got the following error:

[root@xen2 ~]# pvs

  Couldn't find device with uuid '0gmklZ-HcGJ-Asv1-pkQz-guhK-bbY4-MJ24nq'.
  Couldn't find device with uuid '0gmklZ-HcGJ-Asv1-pkQz-guhK-bbY4-MJ24nq'.
Segmentation fault

[root@xen2 ~]# lvs


  Couldn't find device with uuid '0gmklZ-HcGJ-Asv1-pkQz-guhK-bbY4-MJ24nq'.
  Couldn't find all physical volumes for volume group Xen1Vbd1VG00.
  Couldn't find device with uuid '0gmklZ-HcGJ-Asv1-pkQz-guhK-bbY4-MJ24nq'.
  Couldn't find all physical volumes for volume group Xen1Vbd1VG00.
  Volume group "Xen1Vbd1VG00" not found
  LV        VG         Attr   LSize  Origin Snap%  Move Log Copy%
  LogVol00  VolGroup00 -wi-ao 14.62G
  xen2vbd1  VolGroup00 -wi-a-  8.00G
  xen2vbd2  VolGroup00 -wi-a-  8.00G

Any one face the similar error? and why lvm see the logical volume as a physical volumes?
or I should not use lvm in guest domain if i use lvm-backed vbd for xen?

Thanks.

Achievement




_________________________________________________________________
Messenger �� PC - to - PC ������ܥ\��A����~�ˤͧK�O�����~�q�ܡA�ǿ���K �X Messenger PC - to - PC ������� 
http://get.live.com/messenger/features 
