Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2BN2LcJ028325
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 18:02:22 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2BN2DMX001238
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 18:02:13 -0500
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1PyBLK-0007A7-3c
	for linux-lvm@redhat.com; Fri, 11 Mar 2011 15:02:03 -0800
Date: Fri, 11 Mar 2011 17:01:54 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110311170154.0475f82e@bettercgi.com>
In-Reply-To: <ildv9o$nji$2@taco.int.tagonline.com>
References: <ildv9o$nji$2@taco.int.tagonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

> However, that time I didn't get the error from lvremove.
> This time, that is occurring.  So I don't seem to be able to make any
> space.

> Once I execute lvremove on a volume, the "LV Status" becomes "NOT 
> available".  The command 'lvdisplay -m' still shows the segments,
> however.

> How can I resolve this?  Trashing the entire VG is not something I
> can afford.

You may be able to manually do your removes on the output of 
vgcfgbackup, then use vgcfgrestore.  Be careful.

> I created new PVs with larger allocations of space for metadata, but
> I cannot even add these to the VG.  The vgextend command also fails
> with "metadata too large for circular buffer"

   What I did was to allocate MUCH more space on the new PVs, 
make a new VG from them, then copy LVs from one of the old PVs.
Then recreate that PV with more metadata space, add it to the 
new VG, etc. until all of the PVs are in the new VG, with far 
more metadata space.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Fri, 11 Mar 2011 20:05:12 +0000 (UTC)
Andrew Gideon <ag2827189@tagmall.com> wrote:

> We're hitting the "metadata too large for circular buffer" problem.
> Last time this occurred, I was able to clear out a little space by
> removing some unused volumes, and then make more space by selective
> use of pvmove to defragment.  This worked well.
> 
> However, that time I didn't get the error from lvremove.  This time,
> that is occurring.  So I don't seem to be able to make any space.
> 
> Once I execute lvremove on a volume, the "LV Status" becomes "NOT 
> available".  The command 'lvdisplay -m' still shows the segments,
> however.
> 
> How can I resolve this?  Trashing the entire VG is not something I
> can afford.
> 
> I created new PVs with larger allocations of space for metadata, but
> I cannot even add these to the VG.  The vgextend command also fails
> with "metadata too large for circular buffer".
> 
> 	- Andrew
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
