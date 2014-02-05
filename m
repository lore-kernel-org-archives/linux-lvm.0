Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s15JKhDp011919
	for <linux-lvm@redhat.com>; Wed, 5 Feb 2014 14:20:44 -0500
Received: from sneak2.sneakemail.com (sneak2.sneakemail.com [38.113.6.65])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id s15JKa0C022826
	for <linux-lvm@redhat.com>; Wed, 5 Feb 2014 14:20:37 -0500
From: "Seb A" <4jngrhkk3c@snkmail.com>
References: <16647-1390949651-817374@sneakemail.com>
	<24444-1390997738-899111@sneakemail.com>
	<26083-1390999499-900991@sneakemail.com> <52EA3122.2090605@redhat.com>
In-Reply-To: <52EA3122.2090605@redhat.com>
Date: Wed, 5 Feb 2014 17:11:35 -0000
Message-ID: <837-1391628034-528109@sneakemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Full DRDB device on LVM is now unusable
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

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com On Behalf Of Zdenek 
> Kabelac zkabelac-at-redhat.com
> Sent: 30 January 2014 11:02
> Subject: Re: [linux-lvm] Full DRDB device on LVM is now unusable
> 
> As a follow-up of irc discussion.
> 
> 
> incorrect  filter rules were set.
> 
> 
> For drbd its mandatory to let lvm2 command see only those 
> devices which are 
> supposed to be used.
> 
> Reference to drbd lvm nesting guide:
> http://www.drbd.org/users-guide-8.3/s-nested-lvm.html
> 
> Rule #1 - set an appropriate 'filter' is very important.
> 
> For activation of nested LV  lvm must not see drbd origin nodes!
> 
> 
> Zdenek

Many thanks for your help Zdenek.  As you know, we were able to able to get
the volume mounted on 'Openfiler2' by changing the LVM filter rules.  What
was very strange, is that they had been working fine for over 2 years.  And
that fixing the rules prevented the volume being displayed in the output
from lvscan and lvdisplay.  Updating the lvm2 package fixed this display
though - but only on Openfiler2.  After our conversation, I made the same
changes to 'Openfiler1' and it was not able to see the volumes in lvscan and
lvdisplay - until I reverted the change to filter rules (but kept the newer
lvm2 package) to the one I had been using for years.  So, it is still a bit
of a mystery.  But the main thing is that it is working now - and I know
where to look if it happens again.

Kind regards, 

Seb A
