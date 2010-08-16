Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7GD2v13026305
	for <linux-lvm@redhat.com>; Mon, 16 Aug 2010 09:02:58 -0400
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7GD2n1b016629
	for <linux-lvm@redhat.com>; Mon, 16 Aug 2010 09:02:49 -0400
Received: by qyk29 with SMTP id 29so1935641qyk.12
	for <linux-lvm@redhat.com>; Mon, 16 Aug 2010 06:02:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0b2501cb3cfd$e7c263e0$b7472ba0$@rit.edu>
References: <0b2501cb3cfd$e7c263e0$b7472ba0$@rit.edu>
Date: Mon, 16 Aug 2010 22:02:48 +0900
Message-ID: <AANLkTikk+_fTX1EhLMyM2hcy0pc0D10DDjSOb_PHS16v@mail.gmail.com>
From: Romeo Theriault <romeo.theriault@maine.edu>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Partition Recovery in LVM
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Aug 16, 2010 at 13:45, Andrew Ragone <ajr9166@rit.edu> wrote:
>
> I�ve been searching like crazy to find an answer to this question to no avail: when you restore a backup of LVM does the backup contain partition table information as well?

What kind of backup are you taking? Agent Client based or SAN snapshot based?

>
> I recently recovered an LVM that had a partition inside of it, but it has since been unable to mount. Most recovery utilities such as TestDisk will only find the LVM so I�m unsure of how to proceed and �recover� the partition.
>
>

I don't know the exact lvm commands off the top of my head, but first
I think you need to import the VG with something like 'vgimportclone'
and then once the volume group is imported you should be able to see
the partitions that reside in the VG. Not sure but you may need to run
a 'kpartx -a' to get the kernel to see the new partitions that are
available in the VG. Then I think it should be a matter of mounting
the partition in /dev/mapper/<VG>



>
> -Andrew
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



--
Romeo Theriault
System Administrator
Information Technology Services
Ph#: 207-561-3517
Em@: romeo@maine.edu
