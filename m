Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2A6Z8a0032601
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2010 01:35:08 -0500
Received: from m13-103.163.com (m13-103.163.com [220.181.13.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2A6Yp2G020798
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2010 01:34:52 -0500
Date: Wed, 10 Mar 2010 14:34:48 +0800 (CST)
From: "Busby.Cheung" <chaimvy@163.com>
Message-ID: <9a0cbd.10a11.12746c85c40.Coremail.chaimvy@163.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_177730_16917477.1268202888255"
Subject: [linux-lvm] lvm2's problem or device-mapper's?
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
To: linux-lvm@redhat.com

------=_Part_177730_16917477.1268202888255
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit

Hi All,
         I used 'lvcreate' cmd to create a logical-volume named 'lv-test', belongs to volume group 'vg00'.
        Then I gave the lv-test  big IO like:'dd if=/dev/zero of=/dev/mapper/lv-test bs=4K'.  while it was in this big IO, I use 'lvcreate' cmd to create a new lv using lv-test's vg 'vg00'. it take a long time to do it. I found it finish util the 'dd' ended.
        Is it caused by some functions like 'suspend'  in VG, the IO suspend  can't be done in a very quick way?
       I don't know what cause the problem, 'lvcreate' a new LV very slowly while big IO on another LV in the same VG.
      Anyone can help me? Thank you very much.
 
best regards,
Bubsy Cheung
         
------=_Part_177730_16917477.1268202888255
Content-Type: text/html; charset=gbk
Content-Transfer-Encoding: 7bit

<DIV>Hi All,</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I used 'lvcreate' cmd to create a logical-volume named 'lv-test', belongs to volume group 'vg00'.</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Then I&nbsp;gave the lv-test &nbsp;big&nbsp;IO like:'dd if=/dev/zero of=/dev/mapper/lv-test bs=4K'.&nbsp; while it was in this big IO, I use 'lvcreate' cmd to create a new lv using lv-test's vg 'vg00'. it take a long time to do it. I found it finish util the 'dd' ended.</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Is it caused by some functions like 'suspend'&nbsp; in VG, the IO suspend&nbsp; can't be done in a very quick way?</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I don't know what cause the problem, 'lvcreate' a new LV very slowly while big IO on another LV in the same VG.</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Anyone can help me? Thank you very much.</DIV>
<DIV>&nbsp;</DIV>
<DIV>best regards,</DIV>
<DIV>Bubsy Cheung</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </DIV><br><br><span title="neteasefooter"/></span>
------=_Part_177730_16917477.1268202888255--
