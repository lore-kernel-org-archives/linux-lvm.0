Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6SE5Fa09017
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 10:05:15 -0400
Received: from smtp012.mail.yahoo.com (smtp012.mail.yahoo.com [216.136.173.32])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i6SE58Xn008531
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 10:05:08 -0400
Sender: frank@redhat.com
Message-ID: <4107B28E.C22CF115@yahoo.de>
Date: Wed, 28 Jul 2004 16:05:02 +0200
From: Frank Mohr <f_mohr@yahoo.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvscan fails (more informations)
References: <4106E0D6.10D6AA3D@yahoo.de>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Frank Mohr wrote:
> 
> Hi
> 
> after a system crash my system can't find it's LVM volumes:
> 

some more informations:

- the system didn't crash but was switched of before "vgchange -a n" was
called
- pvdisplay shows "PV Status available" for all PV's

- vgcfgrestore
  even some backups back doesn't help
- vgcfgrestore -t -ll -f /etc/lvmconf/DATAVG.conf -n DATAVG
  showns the same results as pvdisplay
- pvdisplay on all 3 partions shown "good" results

- pvdata -a /dev/hdb1 /dev/hdc1 /dev/hdd1
  looks good 
  displays the same "VG UUID" for all PV's

- tried vgimport -f -v DATAVG /dev/hdb1 /dev/hdc1 /dev/hdd1

odie:~/LVM/1.0.8/tools # vgimport -f -v DATAVG /dev/hdb1 /dev/hdc1
/dev/hdd1
vgimport -- locking logical volume manager
vgimport -- checking volume group name
vgimport -- checking volume group "DATAVG" existence
vgimport -- trying to read physical volumes
vgimport -- checking for duplicate physical volumes
vgimport -- checking physical volume name "/dev/hdb1"
vgimport -- reading data of physical volume "/dev/hdb1" from disk
vgimport -- checking for exported physical volume "/dev/hdb1"
vgimport -- checking consistency of physical volume "/dev/hdb1"
vgimport -- reallocating memory
vgimport -- checking for duplicate physical volumes
vgimport -- checking physical volume name "/dev/hdc1"
vgimport -- reading data of physical volume "/dev/hdc1" from disk
vgimport -- checking for exported physical volume "/dev/hdc1"
vgimport -- checking consistency of physical volume "/dev/hdc1"
vgimport -- reallocating memory
vgimport -- checking for duplicate physical volumes
vgimport -- checking physical volume name "/dev/hdd1"
vgimport -- reading data of physical volume "/dev/hdd1" from disk
vgimport -- checking for exported physical volume "/dev/hdd1"
vgimport -- checking consistency of physical volume "/dev/hdd1"
vgimport -- reallocating memory
vgimport -- physical volumes "/dev/hdc1" and "/dev/hdb1" are in
different volume groups

vgimport [-d|--debug] [-f|--force] [-h|--help] [-v|--verbose]
        VolumeGroupName PhysicalVolumePath [PhysicalVolumePath...]
odie:~/LVM/1.0.8/tools #
