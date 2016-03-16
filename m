Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2GLaOwo010284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 17:36:24 -0400
Received: from fortimail.online.lv (fortimail.online.lv [81.198.164.220])
	by mx1.redhat.com (Postfix) with ESMTPS id 6C9FD8E360
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 21:36:22 +0000 (UTC)
Received: from mailo-proxy1.online.lv (smtp.online.lv [81.198.164.193])
	by fortimail.online.lv  with ESMTP id u2GLaJ9c019044-u2GLaJ9e019044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2016 23:36:19 +0200
From: Raimonds Cicans <ray@apollo.lv>
Message-ID: <56E9D1D2.8000403@apollo.lv>
Date: Wed, 16 Mar 2016 23:36:18 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvconvert -m 0 /dev/varlin/distfiles /dev/md0 => zero
 filled logical volume
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

Hello.

I am trying to move LVM setup from old RAID md0 to new RAID md1

I did "lvconvert -m 1 /dev/path/to/logical_volume /dev/md1" on bunch of 
logical volumes.
Everything went without problems.

Then I tried to remove md0 from one of logical volumes by running command:
lvconvert -m 0 /dev/varlin/distfiles /dev/md0

I tried to mount this logical volume, but failed.

Then I checked first  megabyte of logical volume it was zero filled.

Partial output of "lvs -o+devices":
   LV              VG     Attr       LSize   Pool Origin Data%  Meta% 
Move Log Cpy%Sync Convert Devices 

   backup          varlin -wi-ao---- 100,00g 
                          /dev/md0(6304) 

   backup          varlin -wi-ao---- 100,00g 
                          /dev/md0(8544) 

   data            varlin -wi-ao----  20,00g 
                          /dev/md0(28384) 

   distfiles       varlin -wi-a-----  20,00g 
                          /dev/md1(2738) 

   ftp             varlin rwi-aor---  10,00g 
         100,00           ftp_rimage_0(0),ftp_rimage_1(0) 

   ftpdown         varlin rwi-aor---  10,00g 
         100,00           ftpdown_rimage_0(0),ftpdown_rimage_1(0) 



lvm2: 2.02.116
kernel: 4.4.2


Questions:

1) What I did wrong?
2) Is it possible to salvage /dev/varlin/distfiles or I must restore it 
from backups?
3) What I should do now to get system to safe state?


Best regards,
Raimonds Cicans
