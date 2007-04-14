Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3EDnR19003340
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 09:49:27 -0400
Received: from extmail.dtnet.de (extmail.dtnet.de [87.193.12.202])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3EDnP7x016595
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 09:49:25 -0400
Message-ID: <4620D6A7.1090806@dtnet.de>
Date: Sat, 14 Apr 2007 15:27:03 +0200
From: Daniel Schwager <daniel.schwager@dtnet.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Limitation: only < 32 snapshots possible 
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

Hi together,

i create 5 LV's (e.g. play1..n) and therefore, i created 10 snapshots
for each LV. After 32 snapshots (should 5*10 = 50 snapshots), i got the
following error:
    "device-mapper: reload ioctl failed: Cannot allocate memory"

My versions (on debian etch):
    xentor:/etc/lvm# lvm version
      LVM version:     2.02.07 (2006-07-17)
      Library version: 1.02.08 (2006-07-17)
      Driver version:  4.7.0

I looked arround and found  
http://sources.redhat.com/lvm2/wiki/FrequentlyAskedQuestions      (last 
topic on page):

    *  > Known problem - will be partially solved by new DM-IO interface.
    *  > But anyway, current snapshot implementation is not properly
      designed for such type of operation (many snapshots will
      significantly slow down all IO).

QUESTION: Is this limitiation fixed in the current version 2.02.24 from 
ftp://sources.redhat.com/pub/lvm2

Thanks for helping

regards

Danny

BTW: I want to clone (means create LVMs-snapshot) about 40 xen vm's 
running on 4 xen-server ..
therefore it would nice to use the LVM2-snapshot-feature (instead of 
GFS/OCFS2).
