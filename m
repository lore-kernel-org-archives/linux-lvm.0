Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1DIEWi06049
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 13:14:32 -0500
Received: from demonserver.de (p15093797.pureserver.info [217.160.109.186])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1DIEVb15190
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 13:14:31 -0500
Received: from demonlord.de (160.12.204.212.sr1.DTM1.ip.versanet.de [212.204.12.160])
	(authenticated bits=0)
	by demonserver.de (8.12.8/8.12.8) with ESMTP id i1DIEQK8015157
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 19:14:26 +0100
Message-ID: <402D1432.8030003@demonlord.de>
From: Christian Reiss <email@demonlord.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Problems :)
References: <402CD9E4.8070402@demonlord.de> <20040213143846.GB10943@redhat.com> <402D0433.5000909@demonlord.de> <20040213173203.GA13188@redhat.com>
In-Reply-To: <20040213173203.GA13188@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig643D5FDA32DC6D3B15692277"
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 13:13:04 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig643D5FDA32DC6D3B15692277
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Greetings again,

Yes, of course it was not a rogue lvm ;)
Fun is a must, eh?

Anyway,
Here is my recipe of shrinking the lvm.
I hope i got it right, now with the e2fsadm thingy:

1. unmount it
2. e2fsadm -L-(SIZE)G /dev/share/data
3. pvmove /dev/(HDD)
4. vgchange -a n ; vgchange -x y
5. vgreduce share /dev/(HDD)
6. vgchange -x n ; vgchange -a y
7. fdisk /dev/(HDD)
8. mkfs.ext2 auf /dev/(HDD)
9. Copy files to reduce data amount on LVM
10. repeat

Or am i missing anything? :)
If not, i will spent some hours of GREAT FUN
shrinking it. Ahh, the fsck's, movings and.. :)

-Christian.
BTW: Awesome support! :)




