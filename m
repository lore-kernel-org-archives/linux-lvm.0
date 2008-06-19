Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5JLO4ST010757
	for <linux-lvm@redhat.com>; Thu, 19 Jun 2008 17:24:04 -0400
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5JLNo0A030652
	for <linux-lvm@redhat.com>; Thu, 19 Jun 2008 17:23:51 -0400
From: Ross Boylan <ross@biostat.ucsf.edu>
Date: Thu, 19 Jun 2008 14:23:44 -0700
Message-Id: <1213910624.9478.15.camel@iron.psg.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshot bug
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

The discussion on
https://bugzilla.redhat.com/show_bug.cgi?id=209927
seems to indicate that there is a bug in snapshotting that could affect
even LVM2 based snapshots.

Are LVM2 snapshots safe without the fix for that bug?

Also, I'm still wondering if converting LVM1 volumes to LVM2 has any
gotcha's, whether related to safety or otherwise.

-- 
Ross Boylan                                      wk:  (415) 514-8146
185 Berry St #5700                               ross@biostat.ucsf.edu
Dept of Epidemiology and Biostatistics           fax: (415) 514-8150
University of California, San Francisco
San Francisco, CA 94107-1739                     hm:  (415) 550-1062
