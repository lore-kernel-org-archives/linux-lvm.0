Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n53GioXr013443
	for <linux-lvm@redhat.com>; Wed, 3 Jun 2009 12:44:50 -0400
Received: from nncore.ece.northwestern.edu (nncore.ece.northwestern.edu
	[129.105.8.7])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n53Gi95p007372
	for <linux-lvm@redhat.com>; Wed, 3 Jun 2009 12:44:09 -0400
Received: from m364d1.ece.northwestern.edu (m364d1.ece.northwestern.edu
	[129.105.6.180])
	by nncore.ece.northwestern.edu (Postfix) with ESMTP id 14B8714310
	for <linux-lvm@redhat.com>; Wed,  3 Jun 2009 11:44:09 -0500 (CDT)
Date: Wed, 3 Jun 2009 11:42:31 -0500
From: Zhengquan Zhang <zhang.zhengquan@gmail.com>
Message-ID: <20090603164231.GA23418@m364d1.ece.northwestern.edu>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm on a single big partition or just a single big
	partition?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello lvm list,

Though I have used lvm for some time, I have one question that I don't
understand.

For one harddrive I often create a /boot parition that is not lvm and
create a huge partition on the rest of the harddrive for PV of lvm. Now
I am thinking what is the difference between doing partition like this
and just a single big partition without lvm?

Thanks in advance,

-- 
Zhengquan
