Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA41roV29526
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 20:53:50 -0500
Received: from volumehost.com
	(IDENT:11dp5T1dFlLS1GBTHLm7HutkD5/E1RIu@adsl-69-154-123-201.dsl.fyvlar.swbell.net
	[69.154.123.201])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jA41rjA7031371
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 20:53:50 -0500
Received: from volumehost.com (localhost.localdomain [127.0.0.1])
	by volumehost.com (8.12.8/8.12.5) with ESMTP id jA41rZUN020842
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 19:53:35 -0600
Received: (from apache@localhost)
	by volumehost.com (8.12.8/8.12.8/Submit) id jA41rYP1020840
	for linux-lvm@redhat.com; Thu, 3 Nov 2005 19:53:34 -0600
Message-ID: <1131069214.436abf1e38004@webmail.volumehost.com>
Date: Thu,  3 Nov 2005 19:53:34 -0600
From: Zac Slade <krakrjak@volumehost.com>
Subject: Re: [linux-lvm] pvresize patch pending
References: <1130518796.4362590c75cf0@webmail.volumehost.com>
	<20051028170130.GH11086@agk.surrey.redhat.com>
	<1130519874.43625d4253324@webmail.volumehost.com>
	<1130522152.436266287429e@webmail.volumehost.com>
	<20051028192752.GJ11086@agk.surrey.redhat.com>
	<436286B3.80604@cantab.net>
	<20051028212102.GK11086@agk.surrey.redhat.com>
	<1130546247.4362c447c3718@webmail.volumehost.com>
	<20051029010217.GA22575@agk.surrey.redhat.com>
In-Reply-To: <20051029010217.GA22575@agk.surrey.redhat.com>
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

> On Fri, Oct 28, 2005 at 07:37:27PM -0500, Zac Slade wrote:
> > I think that to get this part write might take a fundemental shift in the
> way
> > pv_write() and _pv_write() behave.  What would be nice is to make
> pv_write()
> > distinguish between a pv_create calling it and a pv_resize.  Then have
> _pv_write
> > only write the pv mda to the disk.  By doing this _pv_write becomes generic
> and
> > allows for further extension.  Also then we can probably implement
> atomicity for
> > pv updates (though updating a pv was not initially engineered into lvm it
> can
> > become very handy).
>   
> I'm reluctant to extend pv_write - long term I want to get rid of it
> (and pv_read also) as PV operations are always awkward and getting in the
> way.
> Everything should be done with (new-style) VGs and LVs.
> 
> pvcreate is also superfluous - I want to absorb it into vgcreate/vgextend
> etc.
> So every labelled volume will always belong to a VG - with enhanced
> vgsplit/vgmerge & allocation facilities.
> CVS now lets you create PVs on LVs - another step towards eliminating
> PVs. 

So instead of using pv_read and pv_write (except for backward compatibility)
this functionality should then be migrated into vgcreate?  Okay, I can see that.
 Doing away with the pv* methods will subtract some abstraction.  However with
this fundamental shift how do you reconcile the pv/vg structures?  Just do away
with the notion of pvs all together or instead have them, but they only exists
as an internal structure not visible to the user?

I'm still learning the codebase and I'm not sure there is an obvious way to
start this.  I'm assuming that you don't want pvcreate reinvented inside
vgcreate, but instead have vgcreate do something new to abstract the underlying
devices by only utilizing a vg structure not having seperate pv structures. 
This code may already exist.  A few hints in the right direction would be nice.
 I'll keep poking around.

Zac Slade
krakrjak@volumehost.com

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
