Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0QCeaNC031766
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 07:40:36 -0500
Received: from mrxmail0.mbuyu.com (mrxmail0.mbuyu.com [85.158.204.176])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0QCeKI1021325
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 07:40:20 -0500
Received: from [172.16.26.19] (unknown [87.215.139.10])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mrxmail0.mbuyu.com (Postfix) with ESMTP id 9F12512D33
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 13:40:19 +0100 (CET)
Message-ID: <497DAF33.5050608@m4n.nl>
Date: Mon, 26 Jan 2009 13:40:19 +0100
From: M4N - Arjan Tijms <arjan.tijms@m4n.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Suspicious performance gaps in LVM volume over 2 block
 devices (internally RAID 5).
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

Hi,

We're building a system on Linux (kernel 2.6.26) using LVM 2.02.39, for 
which we stripe 2 block devices into 1 volume. Each device is internally 
build using a RAID 5 on a hardware RAID controller (Areca 1680Ix-12/4GB 
RAM). This RAID controller is rather fast (sporting a 1.2Ghz IOP 348). 
To each Areca we connected 6 Mtron pro 7535's. The stripe set thus spans 
12 physical disks over 2 raid controllers.

Initially it seemed to work just fine, but when running the easyco 
benchmark (see http://easyco.com/), suspicious gaps in the performance 
figures appear for certain block sizes:


EasyCo# ./bm-flash /ssd/ssd-striped/test.txt
Filling 4G before testing  ...   4096 MB done in 1 seconds (4096 MB/sec).

Read Tests:

Block |   1 thread    |  10 threads   |  40 threads   
 Size |  IOPS    BW   |  IOPS    BW   |  IOPS    BW   
      |               |               |               
 512B | 21856   10.6M | 59945   29.2M | 59381   28.9M 
   1K | 32945   32.1M | 59773   58.3M | 59252   57.8M 
   2K | 32462   63.4M | 59611  116.4M | 59081  115.3M 
   4K | 31398  122.6M | 59707  233.2M | 58946  230.2M 
   8K | 28847  225.3M | 58294  455.4M | 57684  450.6M 
  16K | 24965  390.0M | 57934  905.2M | 57004  890.6M 
  32K | 19393  606.0M | 52848 1651.5M | 52520 1641.2M 
  64K | 13466  841.6M | 46626    2.8G | 46533    2.8G 
 128K |  8541 1067.6M | 25962    3.1G | 27364    3.3G 
 256K |  7777    1.8G | 13876    3.3G | 13876    3.3G 
 512K |  4377    2.1G |  6942    3.3G |  6943    3.3G 
   1M |  2356    2.3G |  3472    3.3G |  3473    3.3G 
   2M |  1292    2.5G |  1735    3.3G |  1732    3.3G 
   4M |   728    2.8G |   847    3.3G |   864    3.3G 

Write Tests:

Block |   1 thread    |  10 threads   |  40 threads   
 Size |  IOPS    BW   |  IOPS    BW   |  IOPS    BW   
      |               |               |               
 512B | 31208   15.2M | 30125   14.7M | 22332   10.9M 
   1K | 29351   28.6M | 29055   28.3M | 27419   26.7M 
   2K | 24413   47.6M | 28681   56.0M | 27832   54.3M 
   4K | 28874  112.7M | 25613  100.0M | 25060   97.8M 
   8K |    27  216.0K |   925    7.2M | 12215   95.4M 
  16K | 18230  284.8M | 20401  318.7M |    13  209.5K 
  32K | 12462  389.4M |    35 1148.7K | 13666  427.0M 
  64K |    10  684.7K |  8437  527.3M |     6  441.5K 
 128K |  7030  878.7M |     2  332.7K 
 256K |  4523 1130.8M |     3  947.1K 
 512K |  4222    2.0G |     5    2.5M 
   1M |  2085    2.0G |     2    2.0M 
   2M |  1495    2.9G |    12   25.1M 
   4M |   768    3.0G |   122  488.0M |   143  573.5M


As can be seen from this report, testing with 1 thread shows no gaps, 
but does show numbers which are clearly too high for writing. When more 
threads are added to the test, gaps start to appear.

We have extensively tested the individual devices (i.e. 6 disks, 1 
controller, no LVM) and there doesn't seem to be any problem. I wonder 
if someone could explain the behavior we're seeing when using LVM to 
stripe two otherwise correctly working devices into 1 volume.

Thanks in advance,
Arjan

-- 
It's a cult. If you've coded for any length of time, you've run across someone from this warped brotherhood. Their creed: if you can write complicated code, you must be good.
