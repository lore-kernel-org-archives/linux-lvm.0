Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GGL4Sc032307
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 12:21:04 -0400
Received: from smtp15.poczta.onet.pl (smtp15.poczta.onet.pl [213.180.130.75])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GGL0AZ028001
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 12:21:01 -0400
Message-ID: <4492DA62.9020900@poczta.onet.pl>
Date: Fri, 16 Jun 2006 18:20:50 +0200
From: =?ISO-8859-2?Q?Maciej_S=B3ojewski?= <mslonik@poczta.onet.pl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm -> "normal" system conversion
References: <449194DD.6070801@poczta.onet.pl> <44919F46.1010305@conterra.de>
In-Reply-To: <44919F46.1010305@conterra.de>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dieter St�ken napisa�(a):
>
> Hi Maciej,
>
> sorry, I don't exactly understand your current setting:
> do sda/sdb form your raid md0? In both cases?
> Does your LVM then resides on md0?
> Are root, boot home and zasoby1/2 logical volumes?
You are right, I should explain my current configuration in more 
details. I apologize for that. Here it is:

lvm> version
  LVM version:     2.02.02 (2006-02-07)
  Library version: 1.02.05 (2006-04-19)
  Driver version:  4.4.0

lvm> pvs
  PV         VG   Fmt  Attr PSize  PFree
  /dev/md0   pv   lvm2 a-   74,53G    0

lvm> lvs
  LV      VG   Attr   LSize   Origin Snap%  Move Log Copy%
  boot    pv   -wi-ao 100,00M
  home    pv   -wi-ao   5,00G
  root    pv   -wi-ao  10,00G
  swap    pv   -wi-ao   2,00G
  zasoby1 pv   -wi-ao  30,00G
  zasoby2 pv   -wi-ao  27,43G

md0 is software raid type 1 matrix, which is made of sda1 and sdb1. 
Every part of the system (including boot and root) are on LVM2 LV. LILO 
as a boot loader.

My goal is to add a new hard drive (hde6) to the sytem and move root and 
boot from LVM2 to hde6. My second goal is to change boot loader from 
LILO to GRUB.

My questions are:
1. What is the quickiest and easiest way to perform such a conversion?
2. What is at least the rough sequence of steps to do?

Again, thanks in advance for help.

Kind regards,
Maciej (mslonik)

-- 
GG: 3321025
Skype: maciej_slojewski
