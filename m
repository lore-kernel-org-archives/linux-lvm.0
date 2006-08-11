Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BHOvPI019654
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 13:24:57 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BHOun0016519
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 13:24:57 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k7BHOra13833
	for linux-lvm@redhat.com; Fri, 11 Aug 2006 18:24:53 +0100
Date: Fri, 11 Aug 2006 18:24:53 +0100
From: paddy <paddy@panici.net>
Subject: Re: [linux-lvm] LVM2 on hardware RAID
Message-ID: <20060811172450.GA12021@cobalt0.panici.net>
References: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7C@exchange2k.lims.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7C@exchange2k.lims.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Aug 11, 2006 at 12:48:42PM -0400, Musil, William wrote:
> Hello all.
> 
> I have an issue, that I am not sure how to address.
> 
> How can I resize the physical volume if I change the geometry of the disk
> (non-destructive resize of RAID volume at the hardware level) 
> I can see that the OS has picked up the new size of the disk and I would like
> to resize the existing pv. I don't know how.
> 
> I started with a hardware raid 5 (400GB), linux automatically recognizes disk
> as /dev/sdb
> 
> a simplistic representation of the setup is as follows
> 
> pvcreate /dev/sdb
> vgcreate VolGroup10 /dev/sdb
> lvcreate -n LogVol10 VolGroup10
> mkfs.ext3 /dev/mapper/VolGroup10-LogVol10
> 
> I have added a disk and expand the array to 600GB I can still see every thing
> but I don't know how to extend the PV.
> 
> filesystems OK
> logical volumes OK
> volume groups OK
> 
> linux sees /dev/sdb as 600GB
> pvs shows pv /dev/sdb is 400GB. I wish to, non-destructively, reinitialize
> /dev/sdb so that pvs shows 600GB. how?

online or offline ?

I'm not aware of any tool that will resize your PV online.  I can't immediately
think that it would be hugely difficult, but it's a piece of work :-)

as for offline, you could do that in an afternoon with shell and dd :-)

Other possible strategies include, having partitioned your raid in the first
place (yes I know this is silly, but you can see what I mean), or perhaps
converting to some other VM software that can do what you need (like, will
EVMS do this??)  Perhaps there is a way to emulate the 'having partitioned
first strategy' and make the new 200G addressable as a seperate block
device, at which point a pvmerge command would come in handy :-)
(of course that would be easier if the PEs were PE size aligned to the
underlying device, but you could take account of that in where you 
started your new PV :-)

Or perhaps some kind soul will point you to something I have missed.

Good Luck.

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall
