Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9E1DAr32148
	for <linux-lvm@redhat.com>; Wed, 13 Oct 2004 21:13:10 -0400
Received: from webmail-outgoing.us4.outblaze.com
	(webmail-outgoing.us4.outblaze.com [205.158.62.67])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9E1D3ZR008057
	for <linux-lvm@redhat.com>; Wed, 13 Oct 2004 21:13:04 -0400
Received: from wfilter.us4.outblaze.com (wfilter.us4.outblaze.com
	[205.158.62.180])
	by webmail-outgoing.us4.outblaze.com (Postfix) with QMQP id
	A12A41801E55
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 01:12:52 +0000 (GMT)
Content-Disposition: inline
MIME-Version: 1.0
From: "Daniel ." <constantine@soon.com>
Date: Wed, 13 Oct 2004 20:12:50 -0500
Message-Id: <20041014011250.CF9EC164005@ws1-4.us4.outblaze.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How can I restripe LVs on addition of extra PVs?
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

Hi, 
 
[I'm only familiar with LVM1, so that's what I'm referring to in the rest of the mail.  I probably could move to LVM2 if it solves my problems.] 
 
I'm planning on using LVM to create LVs striped across multiple PVs (which, incidentally, are RAID 1 mirrorred partitions). 
In the future I will need to add extra PVs to the VG and extend the LVs. 
 
My question is 'what happens to the striping of the LV in this situation?' 
I could only find very limited info in man/archives/web.  From it I inferred that LVM will not automatically restripe the LV, and it doesn't seem easy to do manually.   
Indeed, the only place you can set the number of PVs to stripe the LV over is in lvcreate, and it seems I would need to increase that by the number of extra PVs. 
Some emails in the archive suggest that you can do a pvmove specifying the actual extents to move to the new PV.  It shows an example of going from 1 PV to 2 
PVs which is easy compared to going from n PVs to (n+m) PVs.  Though if I could change the number of PVs that the LV is striped over maybe I could repeatedly 
pvmove each PV with no args until it approximated a restriping of each LV... sounds a bit dodgy to me. 
 
Does anyone have advice on how to restripe?  Or alternative setups that don't require restriping? 
 
Thanks 
Daniel 
-- 
___________________________________________________________
Sign-up for Ads Free at Mail.com
http://promo.mail.com/adsfreejump.htm
