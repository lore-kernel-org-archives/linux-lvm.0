Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j910F8V09171
	for <linux-lvm@redhat.com>; Fri, 30 Sep 2005 20:15:08 -0400
Received: from suede.reed.edu (suede.reed.edu [134.10.2.45])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j910F2kv028403
	for <linux-lvm@redhat.com>; Fri, 30 Sep 2005 20:15:03 -0400
Received: from imap.reed.edu (imap.reed.edu [134.10.2.10])
	by suede.reed.edu (8.13.4/8.13.4) with ESMTP id j910ExEt004168
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 30 Sep 2005 17:14:59 -0700
Received: from localhost (tristero.reed.edu [134.10.15.21])
	(authenticated bits=0)
	by imap.reed.edu (8.12.10/8.12.10) with ESMTP id j910EwS4016726
	for <linux-lvm@redhat.com>; Fri, 30 Sep 2005 17:14:59 -0700
Date: Fri, 30 Sep 2005 17:14:58 -0700
From: Ben Poliakoff <benp@reed.edu>
Message-ID: <20051001001458.GU29925@tristero.reed.edu>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] VFS lock patch and recent 2.4 kernels...
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

This must be in a FAQ somewhere, but I haven't found it yet.

Is the VFS lock patch is still required, to support lvm snapshots with
journaling filesystems, for current 2.4 kernels (i.e. 2.4.31)?   If the
patch *is* still required has anyone updated it for a recent 2.4
release?  

The most recent versions of the patch that I've found seemed to go up to
2.4.20.  Has the patch been merged with the vanilla 2.4 kernel?

Ben
