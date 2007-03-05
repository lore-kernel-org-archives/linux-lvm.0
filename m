Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l25L3kJb029440
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 16:03:46 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l25L3hka000413
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 16:03:43 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l25L3b2E024096
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 16:03:37 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l25L3bg8025604
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 16:03:37 -0500
Date: Mon, 5 Mar 2007 16:03:37 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.44.0703051550290.25520-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Some apparent success: recommendations?
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

Based on what I've learned, I copied /etc/lvmconf/rootvg.conf to 
/etc/lvmtab.d/rootvg, overwriting the version copied from my system backup 
(which didn't include md3).   I then ran vgck, still no errors.  Then I 
ran lvremove -v /dev/rootvg/lvtest, which then succeeded!  Even better, 
the ondisk metadata for /dev/md3 is now "available".  The ondisk VG status 
is still "NOT available", but I believe this is normal based on checking
two other RHEL3 LVM1 systems.

What else should I check before rebooting?  Should I run vgscan ?  Does 
vgck compare ondisk metadata with kernel?  Is it safe to expand LVs now?  
Or should I reboot first?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
