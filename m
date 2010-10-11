Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9BMYiWZ019663
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 18:34:44 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9BMYXLl032755
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 18:34:34 -0400
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1P5Qwr-0001iT-Kq
	for linux-lvm@redhat.com; Mon, 11 Oct 2010 15:34:25 -0700
Date: Mon, 11 Oct 2010 17:34:24 -0500
From: Ray Morris <support@bettercgi.com>
References: <1286834941.5515.4.camel@MobileOne>
In-Reply-To: <1286834941.5515.4.camel@MobileOne> (from lists@amadron.com on
	Mon Oct 11 17:09:01 2010)
Message-Id: <1286836464.8289.0@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Can't mount LV on fakeraid mirror
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

    I wonder what pvdisplay and vgchnage -ay would
say, but before doing anything else I'd make another
backup of the files iif possible, or make an image
of at least one of the drives.  It looks like something
may have changed with the RAID, such as storing the
metadata at the end versus the beginning, but before
messing with anything that could possibly make any
chnages on the disks make a straight dd image, as any
changes you make could bad.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 10/11/2010 05:09:01 PM, Mike Reed wrote:
> Hi,
> I was using a fakeraid mirror with LVM for backups (don't ask) and  
> after
> an upgrade from ubuntu 8.10 to ubuntu 9.04, the switch to grub2 broke  
> my
> system.
> Before doing anything I wanted to check I could still see my backups  
> on
> the mirror.
> I'm using Ubuntu 10.04 Live CD. I boot up and:
> 
> # sudo su
> # apt-get install lvm2
> ...
> 
> So far so good. Then
> 
> # lvdisplay
> --- Logical volume ---
> LV Name /dev/VolGroup01/LogVol02
> VG Name VolGroup01
> LV UUID tyP51S-EMOO-UCfE-4MSy-TA9f-xaJh-SMMnk9
> LV Write Access read/write
> LV Status NOT available
> LV Size 465.76 GiB
> Current LE 119234
> Segments 1
> Allocation inherit
> Read ahead sectors auto
> 
> Hmmm... it says "NOT available" and indeed, I can't mount it.
> 
> # mkdir home
> # mount /dev/VolGroup01/LogVol02 home
> mount: special device /dev/VolGroup01/LogVol02 does not exist
> 
> I checked the raid sets:
> 
> # dmraid -s pdc_bbbad
> /dev/sdb: "sil" and "pdc" formats discovered (using pdc)!
> /dev/sdc: "sil" and "pdc" formats discovered (using pdc)!
> *** Active Set
> name : pdc_bbbad
> size : 976562432
> stride : 128
> type : mirror
> status : ok
> subsets: 0
> devs : 2
> spares : 0
> 
> It says "ok". I also check through dmsetup:
> 
> # dmsetup info pdc_bbbad
> Name: pdc_bbbad
> State: ACTIVE
> Read Ahead: 256
> Tables present: LIVE
> Open count: 0
> Event number: 1
> Major, minor: 252, 0
> Number of targets: 1
> UUID: DMRAID-pdc_bbbad
> 
> It says "ACTIVE" and the tables present are "LIVE". Why is my logical
> volume not available?
> 
> I then tried:
> 
> # partprobe
> Error: Can't have a partition outside the disk!
> Warning: Unable to open /dev/sr0 read-write (Read-only file
> system). /dev/sr0 has been opened read-only.
> 
> Now that first error I'd seen a while back even when I could mount the
> LV. Now:
> 
> # lvdisplay
> --- Logical volume ---
> LV Name /dev/VolGroup01/LogVol02
> VG Name VolGroup01
> LV UUID tyP51S-EMOO-UCfE-4MSy-TA9f-xaJh-SMMnk9
> LV Write Access read/write
> LV Status suspended
> # open 0
> LV Size 465.76 GiB
> Current LE 119234
> Segments 1
> Allocation inherit
> Read ahead sectors auto
> - currently set to 256
> Block device 252:4
> 
> Status is "suspended". Hmmm, looks slightly more hopefule, but:
> 
> # lvm lvchange -ay /dev/VolGroup01/LogVol02
> device-mapper: resume ioctl failed: Invalid argument
> Unable to resume VolGroup01-LogVol02 (252:4)
> 
> Before I tried to mount my LV with the backups I knew little about LV  
> (I
> remember using some graphical tool to set it up years ago and hadn't
> touched it since), and new nothing about dmraid or dmsetup so now I'm
> stuck.
> Really want to check my backup mirror LV before doing anything else so
> would really appreciate if someone can give me some pointers as to  
> what
> to do next.
> 
> Thanks,
> Mike.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
