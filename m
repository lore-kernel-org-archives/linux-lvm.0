Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7C0qoZn024997
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 20:52:50 -0400
Received: from e39.co.us.ibm.com (e39.co.us.ibm.com [32.97.110.160])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7C0qfeD008801
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 20:52:41 -0400
Received: from d03relay05.boulder.ibm.com (d03relay05.boulder.ibm.com
	[9.17.195.107])
	by e39.co.us.ibm.com (8.14.4/8.13.1) with ESMTP id o7C0gabu016999
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 18:42:36 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay05.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o7C0qR0t089388
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 18:52:30 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id o7C0qRIq012601
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 18:52:27 -0600
Received: from malahal (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	o7C0qRrP011675
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 18:52:27 -0600
Date: Wed, 11 Aug 2010 17:52:10 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20100812005210.GA2963@us.ibm.com>
References: <AANLkTinnEDV-Vsx3LW9XirpDsN7mPyvphxeLsqYsSp0F@mail.gmail.com>
	<Pine.LNX.4.64.1008111831100.20515@bmsred.bmsi.com>
	<AANLkTimQgrEaG-eKZ23qFkxzdPAZ450gkTKiQH=pb+bt@mail.gmail.com>
	<20100811235656.GA1678@us.ibm.com>
	<AANLkTi=rOeVixFV6zD6uNZgLXh6zKR1oPBXDDHzNN9hE@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTi=rOeVixFV6zD6uNZgLXh6zKR1oPBXDDHzNN9hE@mail.gmail.com>
Subject: Re: [linux-lvm] calculating free capacity from pvdisplay and
 lvdisplay
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Rahul Nabar [rpnabar@gmail.com] wrote:
> On Wed, Aug 11, 2010 at 6:56 PM, Malahal Naineni <malahal@us.ibm.com> wrote:
> >
> > It is 'normal' for VG and 'inherit' for an LV. See 'man lvm' command for
> > details. See 'man vgs' on how to get it. Allocation policy is part of vg
> > 'Attr' field. Look for Attr value when you run 'vgs -o+attr'
> 
> THanks! I do have "normal" allocation policy on the VG and all the
> LV's inherit this.
> But that just deepens the mystery. Why are my first 3 PV's showing
> full and the others not?

I don't know your particular situation, but if you create an LV, it will
normally use the first PV. Until the first PV is used, it won't allocate
from the next PV. This is only true if you use linear LV. If you use
stripes, that allocation would be completely different.

I don't think LVM remembers the last used PV for allocation to use any
kind of round robin allocation among different lvcreates. Hope that
answers your mystery.

Thanks, Malahal.
