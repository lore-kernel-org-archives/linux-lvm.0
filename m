Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5DGGw1t004303
	for <linux-lvm@redhat.com>; Thu, 13 Jun 2013 12:16:58 -0400
Received: from m13-138.163.com (m13-138.163.com [220.181.13.138])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5DGGrUk025916
	for <linux-lvm@redhat.com>; Thu, 13 Jun 2013 12:16:53 -0400
Date: Fri, 14 Jun 2013 00:16:48 +0800 (CST)
From: lihuiba <magazine.lihuiba@163.com>
Content-Type: multipart/alternative; 
	boundary="----=_Part_226961_571929217.1371140208339"
MIME-Version: 1.0
Message-ID: <16dd71d1.f00b.13f3e5336d3.Coremail.magazine.lihuiba@163.com>
Subject: [linux-lvm] LVM high availability
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

------=_Part_226961_571929217.1371140208339
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit

Please consider the following case:
there are multiple storage servers each configured as LVM on top of a RAID,
and the servers are connected by DRBD to synchronize the RAIDs.


The question is
1) can I safely active a read-only volume on all of the servers?
2) can I safely active a read-write volume on a randomly chosen server? 
3) how about thin pool and volumes?


Thank you!
------=_Part_226961_571929217.1371140208339
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: 7bit

<div style="line-height:1.7;color:#000000;font-size:14px;font-family:arial">Please consider the following case:<div>there are multiple storage servers each configured as LVM on top of a RAID,</div><div>and the servers are connected by DRBD to synchronize the RAIDs.</div><div><br></div><div>The question is</div><div>1) can I safely active a read-only volume on all of the servers?</div><div>2) can I safely active a read-write volume on a randomly chosen server?&nbsp;</div><div>3) how about thin pool and volumes?</div><div><br></div><div>Thank you!</div></div>
------=_Part_226961_571929217.1371140208339--
