Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i436hBv16887
	for <linux-lvm@redhat.com>; Mon, 3 May 2004 02:43:11 -0400
Received: from neuralscape.com (synapse.neuralscape.com [198.144.200.82])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i436hB99025695
	for <linux-lvm@redhat.com>; Mon, 3 May 2004 02:43:11 -0400
Received: from shaeffer by neuralscape.com with local (Exim 4.12)
	id 1BKX9R-0000KI-00
	for linux-lvm@redhat.com; Sun, 02 May 2004 23:42:05 -0700
Date: Sun, 2 May 2004 23:42:05 -0700
From: Karen Shaeffer <shaeffer@neuralscape.com>
Message-ID: <20040503064205.GB1230@synapse.neuralscape.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] snapshot with 2.6.5 kernel
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hello,

I am running a patched 2.6.5 kernel and using lvm2. Everything
looks ok, but the snapshot may be having problems. Else I just
may be ignorant about how to use the snapshot.

Here is what I am doing on a generic X86 server. I create a logical
volume group out of a number of PEs that are properly configured. Then I
create a logical volume. Then I start to dump a very large tar file
into the logical volume. As this tar file is inflating the files into
the logical volume, I then simultaneously create a snapshot volume of
the recently created logical volume. The very large tar archive that
was in the process of inflating its contents continues for a while,
but finally just crashes and hangs at some point.

Am I missunderstanding how to use snapshot here? Or is this just
severly broken software? Any advise is appreciated.

Thanks,
Karen
-- 
 Karen Shaeffer
 Neuralscape, Palo Alto, Ca. 94306
 shaeffer@neuralscape.com  http://www.neuralscape.com
