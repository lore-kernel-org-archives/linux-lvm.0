Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o82FMX6N022525
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2010 11:22:33 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o82FMKoA031468
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2010 11:22:21 -0400
Received: from sdg.bmsi.com ([192.168.9.34]) (authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o82FMJRo000647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2010 11:22:20 -0400
Message-ID: <4C7FC12B.40009@bmsi.com>
Date: Thu, 02 Sep 2010 11:22:19 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <mailman.25972.1283360318.9817.linux-lvm@redhat.com>
	<2E9263050F8EE046972BE0510E7A71DA03D99F3C@SH-EXCHBE2.master.lsuhsc.edu>
In-Reply-To: <2E9263050F8EE046972BE0510E7A71DA03D99F3C@SH-EXCHBE2.master.lsuhsc.edu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] HDD failure - please help!
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

On 09/02/2010 07:50 AM, Patterson, James wrote:
>> If you wanted RAID5, your best bet on linux is the md driver.
>> Or else a hardware RAID controller.
>>      
> I don't/didn't want RAID.
>    

Based on your expectations, I think you *do* want at least RAID1.  Raid 
1 is simple to administer
and understand.
>> your first step is getting a copy of the metadata.
>> There should be a copy at the beginning of each drive.
>>      
> Yes. How do I access it? None of the drives will mount. I am thinking here that I should create a special boot disk with the LVM tools on it (they are not present on the FC11 boot iso, afaik).
>    
You don't mount the PVs.   Use the metadata extraction tool, I don't 
remember the name atm.
If this was your boot filesystem, then you will need a LiveCD or new 
install.  Since you will need a new disk anyway, I suggest you get the 
new disk that is *bigger* than the failing drive and install to it (but 
*not* overwriting the others) and leave a partition big enough to 
contain the PV from the failing drive.  Remove the failing drive, and 
access it via USB - even if you have another drive slot.  By taking 
steps to keep it as cold as possible during recovery, you can coax a few 
more sectors out of it.
>> then you should look back a month or so in the archives
>>      
> I looked...could you please be a bit more specific? I didn't see anything.
>    
This should get you started:  
https://www.redhat.com/archives/linux-lvm/2010-July/msg00057.html
> Well, truly, the only thing I've learned is never to use LVM if it's 
> going to cause me to lose data on all 5 drives when one goes down. The 
> logic behind it's use appears to be to just make life "easier"
With jbod (which you likely have), the failure scenario is exactly the 
same whether you have 1 disk or 5.  Part of your filesystem gets 
trashed, and you have to use low level tools to recover what remains if 
you don't have backups.

What having 5 disks *does* do is make failure more likely.  Suppose the 
probability of 1 disk *not* failing in a given year is .999 (3 sigmas).  
With jbod, the LV fails if *any* of the disks fail.  The probability 
that none of them fail in a given year would then be .999^5 ~= .995.  
Your array is less reliable.

By using RAID, you can make the array more reliable.  RAID works by 
using multiple copies of data so that you don't lose anything on a 
single drive failure.
