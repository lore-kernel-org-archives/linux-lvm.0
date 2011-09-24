Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8OJr7fK001428
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2011 15:53:07 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8OJr2aZ022075
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2011 15:53:03 -0400
Date: Sat, 24 Sep 2011 14:52:55 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110924145255.31498ee4@bettercgi.com>
In-Reply-To: <4E7DF8B1.7010100@autistici.org>
References: <4E5DFE51.7090304@autistici.org> <4E7DF8B1.7010100@autistici.org>
Mime-Version: 1.0
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
Cc: benry@autistici.org

.. also RTFM with a link to the right manual would be
> kindly appreciated (if you know that an answer for my question exist
> in the manual) ;)

man lvm | grep -5 partial


       -P | --partial
              When set, the tools will do their best to provide access
       to vol- ume groups that are only partially available (one or
       more physi- cal  volumes  belonging to the volume group are
       missing from the system).  Where part of a logical volume is
       missing,  /dev/ioer- ror  will  be  substituted, and you could
       use dmsetup (8) to set this up to return I/O errors when
       accessed, or create  it  as  a large  block  device of nulls.
       Metadata may not be changed with


You probably do not need:
man pvcreate | grep -2 uuid

       -u, --uuid uuid
              Specify the uuid for the device.  Without this option,
       pvcreate generates a random uuid.  All of your physical volumes
       must have unique uuids.  You need to use this option  before
       restoring  a backup  of LVM metadata onto a replacement device -
       see vgcfgre- store(8).


> LVM was configured to use sda and sdb in linear mode... not
> stripping... so theoretically data in sdb should be readable, right?

The data on sdb is there, but it's probably not a correct filesystem, 
so reading it may be difficult.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Sat, 24 Sep 2011 17:35:13 +0200
benry <benry@autistici.org> wrote:

> Hi,
> sorry for the top-posting, but in this case it seems a good choice...
> the situation evolved from my last post:
> 
> The sda raid was lost completely due to an hardware problem of the
> raid card, actually there is a new board and a new empty raid... how
> could I convince LVM to use it, in place of the old one? (the uuid are
> different), but moreover, can I restore in some way the content of the
> other raid that is still full of data?
> 
> LVM was configured to use sda and sdb in linear mode... not
> stripping... so theoretically data in sdb should be readable, right?
> 
> Please answer me... also RTFM with a link to the right manual would be
> kindly appreciated (if you know that an answer for my question exist
> in the manual) ;)
> 
> 
> Thanks in advance,
> 
> Enrico
> 
> 
> On 08/31/2011 11:26 AM, benry wrote:
> > Hi,
> > I'm quite new to LVM and I think to have a quite simple problem,
> > but I can not find a clear answer to it and, since it is a quite
> > critical problem, I'm asking to you for the right solution before
> > messing up everything.
> > 
> > I have an LVM volume made by two raid sda and sdb, with an XFS
> > filesystem on it; sda had a failure and its data is completely
> > lost... what I would like to do is to restore at least what is
> > contained in sdb. (The situation displayed by "lvdisplay -mP" is
> > reported at the end of this mail).
> > 
> > I tried this command: "vgchange -P -a y raid", but the device
> > /dev/raid/data does not exist and the /dev/mapper/raid-data I used
> > to mount the volume seems to be not accessible:
> > 
> > # xfs_check /dev/mapper/raid-data
> > xfs_check: /dev/mapper/raid-data is invalid (cannot read first 512
> > bytes)
> > 
> > Is the data contained in sdb recoverable? (as far as I understood,
> > it should) And if it is the case, which should be the right
> > procedure to restore it?
> > 
> > 
> > Thanks in advance for your help.
> > 
> > Enrico
> > 
> > # lvdisplay -mP
> >   Partial mode. Incomplete volume groups will be activated
> > read-only. /dev/sda: read failed after 0 of 4096 at 0: Input/output
> > error /dev/sda: read failed after 0 of 4096 at 0: Input/output error
> >   /dev/sda: read failed after 0 of 4096 at 19989989883904:
> > Input/output error
> >   /dev/sda: read failed after 0 of 4096 at 19989989941248:
> > Input/output error
> >   /dev/sda: read failed after 0 of 4096 at 0: Input/output error
> >   /dev/sda: read failed after 0 of 4096 at 4096: Input/output error
> >   /dev/sda: read failed after 0 of 4096 at 0: Input/output error
> >   Couldn't find device with uuid
> > 'AkLdC5-wPgi-hDbv-Sqf3-2wBv-hBzu-2OhDaQ'. /dev/sda: read failed
> > after 0 of 4096 at 0: Input/output error /dev/sda: read failed
> > after 0 of 4096 at 0: Input/output error Couldn't find device with
> > uuid 'AkLdC5-wPgi-hDbv-Sqf3-2wBv-hBzu-2OhDaQ'. --- Logical volume
> > --- LV Name                /dev/raid/data
> >   VG Name                raid
> >   LV UUID                4rjFt7-ZuQX-f3n4-iDVR-2gJv-5cFf-77gG5f
> >   LV Write Access        read/write
> >   LV Status              available
> >   # open                 0
> >   LV Size                36.36 TB
> >   Current LE             9531968
> >   Segments               2
> >   Allocation             inherit
> >   Read ahead sectors     auto
> >   - currently set to     256
> >   Block device           254:0
> > 
> >   --- Segments ---
> >   Logical extent 0 to 4765983:
> >     Type                linear
> >     Physical volume     unknown device
> >     Physical extents    0 to 4765983
> > 
> >   Logical extent 4765984 to 9531967:
> >     Type                linear
> >     Physical volume     /dev/sdb1
> >     Physical extents    0 to 4765983
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
