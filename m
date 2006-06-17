Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5H0aPrL006333
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 20:36:25 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5H0aOK4019485
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 20:36:24 -0400
Date: Sat, 17 Jun 2006 02:36:23 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Effects of XXremove and then XXcreate on fs
Message-ID: <20060617003622.GA31760@percy.comedia.it>
References: <1150471087.30257.393.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1150471087.30257.393.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: luken@omner.org, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jun 16, 2006 at 09:18:07AM -0600, Joshua Aune wrote:
>If an LV is [lv,vg,pv]removed and then re[pv,vg,lv]created not using the
>backup file, what are the effects on the old LV?
> is it possible to remove the new created LV/VG/PV and recreate using
>  the backup file and still access the volume?
> or is there some on-disk metadata from the original LV that got hosed
>  by the creation of the new LV?
>
>I am trying to recover a system that had the above done to it along with
>possibly having some other problems, and am trying to weed out possible
>causes of failure.  I do have the backup/ file now and will be
>attempting this as soon as I can restore the block devices from backups
>(another 6 hours).

from the lvrcreate manpage:

       -Z, --zero y/n
              Controls zeroing of the first KB of data in the new logical vol-
              ume.
              Default is yes.

              Warning: trying to mount an unzeroed logical  volume  can  cause
              the system to hang.

you might be able to recover the filesystem using an alternate superblock if you wiped
the first KB of fs data.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
