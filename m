Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3K91xJr001161
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2011 05:02:00 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3K91u6m006571
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2011 05:01:56 -0400
Received: from gtw.srd.co.uk ([82.69.77.54] helo=flexo.srd.co.uk)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1QCTII-0008SU-O8
	for linux-lvm@redhat.com; Wed, 20 Apr 2011 10:01:54 +0100
Message-ID: <4DAEA0FD.60709@ankh.org>
Date: Wed, 20 Apr 2011 10:01:49 +0100
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <4DAE0B5E.4090503@stanford.edu> <4DAE0E79.3090503@q7.com>
	<2BF070A7A2375D46BA1B6087F8D5DCB67D93C8349E@seldmbx01.corpusers.net>
In-Reply-To: <2BF070A7A2375D46BA1B6087F8D5DCB67D93C8349E@seldmbx01.corpusers.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM Naming Convention
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Assarsson, Emil wrote:
> We have also started to use hostnames in the VG names for the same reason. Starting with vg makes is easier to auto complete when using bash :-P. I don't see any reason why to use "lv" to the LV's but it doesn't hurt. I also try to use UUID's in the /etc/fstab as much as possible.
>
> Best regards
> Emil Assarsson
>   
I also use the hostname in the volume group name for all the reasons 
already suggest, its particularly valuable when dealing with san disk, 
as any mistake is very obvious.

personally I use

/dev/<hostname>_<type><number>_vg/<filesystem>_lv

Where type is l for local disk s for san. I keep my raid 1 and raid 5 in 
different volume groups to avoid mistakes, however both are called l or s.

Where the disk is for use to virtual machines I used

/dev/<hostname>_<type><number>_vg/<virtual machine>_v<number>_lv

I put _vg at the end of all volume groups mostly for completeness, and 
avoidance of any change of a name clash, I also thing _lv is useful as 
alots of devices can be mixed up in /dev/mapper so giving them a 
seperate namespace so the don't get mixed up with multipathed disk, (and 
in the old days raw devices) etc. I can do a ls /dev/mapper/*_lv to see 
all my logical volumes all in one go, independant of group.


James
