Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7GEP1ZR019840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 Aug 2010 10:25:02 -0400
Message-ID: <4C694A3C.3090007@redhat.com>
Date: Mon, 16 Aug 2010 15:25:00 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <0b2501cb3cfd$e7c263e0$b7472ba0$@rit.edu>
	<AANLkTikk+_fTX1EhLMyM2hcy0pc0D10DDjSOb_PHS16v@mail.gmail.com>
In-Reply-To: <AANLkTikk+_fTX1EhLMyM2hcy0pc0D10DDjSOb_PHS16v@mail.gmail.com>
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

On 08/16/2010 02:02 PM, Romeo Theriault wrote:
> On Mon, Aug 16, 2010 at 13:45, Andrew Ragone <ajr9166@rit.edu> wrote:
>>
>> I�ve been searching like crazy to find an answer to this question to no avail: when you restore a backup of LVM does the backup contain partition table information as well?
> 
> What kind of backup are you taking? Agent Client based or SAN snapshot based?
> 
>>
>> I recently recovered an LVM that had a partition inside of it, but it has since been unable to mount. Most recovery utilities such as TestDisk will only find the LVM so I�m unsure of how to proceed and �recover� the partition.
>>
>>
> 
> I don't know the exact lvm commands off the top of my head, but first
> I think you need to import the VG with something like 'vgimportclone'

Only if you're backing up the VG by cloning the storage (SAN clone/snap,
dd image, MD split mirror etc.).

> and then once the volume group is imported you should be able to see
> the partitions that reside in the VG. Not sure but you may need to run
> a 'kpartx -a' to get the kernel to see the new partitions that are
> available in the VG. Then I think it should be a matter of mounting
> the partition in /dev/mapper/<VG>

This is only needed if the LVs contain partition tables themselves (e.g.
VM storage). Any partitions containing PVs on the cloned storage should
be detected automatically by the kernel.

Regards,
Bryn.
