Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7SL9r321027
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 17:09:53 -0400
Received: from mxfep02.bredband.com (mxfep02.bredband.com [195.54.107.73])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7SL9kS0015686
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 17:09:52 -0400
Received: from [192.168.0.2] ([83.226.113.134] [83.226.113.134])
	by mxfep02.bredband.com with ESMTP
	id <20040828210935.ZDU345.mxfep02.bredband.com@[192.168.0.2]>
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 23:09:35 +0200
Message-ID: <4130F495.90806@home.se>
Date: Sat, 28 Aug 2004 23:09:41 +0200
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
  mirror: Required device-mapper target(s) not detected in your kernel

anyone knows why this wont work?
