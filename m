Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3OIunc7002802
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 14:56:49 -0400
Received: from hrndva-omtalb.mail.rr.com (hrndva-omtalb.mail.rr.com
	[71.74.56.123])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3OIubAc003753
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 14:56:38 -0400
Received: from cpe-76-90-113-66.socal.rr.com ([76.90.113.66])
	by hrndva-omta03.mail.rr.com with ESMTP id
	<20080424185632.ZIUW28252.hrndva-omta03.mail.rr.com@cpe-76-90-113-66.socal.rr.com>
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 18:56:32 +0000
Date: Thu, 24 Apr 2008 11:56:31 -0700 (PDT)
From: chekov@ucla.edu
In-Reply-To: <20080424172021.E3A06619B4C@hormel.redhat.com>
Message-ID: <alpine.LRH.1.10.0804241155020.4181@cpe-76-90-113-66.socal.rr.com>
References: <20080424172021.E3A06619B4C@hormel.redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] question about mirrors
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I created a lvm mirror on two seperate storage arrays.

now I want to break the mirror but use _both_ copies of the data.  it seems 
that whenever I break a test mirror the mirror just goes back in to the 
storage pool and can't be accessed any more.  is there a way to mount both 
mirror halfs?
-alan
