Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAAIwJ96016589
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 13:58:19 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAAIw8qj029213
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 13:58:08 -0500
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1PGFry-00080H-H6
	for linux-lvm@redhat.com; Wed, 10 Nov 2010 10:58:07 -0800
Date: Wed, 10 Nov 2010 12:58:01 -0600
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <4CDADCC8.9030400@gmail.com> (from raubvogel@gmail.com on Wed
	Nov 10 11:56:24 2010)
Message-Id: <1289415481.17929.9@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Bad disk?
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

On 11/10/2010 11:56:24 AM, Mauricio Tavares wrote:

> How can I find which drive /dev/dm-0 is?

Try:
  cat /sys/block/dm-0/dm/name

On my system, I created dm2device so I can tell which snapshot is
full or whatever device has a problem:

# cat /usr/local/bin/dm2device
#!/bin/sh

cat /sys/block/$1/dm/name

--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 11/10/2010 11:56:24 AM, Mauricio Tavares wrote:
> On 11/10/2010 10:11 AM, Phillip Susi wrote:
>> On 11/10/2010 9:39 AM, Mauricio Tavares wrote:
>>> Yesterday I added a hard drive (to put extra stuff on it) to my  
>>> ubuntu
>>> 10.10 box and created a LVM in it. Then copied some files to it and
>>> restarted the machine to see if it would mount into the right
>>> mountpoint. It didn't. So I decided to see if it was there (vg in
>>> question is export):
>> 
>> None of the errors you posted mention a physical disk at all, so  
>> there
>> isn't anything wrong with them.  To find out what dm-0 is you need to
>> poke around with dmsetup.
> 
> 	Now that might be interesting since I honestly do not know how  
> to use it (and my google-fu seems weak today). But this is a bit more  
> info I found:
> 
> raub@strangepork:~$ sudo pvs -a
>   /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
>   /dev/dm-0: read failed after 0 of 4096 at 429496664064:  
> Input/output error
>   /dev/dm-0: read failed after 0 of 4096 at 429496721408:  
> Input/output error
>   /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
>   /dev/dm-0: read failed after 0 of 4096 at 4096: Input/output error
>   /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
>   PV         VG     Fmt  Attr PSize   PFree
>   /dev/dm-0              --        0       0
>   /dev/dm-1  root   lvm2 a-   277.05g 192.55g
>   /dev/dm-2              --        0       0
>   /dev/dm-3              --        0       0
>   /dev/dm-4              --        0       0
>   /dev/dm-5              --        0       0
>   /dev/ram0              --        0       0
>   /dev/ram1              --        0       0
>   /dev/ram10             --        0       0
>   /dev/ram11             --        0       0
>   /dev/ram12             --        0       0
>   /dev/ram13             --        0       0
>   /dev/ram14             --        0       0
>   /dev/ram15             --        0       0
>   /dev/ram2              --        0       0
>   /dev/ram3              --        0       0
>   /dev/ram4              --        0       0
>   /dev/ram5              --        0       0
>   /dev/ram6              --        0       0
>   /dev/ram7              --        0       0
>   /dev/ram8              --        0       0
>   /dev/ram9              --        0       0
>   /dev/root              --        0       0
>   /dev/sda1              --        0       0
>   /dev/sda3              --        0       0
>   /dev/sdc1  export lvm2 a-   465.76g  65.76g
> raub@strangepork:~$
> 
> FYI, the root vg in inside /dev/sda3, which is an encrypted  
> partition. How can I find which drive /dev/dm-0 is?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
