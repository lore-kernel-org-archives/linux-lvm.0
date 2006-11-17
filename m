Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAH1qmwY018538
	for <linux-lvm@redhat.com>; Thu, 16 Nov 2006 20:52:48 -0500
Received: from m5-81.163.com (m5-81.163.com [202.108.5.81])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	kAH1qioj031819
	for <linux-lvm@redhat.com>; Thu, 16 Nov 2006 20:52:45 -0500
Date: Fri, 17 Nov 2006 09:52:46 +0800
From: "=?gb2312?B?y87V8buq?=" <songzhh81@163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <455D15EF.06AC98.06410>
Subject: [linux-lvm] how to config or change dmsetup table
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
To: linux-lvm <linux-lvm@redhat.com>

When I create a logical volume, I don't know how its les map to pes of pvs, and which sectors are used, I must(as far as I know) "# dmsetup table" to see the Device Mapper table, even though I don't know where this table is.

Now I want to config or change the table, that means I hope I can decide which pes(then sectors) are used to create the lv. What should I do? Thanks!

	Song Zhenhua
	songzhh81@163.com
