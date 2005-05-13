Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4D0tQO20809
	for <linux-lvm@redhat.com>; Thu, 12 May 2005 20:55:26 -0400
Received: from msex01.affymetrix.com (scfw.affymetrix.com [12.22.48.133])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j4D0tLPJ009337
	for <linux-lvm@redhat.com>; Thu, 12 May 2005 20:55:21 -0400
Message-ID: <4283FAF3.5080602@affymetrix.com>
Date: Thu, 12 May 2005 17:55:15 -0700
From: Hugh Caley <Hugh_Caley@affymetrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] sar-type statistics for LVM2 volumes?
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
To: linux-lvm@redhat.com

I need to get some usage stats about my LVM2 volumes, and unfortunately 
the Fedora kernel doesn't seem to know how to do that.  I see that there 
used to be a utility called "lvmsar", is there something similar around 
these days?  Or is there another way I can see how much traffic each 
LVM2 volume gets?

Hugh

-- 
Hugh Caley | Unix Systems Administrator | CIS
AFFYMETRIX, INC. | 6550 Vallejo St. Ste 100 | Emeryville, CA 94608
Tel: 510-428-8537 | Hugh_Caley@affymetrix.com
