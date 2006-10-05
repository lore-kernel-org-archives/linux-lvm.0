Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k95C8Vfo003144
	for <linux-lvm@redhat.com>; Thu, 5 Oct 2006 08:08:31 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k95C8O53021666
	for <linux-lvm@redhat.com>; Thu, 5 Oct 2006 08:08:24 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k95C8MR27337
	for linux-lvm@redhat.com; Thu, 5 Oct 2006 13:08:22 +0100
Date: Thu, 5 Oct 2006 13:08:22 +0100
From: paddy <paddy@panici.net>
Subject: Re: [linux-lvm] Re: Serious LVM Problem
Message-ID: <20061005120810.GA25595@cobalt0.panici.net>
References: <20061004191008.70E6A731BD@hormel.redhat.com>
	<20061004191947.95695.qmail@web53014.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061004191947.95695.qmail@web53014.mail.yahoo.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Oct 04, 2006 at 12:19:47PM -0700, TNJazzGrass wrote:
> Unfortunately, I don't have any idea what to do to
> accomplish this, or if I can even do it.
> 
> I created them with Disk Druid on FC3 a couple of
> years ago and pretty much hadn't touched the machine
> at all since then.  When I "upgraded" to FC5 a couple
> of weeks ago, I unchecked all the boxes for the data
> drives (hdb, hdd, hde, hdf and hdg) so they should
> have been set to "do not format, keep existing data"
> but I can't remember exactly what I did with hda
> (which was also part of the array - at least some of
> it).  
> 
> The box has been sitting in the corner for a month or
> so while I try to figure out if it's salvageable.  I
> have not done anything with it since FC5 was loaded,
> except attempt to attach the Physical Volumes to the
> LVM using the LVM Management GUI.
> 
> So I'm not sure what you mean by "restore the LV's
> back" or how I would go about doing it.
> 
> I *may* have destroyed part of the array by
> reinstalling the OS on /dev/hda...although I'm not
> sure how it was set up in the first place.
> 
> If this is the case though, is the data that was on
> the other physical volumes still actually accessible
> in some way?  At this point I'm ready to start over,
> but not before I've exhausted all my options.

next question is what were the PVs

if the PVs were the whole drives hdb, hdd, hde, hdf and 
hdg (and possibly also all or some of hda), then quite 
a lot of metadata should be available there.

pvscan might help you here ?

IIRC, if you have some PVs, then you should have a copy 
of the table in those that will tell you what PVs there
were in the VG.

supposing you have say 5 PVs out of 6 intact then there
is a next step, but I'm not sure what it is off the top
of my head.  I expect it will have been discussed before
on this list, so take a look at the archives.

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall
