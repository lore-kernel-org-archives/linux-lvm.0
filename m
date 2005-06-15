Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5F3A3u23706
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2005 23:10:03 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.204])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5F3A11l028089
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2005 23:10:01 -0400
Received: by wproxy.gmail.com with SMTP id 69so1590040wra
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2005 20:09:56 -0700 (PDT)
Message-ID: <40b6d52e050614200924204dcd@mail.gmail.com>
Date: Wed, 15 Jun 2005 11:09:56 +0800
From: huang mingyou <therods@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm lost one pv.
Reply-To: huang mingyou <therods@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

hello,all.
       I have a vg named mirror.include 3 pv,/dev/sdb,/dev/sdc,/dev/sdd.
and have a lv on the vg named mirror1.I haved format the mirror1 into ext3.
but now I lose the /dev/sdc.how can I restore the data on the /dev/sdb
and /dev/sdd?
