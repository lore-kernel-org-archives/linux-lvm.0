Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7RMir304358
	for <linux-lvm@redhat.com>; Fri, 27 Aug 2004 18:44:53 -0400
Received: from mxfep01.bredband.com (mxfep01.bredband.com [195.54.107.70])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i7RMikhE017973
	for <linux-lvm@redhat.com>; Fri, 27 Aug 2004 18:44:47 -0400
Received: from [192.168.0.2] ([83.226.113.134] [83.226.113.134])
	by mxfep01.bredband.com with ESMTP
	id <20040827224427.VLWK5206.mxfep01.bredband.com@[192.168.0.2]>
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 00:44:27 +0200
Message-ID: <412FB950.4070203@home.se>
Date: Sat, 28 Aug 2004 00:44:32 +0200
From: Andreas Dahlgren <andreas.dahlgren@home.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove wont work
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Just upgraded to 2.6.8.1 and got much less errors but pvmove still wont 
work.
# pvmove -t /dev/hdc
  Test mode: Metadata will NOT be updated.
  *mirror: Required device-mapper target(s) not detected in your kernel

*anyone knows why this wont work?*
*
