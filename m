Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2E4ohSD019741
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 00:50:43 -0400
Received: from m13-42.163.com (m13-42.163.com [220.181.13.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2E4oVoe013749
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 00:50:32 -0400
Date: Mon, 14 Mar 2011 12:50:31 +0800 (CST)
From: yue <ooolinux@163.com>
Message-ID: <4f81502d.9733.12eb2b37f56.Coremail.ooolinux@163.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_103393_824542013.1300078231382"
Subject: [linux-lvm] strange, vgcreate  no -c  options,
 but it can find  vg  on other node
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
To: linux-lvm <linux-lvm@redhat.com>

------=_Part_103393_824542013.1300078231382
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit

two nodes  share one lun  over ip-san, 
node1  create vg01 without -c
server1# vgcreate  vg01  /dev/sd*
node2 vgscan
server2# vgscan
it can find vg01 on server2
 
 
why?  i think   it is must to run clvmd, then  attach share lun ,then vgcreate/lvcreate/...
it is strange.
do you know why?
thanks
 
------=_Part_103393_824542013.1300078231382
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: 7bit

<DIV>two nodes&nbsp; share one lun&nbsp; over ip-san,&nbsp; </DIV>
<DIV>node1&nbsp; create vg01 without -c </DIV>
<DIV>server1# vgcreate&nbsp; vg01&nbsp; /dev/sd*</DIV>
<DIV>node2 vgscan </DIV>
<DIV>server2# vgscan </DIV>
<DIV>it can find vg01 on server2</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>why?&nbsp; i think&nbsp;&nbsp; it is must to run clvmd, then&nbsp; attach share lun ,then vgcreate/lvcreate/...</DIV>
<DIV>it is strange.</DIV>
<DIV>do you know why?</DIV>
<DIV>thanks</DIV>
<DIV>&nbsp; </DIV><br><br><span title="neteasefooter"><span id="netease_mail_footer"></span></span>
------=_Part_103393_824542013.1300078231382--
