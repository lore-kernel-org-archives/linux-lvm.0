Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2C3mnEL003479
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 22:48:49 -0500
Received: from smtp12.tagonline.com (nat199.nat.tagonline.com [207.111.79.199])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2C3maA1016593
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 22:48:37 -0500
Received: from taco.int.tagonline.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain for (8.13.1/8.12.8/muffin_cf_1.0) with ESMTP
	id p2C3maVq012161
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 22:48:36 -0500
Received: (from news@localhost)
	by taco.int.tagonline.com (8.13.1/8.13.1/Submit) id p2C3matB012160
	for linux-lvm@redhat.com; Fri, 11 Mar 2011 22:48:36 -0500
From: Andrew Gideon <ag2827189@tagmall.com>
Date: Sat, 12 Mar 2011 03:48:36 +0000 (UTC)
Message-ID: <ileqek$nji$4@taco.int.tagonline.com>
References: <ildv9o$nji$2@taco.int.tagonline.com>
	<20110311170154.0475f82e@bettercgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvremove or vgextend: metadata too large for
 circular buffer
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
To: linux-lvm@redhat.com

On Fri, 11 Mar 2011 17:01:54 -0600, Ray Morris wrote:


>    What I did was to allocate MUCH more space on the new PVs,
> make a new VG from them, then copy LVs from one of the old PVs. Then
> recreate that PV with more metadata space, add it to the new VG, etc.
> until all of the PVs are in the new VG, with far more metadata space.

Creating a new VG is my worst-case scenario, but that will be expensive 
in terms of time - time during which I cannot do expansion of volumes.  
It's a little frustrating.

How risky is the idea of editing a backup file and doing the restore?  If 
I screw it up, I can always do a re-restore of the proper data, no?

Thanks...

	Andrew
