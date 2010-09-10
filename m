Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8ALwht4017598
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 17:58:43 -0400
Received: from ns14.wlu.edu (NS14.wlu.edu [137.113.150.134])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8ALwXIq003451
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 17:58:33 -0400
Received: from MEXHT2.ad.wlu.edu ([137.113.81.76])
	by ns14.wlu.edu (8.13.1/8.13.1) with ESMTP id o8ALwbn5002126
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 17:58:37 -0400
From: Steve Goryl <GorylS@wlu.edu>
Content-Type: text/plain; charset="us-ascii"
Date: Fri, 10 Sep 2010 17:58:31 -0400
Message-ID: <A33767C8-B385-41D9-B43F-A1BF3C91DAD7@wlu.edu>
MIME-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvextend advice ?
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
To: linux-lvm@redhat.com

I have an old but critical server (Monarch brand) that has somehow run out of space in /......
Also the boot partition shows 19% on an fsck at startup. No other known issues..  (age)

The kernel is 2.6.9-42.0.3ELsmp x86 64bit and shows the following parameters:

Filesystem    Type    Size  Used Avail Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
              ext3     52G   52G     0 100% /
/dev/sda1     ext3     99M   23M   72M  25% /boot
none         tmpfs    2.6G     0  2.6G   0% /dev/shm
/dev/mapper/VolGroup00-LogVol03
              ext3    193G  117G   66G  64% /exports/home
/dev/mapper/VolGroup00-LogVol02
              ext3     49G  3.2G   43G   7% /exports/local
/dev/mapper/VolGroup00-LogVol01
              ext3     20G  4.7G   14G  26% /var
/dev/mapper/VolGroup00-LogVol04
              ext3     21G  3.5G   17G  18% /opt
/dev/mapper/VolGroup00-vmware
              ext3     40G  3.2G   35G   9% /exports/vmware

 
#lvm lvs
LV       VG         Attr   LSize   Origin Snap%  Move Log Copy% 
  LogVol00 VolGroup00 -wi-ao  51.88G                              
  LogVol01 VolGroup00 -wi-ao  19.53G                              
  LogVol02 VolGroup00 -wi-ao  48.84G                              
  LogVol03 VolGroup00 -wi-ao 195.31G                              
  LogVol04 VolGroup00 -wi-ao  21.12G                              
  swap1    VolGroup00 -wi-ao   1.97G                              
  swap2    VolGroup00 -wi-ao   1.97G                              
  swap3    VolGroup00 -wi-ao   1.97G                              
  swap4    VolGroup00 -wi-ao   1.97G                              
  vmware   VolGroup00 -wi-ao  40.00G         


#lvscan
ACTIVE            '/dev/VolGroup00/LogVol00' [51.88 GB] inherit
  ACTIVE            '/dev/VolGroup00/LogVol03' [195.31 GB] inherit
  ACTIVE            '/dev/VolGroup00/LogVol02' [48.84 GB] inherit
  ACTIVE            '/dev/VolGroup00/LogVol01' [19.53 GB] inherit
  ACTIVE            '/dev/VolGroup00/swap4' [1.97 GB] inherit
  ACTIVE            '/dev/VolGroup00/swap3' [1.97 GB] inherit
  ACTIVE            '/dev/VolGroup00/swap2' [1.97 GB] inherit
  ACTIVE            '/dev/VolGroup00/swap1' [1.97 GB] inherit
  ACTIVE            '/dev/VolGroup00/LogVol04' [21.12 GB] inherit
  ACTIVE            '/dev/VolGroup00/vmware' [40.00 GB] inherit

lvm2 format     version  2.02.21-RHEL4
driver 4.5.0
kernel is 2.6.9-42.0.3ELsmp x86 64bit

vgdisplay -v
    Finding all volume groups
    Finding volume group "VolGroup00"
  --- Volume group ---
  VG Name               VolGroup00
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  16
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                10
  Open LV               10
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               465.53 GB
  PE Size               32.00 MB
  Total PE              14897
  Alloc PE / Size       12306 / 384.56 GB
  Free  PE / Size       2591 / 80.97 GB
  VG UUID               6E83RZ-Beww-DHFv-sDRh-ssZd-F1QJ-K2ZLAA
   
**** My question is due to the age of the kernel, should the lvextend on LogVol00 be done from the "rescue mode"
OR could it be done with limited services running or in say run level 3? ANY OTHER obvious potential issues?

(Due to custom kernel modules it would NOT be prudent to upgrade the box at this time.)

THANKS in advance for your TIME on thoughts, concerns or questions..

Steve Goryl
Everest Expedition Leader 1994
