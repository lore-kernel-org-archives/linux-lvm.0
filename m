Received: from o.ww.redhat.com (vpn50-7.rdu.redhat.com [172.16.50.7])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i31DmYmX019566
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 15:48:34 +0200
Date: Thu, 1 Apr 2004 15:48:33 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] lvm 1 unable to boot
Message-ID: <20040401134833.GG29222@redhat.com>
References: <1080745179.12286.16.camel@lupin.private.cimr.cam.ac.uk>
	<20040331154915.GD27360@tykepenguin.com>
	<1080765764.12286.20.camel@lupin.private.cimr.cam.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1080765764.12286.20.camel@lupin.private.cimr.cam.ac.uk>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 31, 2004 at 09:42:44PM +0100, Geoff Dolman wrote:
> On Wed, 2004-03-31 at 16:49, Patrick Caulfield wrote:
> > On Wed, Mar 31, 2004 at 03:59:39PM +0100, Geoff Dolman wrote:
> > > Hi
> > > 
> > > I have a machine with the following partition structure:
> > > 
> > > /dev/sda1 /boot (ext3)
> > > /dev/sda2 swap
> > > /dev/sda3 LVM
> > > 
> > > The LVM (1.03/rh9) contains one PV and this has Volume00 in it which
> > > contains lvs for slash, usr, var, /usr/local and so on...
> > > 
> > > I rebooted the machine for the first time in ages (same kernel
> > > configuration as the last reboot and no changes - or very few).
> > > 
> > > The machine won't reboot - it panics because of a message (something)
> > > like:
> > > 
> > > vgscan found inactive "Volume00"
> > > Error 28 Unable to make /etc/lvmtab.d/Volume00/Volume00.tmp
> > > vg_cfgbackup.c line 273
> > > 
> > 
> > Error 28 is ENOSPC - your initrd is too small to hold the metadata backups.
> 
> Thanks - but how do I fix this?

Append the kernel boot parameter "ramdisk_size=" and give a size in kilobytes
(eg, 'ramdisk_size=16384' makes 16MB ram disks.

> 
> cheers
> 
> Geoff
> 
> -- 
> JDRF/WT Diabetes and Inflammation Laboratory
> Cambridge Institute for Medical Research
> University of Cambridge
> http://www-gene.cimr.cam.ac.uk/todd/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
