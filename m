Message-ID: <46B2798D.8000902@gmail.com>
Date: Fri, 03 Aug 2007 10:40:45 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
References: <46B0EAEF.6090305@cfl.rr.com>	<20070802065012.GA28687@percy.comedia.it>	<46B1B5E1.1050406@redhat.com>
	<46B251BB.1010004@cfl.rr.com>
In-Reply-To: <46B251BB.1010004@cfl.rr.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [dm-devel] Re: LVM on dmraid breakage
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
To: device-mapper development <dm-devel@redhat.com>
Cc: "ATARAID (eg, Promise Fasttrak,
	Highpoint 370) related discussions" <ataraid-list@redhat.com>, linux-lvm@redhat.com

> The problem is that lvm is looking at the physical disks at all.  It 
> needs to scan the dmraid device, not the underlying disks.

If you need LVM to only scan certain devices you should modify the 
filter line in lvm.conf.

--Dave
