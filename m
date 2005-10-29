Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9T12Hvl019426
	for <linux-lvm@redhat.com>; Sat, 29 Oct 2005 02:02:17 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EVf6v-0005yo-Af
	for linux-lvm@redhat.com; Sat, 29 Oct 2005 02:02:17 +0100
Date: Sat, 29 Oct 2005 02:02:17 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvresize patch pending
Message-ID: <20051029010217.GA22575@agk.surrey.redhat.com>
References: <1130518796.4362590c75cf0@webmail.volumehost.com>
	<20051028170130.GH11086@agk.surrey.redhat.com>
	<1130519874.43625d4253324@webmail.volumehost.com>
	<1130522152.436266287429e@webmail.volumehost.com>
	<20051028192752.GJ11086@agk.surrey.redhat.com>
	<436286B3.80604@cantab.net>
	<20051028212102.GK11086@agk.surrey.redhat.com>
	<1130546247.4362c447c3718@webmail.volumehost.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1130546247.4362c447c3718@webmail.volumehost.com>
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

On Fri, Oct 28, 2005 at 07:37:27PM -0500, Zac Slade wrote:
> I think that to get this part write might take a fundemental shift in the way
> pv_write() and _pv_write() behave.  What would be nice is to make pv_write()
> distinguish between a pv_create calling it and a pv_resize.  Then have _pv_write
> only write the pv mda to the disk.  By doing this _pv_write becomes generic and
> allows for further extension.  Also then we can probably implement atomicity for
> pv updates (though updating a pv was not initially engineered into lvm it can
> become very handy).
  
I'm reluctant to extend pv_write - long term I want to get rid of it
(and pv_read also) as PV operations are always awkward and getting in the way.
Everything should be done with (new-style) VGs and LVs.

pvcreate is also superfluous - I want to absorb it into vgcreate/vgextend etc.
So every labelled volume will always belong to a VG - with enhanced
vgsplit/vgmerge & allocation facilities.
CVS now lets you create PVs on LVs - another step towards eliminating
PVs. 


> Actually there is no need to use process_each_pv

If you don't use it, you have to duplicate the logic in it as you have
already done - incompletely (e.g. tag support is missing).

> necessary or even wise to support resizing more than one pv at a time.  

If ppl want to do that, why stop them?


> Can't we just borrow the code from pvcreate to manipulate the metadatacopies? 

Not yet.  That problem needs solving as part of a general mda-manipulating  
feature.  No point in doing it first for a rarely-used case.

Alasdair
-- 
agk@redhat.com