Heinz Mauelshagen wrote:
> On Fri, Feb 13, 2004 at 06:06:59PM +0100, Christian Reiss wrote:
> 
>>Greetings again,
>>
>>Curious, I replied, but did not recive a copy of my reply,
>>maybe it got lost in the internet? :) Killed by a rogue lvm,
>>I assume ;) - If this was/is only me missing my reply, then
>>I am deeply sorry for spamming - not intentionally, really.
> 
> 
> Christian,
> 
> as long as you agree that it wasn't LVM it is no problem ;-)
> 
> 
>>---
>>
>>Hi there!
>>
>>Big thanks for the very fast answer!!
>>Much appreciated!
>>
>>Just to be VERY sure, tune2fs -l says:
>>
> 
> <SNIP>
> 
>>Block count:              250576896
> 
> <SNIP>
> 
>>Block size:               4096
> 
> <SNIP>
> 
>>So What lvreduce size should i use to shrink it?
>>I better have a guru look over it, better safe than
>>sorry
> 
> 
> 250576896 * 4KB / 1024MB/KB= 978816MB (which is a multiple of 32MB)
> 
> ->
> 
> # lvreduce -L 978816M /dev/share/data
> 
> That should free 112640MB or 3520 PEs in your VG.
> 
> 
> BTW: you should either run e2fsadm to grow/shrink the unmounted
>      filesystem _and_ the logical volume in one go
>      -or-
>      use the filesystem resizer and lvextend/lvreduce in the correct order
>      (lvextend + grow fs -or- shrink fs + lvreduce).
> 
>      Problem with the later is getting the size arguments right ;-)
> 
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> 
> 
> 
>>-Christian.
>>
>>Heinz Mauelshagen wrote:
>>
>>
>>>Christian,
>>>
>>>the size of your filesystem and logical volume differs already.
>>>That's why e2fsadm fails.
>>>Did you eventually run resize2fs in order to shrink the filesystem ?
>>>
>>>Your logical volume size is 1091456MB (32MB/PE * 34108 PE) but your
>>>filesystem size is 963584GB (941GB * 1024MB/GB; check with
>>>"tune2fs -l" and look for the block count and block size to calculate
>>>this correctly).
>>>
>>>In case the result shows, that your filesystem is already smaller 
>>
>>than the LV,
>>
>>>lvreduce the logical volume appropriately.
>>>
>>>Use the block count * block size result and round it up to the next PE!
>>>
>>>Regards,
>>>Heinz    -- The LVM Guy --
>>>
>>>
>>>
>>>
>>>On Fri, Feb 13, 2004 at 03:06:28PM +0100, Christian Reiss wrote:
>>>
>>>
>>>>Greetings!
>>>>
>>>>I am trying to dissolve a running LVM, so i am doing
>>>>the e2fsadm, lvreduce, pvmove thingy. But ever since I
>>>>removed the first hdd, I am unable to resize the lvm
>>>>any more. The error can be seen below, with e2fsadm.
>>>>I also included the vg&lvdisplay commands.
>>>>
>>>>I am running the LVM1 sources (non-cvs, approx mid last
>>>>year), as i am unable to run LVM2 (need to downgrade kernel
>>>>to 2.4.22 (no patch included in lvm2 for 2.4.23)).
>>>>Also, I am (too dumb/unable) to locate a e2fsadm alike
>>>>tool for lvm2, as e2fsadm needs the lvm-tab thingy,
>>>>which lvm2 no longer provides.
>>>>
>>>>Any help is greatly appreciated.
>>>>
>>>>-Christian.
>>>>
>>>>
>>>>::::::::::::::::::
>>>>::: vgdisplay ::::
>>>>
>>>>--- Volume group ---
>>>>VG Name               share
>>>>VG Access             read/write
>>>>VG Status             available/NOT resizable
>>>>VG #                  0
>>>>MAX LV                256
>>>>Cur LV                1
>>>>Open LV               1
>>>>MAX LV Size           2 TB
>>>>Max PV                256
>>>>Cur PV                11
>>>>Act PV                11
>>>>VG Size               1.12 TB
>>>>PE Size               32 MB
>>>>Total PE              36668
>>>>Alloc PE / Size       34108 / 1.04 TB
>>>>Free  PE / Size       2560 / 80 GB
>>>>VG UUID               PSYbaQ-bl8d-xvHp-6re2-hoKd-9mE5-Wa5Tqz
>>>>
>>>>:::::::::::::::
>>>>:: lvdisplay ::
>>>>
>>>>--- Logical volume ---
>>>>LV Name                /dev/share/data
>>>>VG Name                share
>>>>LV Write Access        read/write
>>>>LV Status              available
>>>>LV #                   1
>>>># open                 1
>>>>LV Size                1.04 TB
>>>>Current LE             34108
>>>>Allocated LE           34108
>>>>Allocation             next free
>>>>Read ahead sectors     1024
>>>>Block device           58:0
>>>>
>>>>:::::::::::::
>>>>:: e2fsadm ::
>>>>
>>>>e2fsadm -L-10G /dev/share/data
>>>>e2fsadm -- logical volume size for "/dev/share/data" invalid
>>>>
>>>>:::::::::::
>>>>:: df -h ::
>>>>
>>>>Filesystem            Size  Used Avail Use% Mounted on
>>>>/dev/share/data       941G  910G   32G  97% /share/filebase
>>>>
>>>>
>>>>--
>>>>Christian Reiss <email@demonlord.de>
>>>>demonserver.de
>>>>
>>>>Key fingerprint = 2999 B7CD A218 06DF D658  5BE3 18B6 B232 02FF 71B2
>>>>Public Key can be obtained here: http://www.demonlord.de/pgp.txt
>>>
>>>
>>>
>>>*** Software bugs are stupid.
>>>    Nevertheless it needs not so stupid people to solve them ***
>>>
>>>
>>
>>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>>
>>>Heinz Mauelshagen                                 Red Hat, Inc.
>>>Consulting Development Engineer                   Am Sonnenhang 11
>>>                                                  56242 Marienrachdorf
>>>                                                  Germany
>>>Mauelshagen@RedHat.com                            +49 2626 141200
>>>                                                       FAX 924446
>>>
>>
>>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>>
>>>_______________________________________________
>>>linux-lvm mailing list
>>>linux-lvm@redhat.com
>>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>>-- 
>>Christian Reiss <email@demonlord.de>
>>demonserver.de
>>
>>Key fingerprint = 2999 B7CD A218 06DF D658  5BE3 18B6 B232 02FF 71B2
>>Public Key can be obtained here: http://www.demonlord.de/pgp.txt
> 
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Red Hat, Inc.
> Consulting Development Engineer                   Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@RedHat.com                            +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


-- 
Christian Reiss <email@demonlord.de>
demonserver.de

Key fingerprint = 2999 B7CD A218 06DF D658  5BE3 18B6 B232 02FF 71B2
Public Key can be obtained here: http://www.demonlord.de/pgp.txt

--------------enig643D5FDA32DC6D3B15692277
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFALRQ0GLayMgL/cbIRAkS1AKChbamAGZYjKccPmqOgOiunbstYhQCg1fyu
itytn0eCgqOQPsh2ZWNEWSs=
=Fsr9
-----END PGP SIGNATURE-----

--------------enig643D5FDA32DC6D3B15692277--
