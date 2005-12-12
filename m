Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBCH6E121706
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 12:06:14 -0500
Received: from hotmail.com (bay102-f7.bay102.hotmail.com [64.4.61.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBCH6CQt006315
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 12:06:13 -0500
Message-ID: <BAY102-F742936F0CFC6C5232220FEF460@phx.gbl>
From: "Christopher Probst" <probst_christopher@hotmail.com>
Date: Mon, 12 Dec 2005 17:06:06 +0000
Mime-Version: 1.0
Subject: [linux-lvm] cannot compile LVM2
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

I am fairly new to Linux, so please excuse the naivete of my question. I am 
trying to compile
LVM2.2.02.01 and I get the following compile error:

cache/lvmcache.c:178: error: `dm_hash_iterate_fn' undeclared (first use in 
this function)

What am I doing wrong?

Christopher
