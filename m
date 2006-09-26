Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8QDTRON007228
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 09:29:27 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.225])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8QDSLih013013
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 09:29:21 -0400
Received: by wx-out-0506.google.com with SMTP id i30so4017583wxd
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 06:29:21 -0700 (PDT)
Message-ID: <625ccb870609260629h3d428bd8hf6c80cca577028ee@mail.gmail.com>
Date: Tue, 26 Sep 2006 21:29:21 +0800
From: "bowen zheng" <linuzboy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Help, lv status inactive Original and inactive Snapshot
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
To: linux-lvm@redhat.com

Everything seems to work fine. But I found this


shell> lvscan
  /dev/diskvg/lvsnapshot: read failed after 0 of 4096 at 0: Input/output error
..................
  inactive Original '/dev/diskvg/rootlv' [2.92 GB] inherit
  inactive Snapshot '/dev/diskvg/lvsnapshot' [100.00 MB] inherit
........

How can I active the rootlv and lvsnapshort. And what does the inactive mean?

When I mount the lvsnapshort, and backup it. It always shows many IO
errors (both use tar and rsync).  How do I backup the lvsnapshort.


Thanks....
