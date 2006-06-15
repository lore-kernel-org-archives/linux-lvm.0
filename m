Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5FHCOoE017441
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 13:12:24 -0400
Received: from smtp2.poczta.onet.pl (smtp2.poczta.onet.pl [213.180.130.30])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5FHCM4e013890
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 13:12:22 -0400
Message-ID: <449194DD.6070801@poczta.onet.pl>
Date: Thu, 15 Jun 2006 19:11:57 +0200
From: =?ISO-8859-2?Q?Maciej_S=B3ojewski?= <mslonik@poczta.onet.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm -> "normal" system conversion
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

Greetins,

I have Linux Kubuntu Breezy system running completely on software raid, 
LVM2, including root and boot partitions (LILO boot loader). As for some 
reasons I found such a structure not very convenient I would like revert 
it the following one:
- crucial data on software raid matrix (sda & sdb), so home partition etc.;
- boot partition and  root partition on separate hard disk (hde).

My questions are:
1. What is the quickiest and easiest way to perform such a conversion?
2. What is at least the rough sequence of steps to do?

Some details around my current system:

+++++++++++++++++++++++++++++++
A. current state
                                 |------------ boot
sda ---                        |------------- root
         |--- md0---------|------------- home
sdb---                        |-------------- zasoby1
                                |-------------- zasoby2

boot loader: LILO on LVM2

+++++++++++++++++++++++++++++++
B. required state

sda --- 
           |--- md0--------|-------------- home
sdb---                         |-------------- zasoby1
                                  |-------------- zasoby2

hde6-------------------|--------------- boot
                               |--------------- root
boot loader: GRUB
+++++++++++++++++++++++++++++++

I've already formatted and partitioned hde6. Now I think how to make a 
copy of root and finally how to install GRUB so it will be able to see 
LVM2 volumes...

Thanks in advance :-)

Kind regards,
Maciej (mslonik)

-- 
GG: 3321025
Skype: maciej_slojewski
