Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3PACBkQ002748
	for <linux-lvm@redhat.com>; Fri, 25 Apr 2008 06:12:11 -0400
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.191])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3PABxdl011944
	for <linux-lvm@redhat.com>; Fri, 25 Apr 2008 06:12:00 -0400
Received: by ti-out-0910.google.com with SMTP id 11so1425485tim.7
	for <linux-lvm@redhat.com>; Fri, 25 Apr 2008 03:11:58 -0700 (PDT)
Message-ID: <1cafab770804250311n1c530743h30cbd62e725f345f@mail.gmail.com>
Date: Fri, 25 Apr 2008 18:11:58 +0800
From: "Xinwei Hu" <hxinwei@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Patch to clvmd-openais.c again
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

  The attached patch is a try to make clvmd work correctly on openais stack.
It does 2 things.

1. The cpg_deliver_callback make a compare between target_nodeid and our_nodeid.
It turns out openais set target_nodeid to 0 sometimes. for
broadcasting ? I change
the behavior so that lvm will process_remote also on target_nodeid == 0

2. The joined_list passed to cpg_confchg_callback doesn't include the
already exist
nodes in the group, which leads to an incomplete node_hash. I simply
add all other
nodes in member_list to node_hash also.

  With this patch applied, clvmd works correctly with basic lvm commands now.

  Please kindly review this, and consider it for upstream.

  Thanks.
