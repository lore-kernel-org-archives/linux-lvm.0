Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9I61SV16979
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 02:01:28 -0400
Received: from mail-svr1.cs.utah.edu (mail-svr1.cs.utah.edu [155.98.64.200])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9I61O5K003428
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 02:01:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail-svr1.cs.utah.edu (Postfix) with ESMTP id 797E6346EC
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 00:01:14 -0600 (MDT)
Received: from mail-svr1.cs.utah.edu ([127.0.0.1])
	by localhost (mail-svr1.cs.utah.edu [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 11538-05 for <linux-lvm@redhat.com>;
	Tue, 18 Oct 2005 00:01:13 -0600 (MDT)
Received: from coal12.cs.utah.edu (coal12.cs.utah.edu [155.98.67.42])
	by mail-svr1.cs.utah.edu (Postfix) with ESMTP id CADA9346D3
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 00:01:13 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by coal12.cs.utah.edu (Postfix) with ESMTP id 4E8AC8A1C4
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 00:01:13 -0600 (MDT)
Date: Tue, 18 Oct 2005 00:01:13 -0600 (MDT)
From: Prashanth Radhakrishnan <shanth@cs.utah.edu>
Message-ID: <Pine.LNX.4.61.0510172356470.18476@coal12.cs.utah.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Getting copied blocks listing from LVM2 Snapshots
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

Do LVM2 CoW snapshots provide some interface through which one can fetch 
the list of blocks which have been copied off from its parent ?

I tried looking on the web around but could not find it. Just wanted to 
check before I started to look at the source..

Appreciate any help.

thanks,
prashanth
