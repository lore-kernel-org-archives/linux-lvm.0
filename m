Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k13Kts119725
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 15:55:54 -0500
Received: from palrel10.hp.com (palrel10.hp.com [156.153.255.245])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k13Ktq6C007500
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 15:55:52 -0500
Received: from smtp1.ptp.hp.com (hpda.cup.hp.com [15.1.28.250])
	by palrel10.hp.com (Postfix) with ESMTP id 00AF4344D9
	for <linux-lvm@redhat.com>; Fri,  3 Feb 2006 12:55:46 -0800 (PST)
Received: from [15.244.57.26] (airwolf.cup.hp.com [15.244.57.26])
	by smtp1.ptp.hp.com (Postfix) with ESMTP id C36083AC058
	for <linux-lvm@redhat.com>; Fri,  3 Feb 2006 20:55:46 +0000 (UTC)
Message-ID: <43E3C351.30009@cup.hp.com>
Date: Fri, 03 Feb 2006 12:55:45 -0800
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgchange -an question with disconnected disks
References: <43E24A37.6010801@cup.hp.com> <43E3B6B5.5080409@utsouthwestern.edu>
In-Reply-To: <43E3B6B5.5080409@utsouthwestern.edu>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Actually I was not asking this question in the context removing a disk. 
I was asking if you loose connectivity to a disk(s) unexpectitly.

Peter Smith wrote:
> John DeFranco wrote:
> 
>> I have a question regarding the behavior of vgchange -a n on lvm2 when 
>> there are disk failures. Specifically the following:
>>
>> 1. vgchange -a y vg00
>> 2. disconnect the disks
>> 3. vgchange -a n vg00
> 
> Are you doing this in the correct order?  Shouldn't you _de_activate the 
> VG _before_ removing the disks?  And besides, shouldn't you remove the 
> offending disks from the VG _before_ deactivating and then removing the 
> disks physically?  Or at least something equivalent.
> 
> 1.  vgreduce vg00 <offending disks>
> 2.  vgchange -a n vg00
> 3.  disconnect the disks
> 4.  vgchange -a y vg00
> 
> ...
> 
> Peter
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
===========
Cheers
-jd
