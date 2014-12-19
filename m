Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBJAWZTW030164
	for <linux-lvm@redhat.com>; Fri, 19 Dec 2014 05:32:35 -0500
Received: from ext.crowie.net (133.75.70.115.static.exetel.com.au
	[115.70.75.133])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBJAWWmJ024454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 19 Dec 2014 05:32:34 -0500
Received: from [192.168.132.10] (vpn2.crowie.net [192.168.132.10])
	by ext.crowie.net (8.14.7/8.14.7) with ESMTP id sBJAWTnP004965
	for <linux-lvm@redhat.com>; Fri, 19 Dec 2014 21:32:30 +1100
Message-ID: <5493FEB9.7010009@crowie.net>
Date: Fri, 19 Dec 2014 21:32:25 +1100
From: G Crowe <gclvmlist@crowie.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Missing Logical Volumes
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
To: linux-lvm@redhat.com

After rebooting, some of my logical volumes did not have device files.

/dev/array1/LVpics
and
/dev/mapper/array1-LVpics
did not exist but the output of "lvdisplay" said that the volume was 
available (see below).

vgscan did not resolve the problem.

I was able to regain access to the LV by renaming it, then renaming it 
back...
[root@host1 ~]# lvrename /dev/array1/LVpics /dev/array1/LVpicsnew
   Renamed "LVpics" to "LVpicsnew" in volume group "array1"
[root@host1 ~]# lvrename /dev/array1/LVpicsnew /dev/array1/LVpics
   Renamed "LVpicsnew" to "LVpics" in volume group "array1"

There are 29 LVs in the VG and 25 of them came up OK and 4 had this 
problem. Note that there is only one single PV (a RAID6 array) in the 
VG, and there are two VGs on the machine.

Is this expected behaviour, or is it something I should be worried about?



   --- Logical volume ---
   LV Path                /dev/array1/LVpics
   LV Name                LVpics
   VG Name                array1
   LV UUID                WH7g9u-Ls7J-fIpQ-Hk2p-mUuH-QRKf-9uxcM2
   LV Write Access        read/write
   LV Creation host, time example.com, 2013-11-26 07:29:51 +1100
   LV Status              available
   # open                 0
   LV Size                350.00 GiB
   Current LE             89600
   Segments               2
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           253:9


I am running Fedora 19 with kernel 3.11.9-200.fc19.x86_64


Thanks

GC
