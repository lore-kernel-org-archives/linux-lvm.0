Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7LJRfAl031351
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 15:27:41 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7LJRd5i005644
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 15:27:40 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l7LJRYeX014531
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 15:27:34 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l7LJRYtx012795
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 15:27:34 -0400
Date: Tue, 21 Aug 2007 15:27:34 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.44.0708211521350.12788-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM mirrors and drive failure
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
To: LVM general discussion and development <linux-lvm@redhat.com>

The current LVM mirror code creates 3 (or more - assume just 2 
copies for discussion) pieces: copy0, copy1, log.  It is obvious what 
should and probably does happen if the PV for copy0 or copy1 goes away.
But what happens if the PV for log goes away?  Does it convert to a memory 
log?  When you reboot, does it do a full sync, like with a memory log?  
Which copy is copied from and which is copied to for the sync?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
