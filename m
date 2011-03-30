Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2UF4YEv022000
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2011 11:04:34 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2UF4TsL008013
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2011 11:04:29 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1Q4wwa-00056U-Eg
	for linux-lvm@redhat.com; Wed, 30 Mar 2011 08:04:24 -0700
Date: Wed, 30 Mar 2011 10:04:23 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110330100423.7a9e3100@bettercgi.com>
In-Reply-To: <5A7D1164A7AD4CA292C1E5176D286D23@caramon>
References: <DE6049702F6A4634890B18D047C27E03@caramon>
	<20110329124434.3cf62c3e@bettercgi.com>
	<CE3415B4EB40445F8F294A52BC905070@caramon>
	<alpine.LRH.2.00.1103291804330.23827@bmsred.bmsi.com>
	<5A7D1164A7AD4CA292C1E5176D286D23@caramon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?
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

  Yes i sounds like it's time to fsck, then if needed 
resize2fs to the proper size.  It would be best to 
mount it read only only and copy whatever data copies
to be safe.  4TB is a lot of data, but then again it's
only $130 worth of consumer drives to back it up.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Wed, 30 Mar 2011 02:27:49 +0200
"Fredrik Skog" <fredrik.skog@rodang.se> wrote:

> 
> ----- Original Message ----- 
> From: "Stuart D. Gathman" <stuart@bmsi.com>
> To: "LVM general discussion and development" <linux-lvm@redhat.com>
> Sent: Wednesday, March 30, 2011 12:14 AM
> Subject: Re: [linux-lvm] How to fix missmatch between VG-size and
> LV-size?
> 
> >SNIP>
> 
> >> I can run LVM commands fine now after the reboot and the output
> >> from pvdisplay and lvdisplay is like i posted earlier.
> >> How can i revert this in a safe way? I was thinking of just
> >> removing the PV and do a vgcfgrestore to "before" the lvextend.
> >> But since lvdisplay says the volume is 4.16TiB and pvdisplay says
> >> 5.59TiB something is wrong? Or am I missing something?
> 
> >SNIP>
> 
> >> Is it better to do a e2fsck now?
> 
> > That is probably the only way to salvage what is left of your
> > filesystem, but don't do it until we find out whether the LV is the
> > old or the new size.
> > I suspect the LV will be the new size, but the filesystem may still
> > show the old size.  Since the resize2fs should be just adding free
> > space, there may not be any data loss.  e2fsck would fix the (now
> > corrupt) free space, and you can extend again.
> 
> I just added all the segments of the LV from an old backed up config
> file. It adds up to 3,856TB, so I guess  you were right and i assumed
> wrong. The old LV was about 3,8TB and the new is about 4,16TB or
> about 400GB bigger than before as expected by lvextend -L+400G.
> 
> Also it tells me I have 1,43TiB free wich is 5,59TiB - 4,16TiB. It
> also looks right.
> 
> maybe I should try an e2fsck now?
> 
> again, thanks for your time
> 
> /Fredrik Skog
> 
> >
> > --
> >        Stuart D. Gathman <stuart@bmsi.com>
> >     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 
> > 591-6154
> > "Confutatis maledictis, flammis acribus addictis" - background song
> > for a Microsoft sponsored "Where do you want to go from here?"
> > commercial.
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
