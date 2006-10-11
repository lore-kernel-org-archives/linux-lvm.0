Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9B6aR3G032197
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 02:36:27 -0400
Received: from alnrmhc14.comcast.net (alnrmhc14.comcast.net [206.18.177.54])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9B6aLvb019439
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 02:36:21 -0400
Message-ID: <452C90DC.1030409@Englisch.us>
Date: Wed, 11 Oct 2006 02:36:12 -0400
From: Volker Englisch <Volker@englisch.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Boot fails after change of motherboard: No volume
	groups found
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

I have a problem I'm trying to solve but I haven't found a solution.

I am running FC4 (with AMD64) and was able to boot the machine without 
problems until Friday when I had to change my motherboard.
Since then it appears that I'm unable to boot because the system can not 
find my LVM.  I see this error message after grub selected the OS:
   Red Hat nash version 4.2.15 starting
      Reading all physical volumes. This may take a while ...
      No volume groups found
      Unable to find volume group "VolGroup00"

and as a result a kernel panic.
I can start the machine by using the installation disk and boot with 
'linux rescue' and then I can see my volume and access the data.

I have two SATA hard drives with a /boot partition and the volume group 
on the first one and the second HDD has just regular partitions:
   Filesystem                       Size   Used  Avail Use%  Mounted on
   /dev/mapper/VolGroup00-LogVol04   15G   7.2G   6.4G  54%  /var
   /dev/mapper/VolGroup00-LogVol03   34G    12G    20G  37%  /backup
   /dev/mapper/VolGroup00-LogVol00   24G   7.9G    15G  35%  /
   /dev/sda1                         99M    29M    65M  31%  /boot
   /dev/sdb3                        138G    18G   113G  14%  /free
   /dev/mapper/VolGroup00-LogVol02   29G   3.4G    24G  13%  /home
   /dev/sdb2                         46G   1.2G    43G   3%  /home/public
   /dev/sdb1                         46G   706M    43G   2%  /home/mail


Why would the boot process not find my volume group but does when I'm 
starting the OS with the rescue disk (or Knoppix)?

-- 
Thanks

     Volker Englisch

mailto:Volker@Englisch.us    (h)
