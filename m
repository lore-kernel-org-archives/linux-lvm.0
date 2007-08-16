In-Reply-To: <Pine.LNX.4.64.0708162007140.3563@aski.hut.fi>
References: <1187283837.16162.2.camel@localhost.localdomain>
	<Pine.LNX.4.64.0708162007140.3563@aski.hut.fi>
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <0870FCC8-74FD-436C-8552-49AF7415ED99@networkingnewsletter.org.uk>
Content-Transfer-Encoding: 7bit
From: michael <cs@networkingnewsletter.org.uk>
Date: Thu, 16 Aug 2007 18:54:42 +0100
Subject: [linux-lvm] SOLVED: LVM pvmove problems
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: For users of Fedora <fedora-list@redhat.com>, debian-user@lists.debian.org


On 16 Aug 2007, at 18:08, Vesa-Pekka Palmu wrote:

> On Thu, 16 Aug 2007, michael wrote:
>
>> I'm trying to reduce a logical vol so that I can remove a HD from it.
>> However, I get errors with pvmove but I don't know why. I saw some  
>> old
>> postings with a kernel patch but the URL is extinct.
>>
>> I'm running Fedora: Linux xxx.phy.umist.ac.uk 2.6.22.1-41.fc7 #1  
>> SMP Fri
>> Jul 27 18:21:43 EDT 2007 x86_64 x86_64 x86_64 GNU/Linux
>>
>>
>> chris@veri:~$ sudo /usr/sbin/pvdisplay /dev/sdb1
>> Password:
>>   --- Physical volume ---
>>   PV Name               /dev/sdb1
>>   VG Name               VolGroup00
>>   PV Size               698.64 GB / not usable 10.34 MB
>>   Allocatable           yes
>>   PE Size (KByte)       32768
>>   Total PE              22356
>>   Free PE               19156
>>   Allocated PE          3200
>>   PV UUID               xDWUQB-wdEx-AtEs-YFkh-BKBR-7Jgd-9ik3p0
>>
>>
>> chris@veri:~$ sudo /usr/sbin/pvdisplay /dev/sda2
>>   --- Physical volume ---
>>   PV Name               /dev/sda2
>>   VG Name               VolGroup00
>>   PV Size               465.66 GB / not usable 3.56 MB
>>   Allocatable           yes
>>   PE Size (KByte)       32768
>>   Total PE              14901
>>   Free PE               14839
>>   Allocated PE          62
>>   PV UUID               GLGcHf-b3Ga-M61f-okkW-HaAk-Al7P-leVK91
>>
>>
>> chris@veri:~$ sudo /usr/sbin/pvmove /dev/sdb1
>>   Failure parsing mirror status fraction: 1 core
>>   Failure parsing mirror status fraction: 1 core
>>   ABORTING: Mirror percentage check failed.
>>
>>
>
> 2.6.22 has a bug in dm-mirror status reporting, and as lvm relies  
> on that to parse the progress of pvmove, it causes pvmove to fail,  
> use 2.6.21 or patch your kernel.

Thanks for clarifying what the bug is and that indeed pvmove will  
give these errors. As I said I can't find the patch but I've put a  
2.6.21 kernel on my system and now pvmove is doing the business.  
Thanks, Michael
