Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0C5H53f015675
	for <linux-lvm@redhat.com>; Sun, 12 Jan 2014 00:17:05 -0500
Received: from vm08-mail01.alteeve.ca (mail.alteeve.ca [65.39.153.71])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0C5H2uc018739
	for <linux-lvm@redhat.com>; Sun, 12 Jan 2014 00:17:03 -0500
Message-ID: <52D2254D.5090802@alteeve.ca>
Date: Sun, 12 Jan 2014 00:17:01 -0500
From: Digimer <lists@alteeve.ca>
MIME-Version: 1.0
References: <1389500888.48728.YahooMailNeo@web161702.mail.bf1.yahoo.com>	<52D21B4F.50504@alteeve.ca>
	<1389502767.50207.YahooMailNeo@web161703.mail.bf1.yahoo.com>
In-Reply-To: <1389502767.50207.YahooMailNeo@web161703.mail.bf1.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Logical Volume Inaccessible
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
To: Tom+Dale <tdmyth@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 11/01/14 11:59 PM, Tom+Dale wrote:
>
>> What does 'pvscan; vgscan; lvscan' show? If the LVs show 'inactive', try
>
>> 'lvchange -ay <lv_path>', then 'lvscan' should show the LV as 'ACTIVE'.
>> If so, try mounting the LV.
>> --
>> Digimer
>> Papers and Projects: https://alteeve.ca/w/
>> What if the cure for cancer is trapped in the mind of a person without
>> access to education?
>
> Here is what I got:
>
> [root@localhost ~]# pvscan
>    /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
>    /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
>    /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
>    No matching physical volumes found
> [root@localhost ~]# lvscan
>    /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
> [root@localhost ~]# vgscan
>    Reading all physical volumes.  This may take a while...
>    /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
>    /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
>    /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
> [root@localhost ~]# lvchange -ay /dev/sda2
>    /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
>    /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
>    /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
>    /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
>    Volume group "sda2" not found
>    Skipping volume group sda2
> [root@localhost ~]#

Eep,

   That looks like the drive might be failing. If you don't have a good 
backup, then you might want to stop. If the data on the drive is very 
valuable, I would do nothing more and call a data recovery house. If 
that's not feasible, then the first thing I would do is connect another 
drive of equal or larger size and dd the bad drive to the other drive.

   For example, if the bad drive comes up as /dev/sdb and the 
spare/backup drive comes up as /dev/sdc, you would want to run something 
like 'dd if=/dev/sdb of=/dev/sdc bs=8k'. That will clone, byte for byte, 
sdb onto sdc (and erase whatever was on sdc, of course). Then set aside 
the failing drive and try to recover the data on sdc (possibly copy it 
again to a 3rd drive, just to be extra safe). This way, if something 
goes wrong, you can start over.



-- 
Digimer
Papers and Projects: https://alteeve.ca/w/
What if the cure for cancer is trapped in the mind of a person without 
access to education?
