Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8OFZLM1014073
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2011 11:35:21 -0400
Received: from latitanza.investici.org (latitanza.investici.org
	[82.94.249.234])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8OFZFFJ022487
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2011 11:35:16 -0400
Received: from [82.94.249.234] (latitanza [82.94.249.234]) (Authenticated
	sender: benry@autistici.org) by localhost (Postfix) with
	ESMTPSA id 3694698553
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2011 15:35:14 +0000 (UTC)
Message-ID: <4E7DF8B1.7010100@autistici.org>
Date: Sat, 24 Sep 2011 17:35:13 +0200
From: benry <benry@autistici.org>
MIME-Version: 1.0
References: <4E5DFE51.7090304@autistici.org>
In-Reply-To: <4E5DFE51.7090304@autistici.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] simple LVM disk failure recover
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,
sorry for the top-posting, but in this case it seems a good choice...
the situation evolved from my last post:

The sda raid was lost completely due to an hardware problem of the raid
card, actually there is a new board and a new empty raid... how could I
convince LVM to use it, in place of the old one? (the uuid are
different), but moreover, can I restore in some way the content of the
other raid that is still full of data?

LVM was configured to use sda and sdb in linear mode... not stripping...
so theoretically data in sdb should be readable, right?

Please answer me... also RTFM with a link to the right manual would be
kindly appreciated (if you know that an answer for my question exist in
the manual) ;)


Thanks in advance,

Enrico


On 08/31/2011 11:26 AM, benry wrote:
> Hi,
> I'm quite new to LVM and I think to have a quite simple problem, but I
> can not find a clear answer to it and, since it is a quite critical
> problem, I'm asking to you for the right solution before messing up
> everything.
> 
> I have an LVM volume made by two raid sda and sdb, with an XFS
> filesystem on it; sda had a failure and its data is completely lost...
> what I would like to do is to restore at least what is contained in sdb.
> (The situation displayed by "lvdisplay -mP" is reported at the end of
> this mail).
> 
> I tried this command: "vgchange -P -a y raid", but the device
> /dev/raid/data does not exist and the /dev/mapper/raid-data I used to
> mount the volume seems to be not accessible:
> 
> # xfs_check /dev/mapper/raid-data
> xfs_check: /dev/mapper/raid-data is invalid (cannot read first 512 bytes)
> 
> Is the data contained in sdb recoverable? (as far as I understood, it
> should) And if it is the case, which should be the right procedure to
> restore it?
> 
> 
> Thanks in advance for your help.
> 
> Enrico
> 
> # lvdisplay -mP
>   Partial mode. Incomplete volume groups will be activated read-only.
>   /dev/sda: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sda: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sda: read failed after 0 of 4096 at 19989989883904: Input/output
> error
>   /dev/sda: read failed after 0 of 4096 at 19989989941248: Input/output
> error
>   /dev/sda: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sda: read failed after 0 of 4096 at 4096: Input/output error
>   /dev/sda: read failed after 0 of 4096 at 0: Input/output error
>   Couldn't find device with uuid 'AkLdC5-wPgi-hDbv-Sqf3-2wBv-hBzu-2OhDaQ'.
>   /dev/sda: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sda: read failed after 0 of 4096 at 0: Input/output error
>   Couldn't find device with uuid 'AkLdC5-wPgi-hDbv-Sqf3-2wBv-hBzu-2OhDaQ'.
>   --- Logical volume ---
>   LV Name                /dev/raid/data
>   VG Name                raid
>   LV UUID                4rjFt7-ZuQX-f3n4-iDVR-2gJv-5cFf-77gG5f
>   LV Write Access        read/write
>   LV Status              available
>   # open                 0
>   LV Size                36.36 TB
>   Current LE             9531968
>   Segments               2
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           254:0
> 
>   --- Segments ---
>   Logical extent 0 to 4765983:
>     Type                linear
>     Physical volume     unknown device
>     Physical extents    0 to 4765983
> 
>   Logical extent 4765984 to 9531967:
>     Type                linear
>     Physical volume     /dev/sdb1
>     Physical extents    0 to 4765983

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
