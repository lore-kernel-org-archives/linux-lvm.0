Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s15LmJ5r014948
	for <linux-lvm@redhat.com>; Wed, 5 Feb 2014 16:48:19 -0500
Received: from zimbra13.linbit.com (zimbra13.linbit.com [212.69.166.240])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s15LmE7P029537
	for <linux-lvm@redhat.com>; Wed, 5 Feb 2014 16:48:16 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra13.linbit.com (Postfix) with ESMTP id DD6D92ACA57
	for <linux-lvm@redhat.com>; Wed,  5 Feb 2014 22:48:13 +0100 (CET)
Received: from zimbra13.linbit.com ([127.0.0.1])
	by localhost (zimbra13.linbit.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id c_9KmtmWz764 for <linux-lvm@redhat.com>;
	Wed,  5 Feb 2014 22:48:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zimbra13.linbit.com (Postfix) with ESMTP id BBEC82ACB2C
	for <linux-lvm@redhat.com>; Wed,  5 Feb 2014 22:48:13 +0100 (CET)
Received: from zimbra13.linbit.com ([127.0.0.1])
	by localhost (zimbra13.linbit.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zWi_yeOb-NeM for <linux-lvm@redhat.com>;
	Wed,  5 Feb 2014 22:48:13 +0100 (CET)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra13.linbit.com (Postfix) with ESMTPS id 9FBE82ACA57
	for <linux-lvm@redhat.com>; Wed,  5 Feb 2014 22:48:13 +0100 (CET)
Date: Wed, 5 Feb 2014 22:48:13 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20140205214813.GH14501@soda.linbit>
References: <16647-1390949651-817374@sneakemail.com>
	<24444-1390997738-899111@sneakemail.com>
	<26083-1390999499-900991@sneakemail.com>
	<52EA3122.2090605@redhat.com>
	<837-1391628034-528109@sneakemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <837-1391628034-528109@sneakemail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Feb 05, 2014 at 05:11:35PM -0000, Seb A wrote:
> > -----Original Message-----
> > From: linux-lvm-bounces@redhat.com On Behalf Of Zdenek 
> > Kabelac zkabelac-at-redhat.com
> > Sent: 30 January 2014 11:02
> > Subject: Re: [linux-lvm] Full DRDB device on LVM is now unusable
> > 
> > As a follow-up of irc discussion.
> > 
> > 
> > incorrect  filter rules were set.
> > 
> > 
> > For drbd its mandatory to let lvm2 command see only those 
> > devices which are 
> > supposed to be used.
> > 
> > Reference to drbd lvm nesting guide:
> > http://www.drbd.org/users-guide-8.3/s-nested-lvm.html
> > 
> > Rule #1 - set an appropriate 'filter' is very important.
> > 
> > For activation of nested LV  lvm must not see drbd origin nodes!
> > 
> > 
> > Zdenek
> 
> Many thanks for your help Zdenek.  As you know, we were able to able to get
> the volume mounted on 'Openfiler2' by changing the LVM filter rules.  What
> was very strange, is that they had been working fine for over 2 years.  And
> that fixing the rules prevented the volume being displayed in the output
> from lvscan and lvdisplay.  Updating the lvm2 package fixed this display
> though - but only on Openfiler2.  After our conversation, I made the same
> changes to 'Openfiler1' and it was not able to see the volumes in lvscan and
> lvdisplay - until I reverted the change to filter rules (but kept the newer
> lvm2 package) to the one I had been using for years.  So, it is still a bit
> of a mystery.  But the main thing is that it is working now - and I know
> where to look if it happens again.

Now, if the filter is correct,
LVM won't see the VG as long as DRBD is "Secondary"
(unless LVM takes the info from some stale cache file,
which I have seen as well).

You have to promote DRBD first,
only then (potentially re-scan, depending on
exact LVM setup, and) activate the VG.

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com
