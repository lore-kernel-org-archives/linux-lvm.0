Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7T8bI306025
	for <linux-lvm@redhat.com>; Sun, 29 Aug 2004 04:37:18 -0400
Received: from kidushin.jct.ac.il (kidushin.jct.ac.il [147.161.1.19])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i7T8bDS1021410
	for <linux-lvm@redhat.com>; Sun, 29 Aug 2004 04:37:16 -0400
Message-ID: <413195B2.3050103@jct.ac.il>
Date: Sun, 29 Aug 2004 11:37:06 +0300
From: Yedidia Klein <yedidia@jct.ac.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Suggested Kernel and LVM version for production storage
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: unixstaff@jct.ac.il

Hello,

I'm using LVM2 on a FC2 based linux w/ the following versions:
Kernel (patched to LVM2 w/ snapshots) :     2.4.23
LVM version:                                                 2.00.15 
(2004-04-19)
Library version:                                             
1.00.14-ioctl (2004-04-06)
Driver version:                                               4.0.5

Sometimes I'm getting the following errors, and get all my LVM 
FileSystem Blocked .. (mean I can't access the files on these partitions 
and have to reboot for getting access again)

    -----------------------------------------------------
    Aug 26 01:00:02 nazir kernel: device-mapper: 
                          Unable to allocate hash table space 
    -----------------------------------------------------
    Aug 26 01:00:02 nazir kernel: device-mapper:
                          error adding target to table 
    -----------------------------------------------------
    Aug 26 10:50:47 nazir kernel: device-mapper:
                          4.0.5-ioctl (2003-11-18) initialised:
                          dm@uk.sistina.com 
    -----------------------------------------------------


Any suggestion for a kernel/LVM version ?
Is anyone running a production system w/ LVM2 and snapshot ? if yes 
which versions ?

thanks,

--Yedidia
