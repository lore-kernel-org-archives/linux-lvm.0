Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7Q3P1V23151
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2005 23:25:01 -0400
Received: from cenobyte.unholyground.com (cenobyte.devit.com [216.165.189.229])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7Q3Oo61030706
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2005 23:24:54 -0400
Date: Thu, 25 Aug 2005 22:24:40 -0500
From: Matt Griswold <matt@devit.com>
Message-ID: <20050826032440.GP14879@cenobyte.slimenet>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] snapshot diff grower
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

I'm using snapshots as CoW partitions and wanted the ability to grow the diff
space so I wrote this.  I have no idea how well it will scale, or if it works
on striped partitions, but seems to work well in my situation. :)  At any rate,
I thought I'd drop a line here and see if anyone is interested in trying it
out.  Please let me know if you run into any issues, thanks.

Readme:
http://oss.devit.com/matt/ssgrowd/README
Download:
http://oss.devit.com/matt/ssgrowd-1.0.0.tar.bz2

Enjoy!

Matt
