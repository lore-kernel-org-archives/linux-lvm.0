Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9BHmCr18883
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 13:48:12 -0400
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9BHm1n9032713
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 13:48:06 -0400
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
Message-Id: <1097516869.8133.259.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Date: Mon, 11 Oct 2004 10:47:49 -0700
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2: 16 terrabyte barrier?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


Can LVM2, as shipped with say, FC2, RHEL 4 beta, or SuSe 9.1, break the
16 terrabyte barrier without patching?

(I believe that the linux 2.6.x pagecache has a 16 terrabyte limit?  If
true, then perhaps part of the question is "Does LVM2 go through the
page cache?")

Thanks!

-- 
Dan Stromberg DCS/NACS/UCI <strombrg@dcs.nac.uci.edu>
