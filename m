Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JHNcZb001472
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:23:38 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JHNVNQ003029
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:23:31 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OEmzM-0001wD-Tc
	for linux-lvm@redhat.com; Wed, 19 May 2010 10:23:25 -0700
Date: Wed, 19 May 2010 12:23:23 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <4BF41884.4080000@alteeve.com> (from linux@alteeve.com on Wed
	May 19 11:57:40 2010)
Message-Id: <1274289803.16893.12@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

>> The partition table, although otherwise useless for LVM (and a pain  
>> when
>> trying to align PPs to some lower lever boundary), does serve the  
>> purpose
>> of telling other PC operating systems that there is something there.

   It's also useful during the boot process.  If, for example, you
later add another disk, this disk might become sdd, where it used to
be sdc.  That can confuse initrd and friends and result in an
unbootable system.  On almost every machine where I've skipped
creating partitions for RAID or LVM, this kind of thing has come
back to bite me later - maybe years later.  Now, I always create
"Linux LVM" partitions for LVM and "Linux raid autodetect" partitions
for RAID.  It makes booting an recovering much more reliable in
case of changes or problems.

>  a pain when trying to align PPs to some lower lever boundary

    A trick to avoid all of the math of alignment is to just
start the first partition on sector 512 every time, rather
than sector 63.  Sometimes you can save a few KB by doing the
math and finding a lower offset,  but it's just a few KB -
who cares.  That works because 512 sectors is 256KB - a
perfect multiple of any RAID size you might use.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 05/19/2010 11:57:40 AM, Digimer wrote:
> On 10-05-19 12:51 PM, Stuart D. Gathman wrote:
>> On Wed, 19 May 2010, kevin wrote:
>> 
>>>> If I were you, I would not bother with partition(s). I will add the
>>>> whole disk to LVM.
>>> 
>>> I intend for the entire disk to be used -- so I should just skip  
>>> the fdisk
>>> step?
>> 
>> Yes, just do the pvcreate directly on /dev/sdc (instead of  
>> /dev/sdc1).
>> 
>> I would only recommend this if the drive is permanently attached to  
>> your
>> server.  If there is any possibility of it getting moved to another  
>> system,
>> especially another OS, it is likely to appear "unformatted" and the  
>> other
>> OS will offer to create a partition table, etc, destroying the data.
>> The partition table, although otherwise useless for LVM (and a pain  
>> when
>> trying to align PPs to some lower lever boundary), does serve the  
>> purpose
>> of telling other PC operating systems that there is something there.
> 
> There ya go, I learn something new every day. :)
> 
>-- 
> Digimer
> E-Mail:         linux@alteeve.com
> AN!Whitepapers: http://alteeve.com
> Node Assassin:  http://nodeassassin.org
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
