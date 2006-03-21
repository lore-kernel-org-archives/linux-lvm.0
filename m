Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2LMCjhx005451
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 17:12:45 -0500
Received: from omx2.sgi.com (omx2-ext.sgi.com [192.48.171.19])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2LMCcYY016884
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 17:12:39 -0500
Received: from larry.melbourne.sgi.com (larry.melbourne.sgi.com
	[134.14.52.130])
	by omx2.sgi.com (8.12.11/8.12.9/linux-outbound_gateway-1.1) with SMTP
	id k2M0LrCL010198
	for <@external-mail-relay.sgi.com:linux-lvm@redhat.com>;
	Tue, 21 Mar 2006 16:21:54 -0800
Received: from wobbly.melbourne.sgi.com (wobbly.melbourne.sgi.com
	[134.14.55.135]) by larry.melbourne.sgi.com
	(950413.SGI.8.6.12/950213.SGI.AUTOCF) via ESMTP id JAA23944 for
	<linux-lvm@redhat.com>; Wed, 22 Mar 2006 09:12:31 +1100
Received: from wobbly.melbourne.sgi.com (localhost [127.0.0.1])
	by wobbly.melbourne.sgi.com (SGI-8.12.5/8.12.5) with ESMTP id
	k2LMCTJC686410
	for <linux-lvm@redhat.com>; Wed, 22 Mar 2006 09:12:30 +1100 (EST)
Received: (from nathans@localhost)
	by wobbly.melbourne.sgi.com (SGI-8.12.5/8.12.5/Submit) id
	k2LMCRAC685056
	for linux-lvm@redhat.com; Wed, 22 Mar 2006 09:12:27 +1100 (EST)
Date: Wed, 22 Mar 2006 09:12:27 +1100
From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] Hardware snapshots and LVM2?
Message-ID: <20060322091227.C664708@wobbly.melbourne.sgi.com>
References: <H000007200c27f69.1142968273.fsu50.nll.se@MHS>
	<87f94c370603211253l378cae32y1764a3d254afe742@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87f94c370603211253l378cae32y1764a3d254afe742@mail.gmail.com>;
	from greg.freemyer@gmail.com on Tue, Mar 21, 2006 at 03:53:16PM
	-0500
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

On Tue, Mar 21, 2006 at 03:53:16PM -0500, Greg Freemyer wrote:
> On 3/21/06, fredrik.backman@nll.se <fredrik.backman@nll.se> wrote:
> > Hi
> >
> > Im doing a snapshot (hardware-based in EVA5000) of a LV
> > (lvm2) and i
> > wonder what is the correct way to use this snapshot?
> > Problem is that
> > this snapshot has the same ID as the original one. In HP-UX
> > a would do a
> > vgchgid on this snapshot-LV. Any help would be aprreciated.
> >
> > Regards Fredrik
> 
> I think that is filesystem dependent.
> 
> If you happen to be using XFS I believe they have a mount option like
> "-o nouuid".

If its XFS, you can either do that or change the UUID via xfs_admin(8).

> Do a man mount.xfs to double check.

Its mount(8), all the filesystems are documented together in one place.

cheers.

-- 
Nathan
