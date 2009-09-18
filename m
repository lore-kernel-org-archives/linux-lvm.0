Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8ILuDjd030550
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 17:56:14 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8ILtupV006983
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 17:55:56 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1MolQo-00050X-VB
	for linux-lvm@redhat.com; Fri, 18 Sep 2009 14:55:55 -0700
Date: Fri, 18 Sep 2009 16:55:54 -0500
From: Ray Morris <support@bettercgi.com>
Subject: Re: [linux-lvm] Disk crash on LVM
References: <1253308756.16684.7@raydesk1.bettercgi.com>
	<Pine.LNX.4.64.0909181727570.16138@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0909181727570.16138@bmsred.bmsi.com> (from
	stuart@bmsi.com on Fri Sep 18 16:31:19 2009)
Message-Id: <1253310954.16684.9@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
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

  I forgot to say - pvmove is low partially because
it works well even for mounted volumes.  Using dd, 
you definitely want to unmount the volume.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 09/18/2009 04:31:19 PM, Stuart D. Gathman wrote:
> On Fri, 18 Sep 2009, Ray Morris wrote:
> 
> >    pvmove is very slow and very safe.  You want 
> > to get the data off that drive in a hurry, before 
> > it heats up, so pvmove is not your friend in this 
> > case.  Freeze the drive, then find out which LVs 
> > are on it:
> 
> I've found that external data/power cables that let you connect
> an unmounted drive sitting on your workbench are your friend
> in these cases.  You can even keep the drive in the freezer
> (just make sure it is dry enough to be non-condensing).  
> Stay-Dri hospital ice bags also work well.
> 
> -- 
> 	      Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
> 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song
> for
> a Microsoft sponsored "Where do you want to go from here?" 
> commercial.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
