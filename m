Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i82LgD314552
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 17:42:13 -0400
Received: from relay04.roc.ny.frontiernet.net (relay04.roc.ny.frontiernet.net
	[66.133.131.37])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i82Lg7Li000983
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 17:42:08 -0400
Received: from filter02.roc.ny.frontiernet.net
	(filter02.roc.ny.frontiernet.net [66.133.131.177])
	by relay04.roc.ny.frontiernet.net (Postfix) with ESMTP id 79C0BFEDB
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2004 21:42:07 +0000 (UTC)
Received: from relay04.roc.ny.frontiernet.net ([66.133.131.37])
	by filter02.roc.ny.frontiernet.net (filter02.roc.ny.frontiernet.net
	[66.133.131.177]) (amavisd-new, port 10024)
	with LMTP id 10603-51-74 for <linux-lvm@redhat.com>;
	Thu, 2 Sep 2004 21:42:07 +0000 (UTC)
Received: from [10.7.31.1] (208-187-82-90.dsl1.chi.il.frontiernet.net
	[208.187.82.90])
	by relay04.roc.ny.frontiernet.net (Postfix) with ESMTP id 2E022FED7
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2004 21:42:06 +0000 (UTC)
From: Dan Fleischer <dan.fleischer@bank-and-trust.com>
Message-Id: <1094161325.2396.22.camel@lnx2k>
Mime-Version: 1.0
Date: Thu, 02 Sep 2004 16:42:05 -0500
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] fc2 & lvm2 MAX LV
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
To: linux-lvm@redhat.com

From "On Fri, Mar 26, 2004 at 10:16:44AM -0600, AJ Lewis wrote:"
<snip>
The PE size limitation isn't present in lvm2 (The version of lvm that works
in 2.6) if you use the native lvm2 format.  So you should be able to create
larger than 2TB LVs with LVM2.  Just FYI.
------------------
I recently setup a test box with FC1 and lvm1 with a PE size of 32MB
yielding a MAX LV of 2TB.  I then installed FC2 on that box, thinking
that if I were to specify PE of 64MB I could get a 4TB limit.

However, running vgdisplay seems to be telling me that I only have
a MAX LV of 255 GB, as follows:
# vgdisplay
  --- Volume group ---
  VG Name               Volume00
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                2
  Open LV               2
  Max PV                255
  Cur PV                2
  Act PV                2
  VG Size               220.50 GB
  PE Size               64.00 MB
  Total PE              3528
  Alloc PE / Size       3526 / 220.38 GB
  Free  PE / Size       2 / 128.00 MB

What does this mean?  Do I have more LV space available, but it only
tells me what my current limit is based on installed drives?

Should I reinstall with at smaller, and presumably more efficient,
PE Size?
-- 
Dan Fleischer
Bank & Trust Co.
PO Box 467
900 W. Main St.
Carlinville, IL 62626

Ph. 217-854-3554
Fax 217-854-3244
http://www.bank-and-trust.com
