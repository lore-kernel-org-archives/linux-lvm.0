Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB72uur14953
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 21:56:56 -0500
Received: from desire.voip.primustel.com (_postfix@[208.219.5.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iB72unQW029541
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 21:56:54 -0500
Received: from cain (benway.cv.telegroup.com [10.40.41.175])
	by desire.voip.primustel.com (Postfix) with ESMTP id 841FE11C79
	for <linux-lvm@redhat.com>; Tue,  7 Dec 2004 02:37:14 +0000 (UTC)
From: Aran Cox <acox@ia.primustel.com>
Date: Mon, 06 Dec 2004 20:37:13 -0600
Message-Id: <1102387034.5390.13.camel@cain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove on the same PV
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

Is it possible to move an extent from one position to another on the
same PV?  It used to be possible under LVM1.  

The reason I ask is that a long time ago I wrote a sort of LVM
defrag/repacker program.  Basically it was a higher level interface to
the pvmove program.  I wrote it because when I would shrink a LV and
enlarge another on a mostly utilized VG the logical extents would end up
highly non-contiguous, especially after a few such re-organizations.  

In any case, I was updating it for LVM2 today and it seems that pvmove
refuses to move an extent from one position on a PV to another position
on the same PV.  I guess I can work around this but it means lots of
wasted moves.  Also, I'd be happy to share this tool if anyone's
remotely interested, once I've updated it for LVM2.


Thanks,
-- 
Aran Cox <acox@ia.primustel.com>
