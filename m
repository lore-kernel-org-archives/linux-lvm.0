Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6DANeX2022316
	for <linux-lvm@redhat.com>; Tue, 13 Jul 2010 06:23:40 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6DANWiT012209
	for <linux-lvm@redhat.com>; Tue, 13 Jul 2010 06:23:32 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OYceC-0002Uk-0B
	for linux-lvm@redhat.com; Tue, 13 Jul 2010 03:23:32 -0700
Date: Tue, 13 Jul 2010 05:23:30 -0500
From: Ray Morris <support@bettercgi.com>
References: <4C29FE21.10600@tlinx.org>
	<20100713063413.GA14204@maude.comedia.it>
In-Reply-To: <20100713063413.GA14204@maude.comedia.it> (from
	bluca@comedia.it on Tue Jul 13 01:34:13 2010)
Message-Id: <1279016610.20637.0@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvremove: 'snapshot': can't remove 'active'? ,
 non-mounted file system
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

>> lvremove -v /dev/Home/2010.06.27-06.18.55
>>    Using logical volume(s) on command line
>>  Can't remove open logical volume "2010.06.27-06.18.55"

   Does it have a partition which needs to be "released"? with kpartx  
-dv?
Try ls -al /dev/Home/2010.06.27-06.18.55*
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 07/13/2010 01:34:13 AM, Luca Berra wrote:
> On Tue, Jun 29, 2010 at 07:07:29AM -0700, Linda A. Walsh wrote:
>> lvremove -v /dev/Home/2010.06.27-06.18.55
>>    Using logical volume(s) on command line
>>  Can't remove open logical volume "2010.06.27-06.18.55"
>> 
>> But it isn't mounted.
>> 
>> So why is it saying it is 'open':
> something is using it
> try looking in /sys/block/dm-4/holders, fuser, lsof ...
> 
>> ll /dev/mapper shows:
>> 
>> 
>> crw-rw---- 1  10, 58 2010-02-02 21:08 control
>> brw-r----- 1 252,  4 2010-02-02 21:08 Home-2010.06.27--06.18.55
>> brw-r----- 1 252,  3 2010-02-02 21:08 Home-2010.06.27--06.18.55-cow
>> brw-r----- 1 252,  2 2010-02-02 21:08 Home-Home
>> brw-r----- 1 252,  1 2010-02-02 21:08 Home-Home-real
>> brw-r----- 1 252,  0 2010-02-02 21:08 Home-Share
>> brw-r----- 1 252,  5 2010-02-02 21:08 Space-Backup
>> brw-r----- 1 252, 11 2010-06-29 06:40 Space-boot
>> brw-r----- 1 252,  6 2010-06-29 06:40 Space-root
>> brw-r----- 1 252,  7 2010-06-28 17:45 Space-Torrents
>> brw-r----- 1 252,  8 2010-06-29 06:40 Space-usr
>> brw-r----- 1 252,  9 2010-06-29 06:40 Space-var
>> brw-r----- 1 252, 10 2010-06-29 06:40 Space-var_cache
>> 
>> So 252 is the mapper device?
> 
> 252 is the dynamic major assigned to device-mapper on your system
> 
>> Is my real Home partition on 252,1?
> before you created the snapshot your Home device was
> /dev/mapper/Home-Home (aka dm-2)
> in order to create a snapshot lvm will use 4 devices
> 1) Home-Home-real (linear) which has the same mapping as Home-Home  
> before the
>    snapshot took place
> 2) Home-2010.06.27--06.18.55-cow (linear) which maps the space that  
> will
>    contains the COW data
> 3) Home-2010.06.27--06.18.55 (snapshot) this is a combination of (1)  
> and
>    (2) in order to show the visible snapshot
> 4) Home-Home (snapshot-origin) this device replaces your Home device
>    (keeping the same minor number)
> 
> so after taking the snapshot your Home device is still
> /dev/mapper/Home-Home, which maps to /dev/mapper/Home-Home-real, but
> before any write to /dev/mapper/Home-Home-real the original data is
> saved to Home-2010.06.27--06.18.55-cow, so Home-2010.06.27--06.18.55
> (which is based on Home-Home-real and Home-2010.06.27--06.18.55-cow)  
> will
> not change
> 
> please look also at linux/Documentation/device-mapper/snapshot.txt
> 
>> I just got a backup error when I tried to backup Home,
>> which would correspond to 252,2 above.  It thinks it
>> is no longer the same file system as the previous backup,
> details please
> 
>> Should I be backing up Home-Home-real?  That doesn't
>> seem right...
> usually one backs up the snapshot, which is supposed to be a
> point-in-time copy of the original, so i think you should backup
> Home-2010.06.27--06.18.55
> 
> L.
> 
>-- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
