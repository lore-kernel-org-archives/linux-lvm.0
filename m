Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9T0boV09842
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 20:37:50 -0400
Received: from volumehost.com
	(IDENT:UrDoBH7wNgYefq/gyvTHAV0cJ7XQ5VGU@adsl-69-154-123-201.dsl.fyvlar.swbell.net
	[69.154.123.201])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9T0bd3l005678
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 20:37:43 -0400
Received: from volumehost.com (localhost.localdomain [127.0.0.1])
	by volumehost.com (8.12.8/8.12.5) with ESMTP id j9T0bTUN013075
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 19:37:29 -0500
Received: (from apache@localhost)
	by volumehost.com (8.12.8/8.12.8/Submit) id j9T0bSoh013073
	for linux-lvm@redhat.com; Fri, 28 Oct 2005 19:37:28 -0500
Message-ID: <1130546247.4362c447c3718@webmail.volumehost.com>
Date: Fri, 28 Oct 2005 19:37:27 -0500
From: Zac Slade <krakrjak@volumehost.com>
Subject: Re: [linux-lvm] pvresize patch pending
References: <1130518796.4362590c75cf0@webmail.volumehost.com>
	<20051028170130.GH11086@agk.surrey.redhat.com>
	<1130519874.43625d4253324@webmail.volumehost.com>
	<1130522152.436266287429e@webmail.volumehost.com>
	<20051028192752.GJ11086@agk.surrey.redhat.com>
	<436286B3.80604@cantab.net>
	<20051028212102.GK11086@agk.surrey.redhat.com>
In-Reply-To: <20051028212102.GK11086@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Quoting Alasdair G Kergon <agk@redhat.com>:

> On Fri, Oct 28, 2005 at 09:14:43PM +0100, Zak Kipling wrote:
> > Indeed. I've recently been working on an implementation myself 
> > (primarily because I wanted to grow a live PV on my own system), which 
> > I've attached in its current (somewhat rough, but seemingly working) 
> > state as a patch against CVS HEAD.
>  
> Unless I've missed something while skimming through, I think the code 
> still needs a preceding 'pvcreate --restorefile' equivalent to ensure 
> the size of the device is set correctly in the label (for PVs in a VG).
> (But since the 'Reinstate full PV size when removing from VG.' fix,
> perhaps a code audit would show that we can safely override that label 
> field with the one taken from the VG and allow it to remain wrong on disk.)

I'm going to work on integrating his patch with ours and see if we can't make it
more cohesive. 

>   https://www.redhat.com/archives/linux-lvm/2005-July/msg00033.html
>   https://www.redhat.com/archives/linux-lvm/2005-July/msg00029.html
>   pvs -o +dev_size

I think that to get this part write might take a fundemental shift in the way
pv_write() and _pv_write() behave.  What would be nice is to make pv_write()
distinguish between a pv_create calling it and a pv_resize.  Then have _pv_write
only write the pv mda to the disk.  By doing this _pv_write becomes generic and
allows for further extension.  Also then we can probably implement atomicity for
pv updates (though updating a pv was not initially engineered into lvm it can
become very handy).
 
> Apart from that and the process_each_pv() simplification, it 
> looks pretty good!

Actually there is no need to use process_each_pv().  I don't think that it's
necessary or even wise to support resizing more than one pv at a time.  Instead
it should act less like pvcreate and more like lvextend.  That way supporting
--setphysicalvolumesize makes sense.

> > * Support for metadata formats other than format_text.
> 
> Let's just exclude them with a FMT_RESIZE_PV feature flag.

Well it would be nice to support format_pool I'm not sure what the win for
supporting format1 is....  What would be required architecurally to support
alternative formats?  

> > * Support for more than one mda on a PV (I think it will currently 
> > clobber ones at the end of the PV, since it assumes all space after 
> > pe_start is available for extents).
>  
> Check the number of mdas on the PV and refuse to proceed if it exceeds 1.
> We need to write separate new tools to add/remove/manipulate mdas.

Can't we just borrow the code from pvcreate to manipulate the metadatacopies? 
This shouldn't be the end of the world to get working while the infrastructure
gets put into place to support it more gracefully.

Zac Slade
krakrjak@volumehost.com

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
