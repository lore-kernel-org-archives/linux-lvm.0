Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3OEhG3V028174
	for <linux-lvm@redhat.com>; Fri, 24 Apr 2015 10:43:16 -0400
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3OEhDPV027728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 24 Apr 2015 10:43:14 -0400
Received: from [192.168.0.11] (unknown [82.66.78.161])
	(Authenticated sender: georges.giralt)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 39A7382330
	for <linux-lvm@redhat.com>; Fri, 24 Apr 2015 16:40:52 +0200 (CEST)
Message-ID: <553A567F.2000001@free.fr>
Date: Fri, 24 Apr 2015 16:43:11 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mixing different devices
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello guys,
I've a laptop which has a plain traditional HDD with 4K blocks.
And this laptop is fitted with an M.2 NGFF SSD device of 128GB. It is a 
pity to use this SSD only as cache.
So I wonder if I can make a VG comprising the two devices (one PV per 
device) and still retain the 4K blocks for the hard disk and the TRIM 
and 512bytes sector size of the SSD.
And if the answer is yes, what should I be aware of ? Or what options 
should i use during the pvcreate/vgcreate steps ?
Thanks for your help  !
P.S. the HDD is GPT partitioned and the SSD is not so all options are 
possible.

-- 
If the only tool you have is a hammer, you tend to see every problem as a nail.
                 Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel.
