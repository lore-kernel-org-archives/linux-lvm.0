Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBIDiMr17089
	for <linux-lvm@redhat.com>; Sat, 18 Dec 2004 08:44:22 -0500
Received: from kumc-smtpout.kumc.edu (kumc-smtpout.kumc.edu [169.147.4.11])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBIDiBDI010723
	for <linux-lvm@redhat.com>; Sat, 18 Dec 2004 08:44:11 -0500
Message-Id: <s1c3dfc5.007@kumc-smtpout.kumc.edu>
Date: Sat, 18 Dec 2004 07:43:57 -0600
From: "Nicoya Helm" <NHELM2@kumc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] LV not activating during startup in SLES 9?
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

I recently had a minor kernel patch problem that was preventing LVM from
loading correctly on one of my boxes.  It's mostly solved, except that
my LV  is not automatically activating during start up.  Manually
issuing "vgchange -a y" fixes this, and I can mount it no problem. 

 I know I could just add this to a run level script to make sure it
happens during boot, but I want to have the activation happening in the
"appropriate" place.  However, I've been unable to find any
documentation that specifically explains where volume activation occurs
for LVM during startup on SuSE Linux Enterprise Server 9.  Any tips on
where to look to correct this?

Nicoya Helm
Project Manager, Network Services
University of Kansas Medical Center
nhelm2@kumc.edu
