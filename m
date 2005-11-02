Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA24CbV31374
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2005 23:12:37 -0500
Received: from svs.gsfc.nasa.gov (svsmail.gsfc.nasa.gov [128.183.34.28])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA24CUBY025882
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2005 23:12:30 -0500
Received: from [128.183.34.47] (nu.gsfc.nasa.gov [128.183.34.47])
	by svs.gsfc.nasa.gov (Postfix) with ESMTP id 2FD1A10000A9
	for <linux-lvm@redhat.com>; Tue,  1 Nov 2005 23:12:25 -0500 (EST)
Message-ID: <43683CA4.4090406@svs.gsfc.nasa.gov>
Date: Tue, 01 Nov 2005 23:12:20 -0500
From: "Randall A. Jones" <rajones@svs.gsfc.nasa.gov>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] aborted pvmove; how to remove locked LV "pvmove0"
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


I started a pvmove that was interrupted before it was finished. 
lvdisplay reports that the pvmove0 LV is still there.  Looking in 
/etc/lvm/backup/vg0 shows that pvmove0 is locked.  If I try to use 
lvremove pvmove0, it fails stating that it is locked.

Is there a way to unlock a locked LV?  Or is there a way to tell LVM 
that the pvmove operation is no longer needed so it will clean up?

Thank you,
Randall
-- 
..:.::::
Randall Jones     GST      NASA Goddard Space Flight Center
HPC Visualization Support       http://hpcvis.gsfc.nasa.gov
Scientific Visualization Studio    http://svs.gsfc.nasa.gov
rajones@svs.gsfc.nasa.gov      Code 610.3      301-286-2239
