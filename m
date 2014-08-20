Received: from dhcp80-224.msp.redhat.com (dhcp80-224.msp.redhat.com
	[10.15.80.224])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7K4R4iv017392
	for <linux-lvm@redhat.com>; Wed, 20 Aug 2014 00:27:05 -0400
Mime-Version: 1.0 (Apple Message framework v1085)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <26E8C1C4-3218-4F3A-876E-9257E234E350@redhat.com>
Date: Tue, 19 Aug 2014 23:27:04 -0500
Message-Id: <A1202596-A418-46FB-ACF1-26A8DE7DBC2D@redhat.com>
References: <53E65987.8010605@mglug.de> <53E8BD5B.2070002@gmail.com>
	<26E8C1C4-3218-4F3A-876E-9257E234E350@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] what todo with broken cachedev?
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Aug 19, 2014, at 6:41 PM, Brassow Jonathan wrote:

> 
> Also, it would be nice when using "writethrough" to have the option of abandoning the cache - making it a normal LV again.  If there is no way to get the SSD back, there is probably no point in fixing.  Operation might have to be forced if "writeback".

bug created.
https://bugzilla.redhat.com/show_bug.cgi?id=1131777
