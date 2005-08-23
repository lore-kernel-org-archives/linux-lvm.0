Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7NCkGV18543
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 08:46:16 -0400
Received: from mxs.tiscali.de (mxs.tiscali.de [62.27.59.134])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7NCkBHI021593
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 08:46:15 -0400
Received: from mail2.cc-dresden.de (port-212-202-119-51.static.qsc.de
	[212.202.119.51])
	by mxs.tiscali.de (Postfix) with ESMTP id 4CCF420A25
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 14:45:59 +0200 (CEST)
Received: from ccd3.CC.de (localhost.localdomain [127.0.0.1])
	by mail2.cc-dresden.de (8.11.6/8.11.6) with ESMTP id j7NEls029831
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 16:47:54 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 23 Aug 2005 14:45:58 +0200
Message-ID: <7AAD212492598A4A92463C3F5D34C54F0218C0@ccd3.CC.de>
From: "Heinzmann, Robert" <Heinzmann@cc-dresden.de>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] using LVM PV as single disk ? 
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
To: linux-lvm@redhat.com

Hello,
 
we are using LVM2. We have one PV configured with one VG and one LV on top. We now want to migrate back to "non LVM" configuration. Is it possible to convert a LVM PV back to a regular disk that can be used like a normal disk ? 
 
Regards, 
Robert 
