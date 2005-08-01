Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j71Im6V13742
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 14:48:06 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.195])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j71IluAT006225
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 14:47:56 -0400
Received: by wproxy.gmail.com with SMTP id i13so1454976wra
	for <linux-lvm@redhat.com>; Mon, 01 Aug 2005 11:47:47 -0700 (PDT)
Message-ID: <42EE6E4B.8070600@gmail.com>
Date: Mon, 01 Aug 2005 20:47:39 +0200
From: ddaas <ddaasd@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] e2fsck - Block bitmap differences - lvm1
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
I have a problem with lvm1 on rhel3.
I wanted to add another scsi disk.
So I did:


1)I've formatted it with fdisk, I've set two 30G partitions /dev/sdc1 
and /dev/sdc2 and set their type as 8e(lvm)
2)umount /home (the mount point for /dev/vg00/lvhome)
3)pvcreate /dev/sdc1
4)vgextent vg00 /dev/sdc1
5)lvextent -L +30G /dev/vg00/lvhome
6)I was forced to check the logical volume so I did: e2fsck -f 
/dev/vg00/lvhome
I got no errors, everything ok
7)resize2fs -p /dev/vg00/lvhome
Everything was ok, I could mount the /home under /dev/vg00/lvhome, 
access my data
8)Now I wanted to do the same for the second partition /dev/sdc2
9) so I did: pvcreate /dev/sdc2, vgextent vg00 /dev/sdc2, lvextent -L 
+30G /dev/vg00/lvhome
10)Now I wanted to check the filesystem for errors, so I did e2fsck -f 
/dev/vg00/lvhome
Here is the problem: I get an error about which I know nothing. I 
cound't find anything relevant on google. So the log from e2fsck is:
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
Block bitmap differences:  -(65537--65544) -(131073--131080) 
-(196609--196616) -(262145--262152) -(327681--327688) -(360449--360456) 
-(393217--393224) -(425985--425992) -(458753--458760) -(491521--491528) 
-(524289--524296) -(557057--557064) -(589825--589832) -(622593--622600) 
-(655361--655368) -(688129--688136) -(720897--720904) -(753665--753672) 
-(786433--786440) -(851969--851976) -(917505--917512) -(950273--950280) 
-(983041--983048) -(1015809--1015816) -(1048577--1048584) 
-(1081345--1081352) -(1114113--1114120) -(1146881--1146888) 
-(1179649--1179656) -(1212417--1212424) -(1245185--1245192) 
-(1277953--1277960) -(1310721--1310728) -(1343489--1343496) 
-(1376257--1376264) -(1409025--1409032) -(1441793--1441800) 
-(1474561--1474568) -(1507329--1507336) -(1540097--1540104) 
-(1572865--1572872) -(1638401--1638408) -(1671169--1671176) 
-(1703937--1703944) -(1736705--1736712) -(1769473--1769480) 
-(1802241--1802248) -(1835009--1835016) -(1867777--1867784) 
-(1900545--1900552) -(1933313--1933320) -(1966081--1966088) 
-(1998849--1998856) -(2031617--2031624) -(2064385--2064392) 
-(2097153--2097160) -(2129921--2129928) -(2162689--2162696) 
-(2195457--2195464) -(2228225--2228232) -(2260993--2261000) 
-(2293761--2293768) -(2326529--2326536) -(2359297--2359304) 
-(2392065--2392072) -(2424833--2424840) -(2457601--2457608) 
-(2490369--2490376) -(2523137--2523144) -(2555905--2555912) 
-(2588673--2588680) -(2621441--2621448) -(2686977--2686984) -:
...............................and so 
on................................................
Fix? no


/dev/vg00/lvhome: ********** WARNING: Filesystem still has errors **********


   363317 inodes used (2%)
    27279 non-contiguous inodes (7.5%)
          # of inodes with ind/dind/tind blocks: 57802/2906/0
20000925 blocks used (63%)
        0 bad blocks
        0 large files

   317204 regular files
    46039 directories
        0 character device files
        0 block device files
        0 fifos
        7 links
       65 symbolic links (65 fast symbolic links)
        0 sockets
--------
   363315 files

I didn't want e3fsck to repair the filesystem because I didn't want a 
fatal error or something.
The didn't extend the filesystem(resize2fs -p /dev/cg00/lvhome). Here is 
the point where I 've restarted the server, mount the /home without 
extend the filesystem.

I want to find what is all about first. So , any idea?

Thanks,
ddaas
