Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAE5B5Q0003670
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 00:11:05 -0500
Received: from mail2.sea5.speakeasy.net (mail2.sea5.speakeasy.net
	[69.17.117.4])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAE5Avs9029012
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 00:10:57 -0500
Received: from dsl093-060-083.pit1.dsl.speakeasy.net (HELO [192.168.0.5])
	([66.93.60.83]) (envelope-sender <jerith@speakeasy.org>)
	by mail2.sea5.speakeasy.net (qmail-ldap-1.03) with AES256-SHA encrypted
	SMTP for <linux-lvm@redhat.com>; 14 Nov 2006 05:10:51 -0000
Date: Tue, 14 Nov 2006 00:11:02 -0500 (EST)
From: Matt McHenry <jerith@speakeasy.org>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
Message-ID: <Pine.LNX.4.64.0611140009360.7393@localhost>
MIME-Version: 1.0
Content-ID: <Pine.LNX.4.64.0611140009362.7393@localhost>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


 	As suggested in your other post, I upgraded my kernel and lvm tools. 
Still no luck.  :(

# uname -a
Linux localhost 2.6.18-gentoo-r2 #1 SMP PREEMPT Sun Nov 12 18:00:54 EST 2006 
i686 Intel(R) Pentium(R) 4 CPU 3.00GHz GNU/Linux

# dmsetup version
Library version:   1.02.10 (2006-09-19)
Driver version:    4.7.0

>  I don't have an idea why the lvcreate is failing...  You could try to
>  interface with device-mapper directly and see what happens.  To do that
>  type:

# echo "0 31457280 linear 8:11 31457664" | dmsetup -vvvv create maingroup-dvd
device-mapper: reload ioctl failed: Invalid argument
Command failed
dm version   O   [16384]
dm create maingroup-dvd  O   [16384]
dm reload maingroup-dvd  O   [16384]
dm remove maingroup-dvd  O   [16384]

>  Another simple thing to try is bumping up the verbosity; e.g. 'lvcreate
>  -vvvv -L 15G -n dvd maingroup'.  This will give alot of output, so you may
>  wish to redirect it to a file.  Having everything printed can often give
>  great clues as to the problem.

 	I think my first message got rejected because of the size of the 
output, so instead it's at http://66.93.60.83/~matt/lvcreate.log.  To my 
untrained eye, things look fine until this point:

# libdm-deptree.c:1370         Adding target: 0 31457280 linear 8:11 31457664
# ioctl/libdm-iface.c:1557         dm table   (254:11) O   [16384]
# ioctl/libdm-iface.c:1557         dm reload   (254:11) N   [16384]
# ioctl/libdm-iface.c:1574   device-mapper: reload ioctl failed: Invalid 
# argument

----------------------
Matt McHenry
http://www.speakeasy.org/~jerith/
jerith@speakeasy.org
be052@scn.org
