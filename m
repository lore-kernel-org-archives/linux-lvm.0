Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GJ43BP024761
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 15:04:04 -0400
Received: from interhosting.it (smtpauth.interfree.it [213.158.72.43])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8GJ3poc031481
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 15:03:52 -0400
Received: from delo.gdit (delo.gdit [127.0.0.1])
	by delo.gdit (8.14.2/8.14.2) with ESMTP id n8GJ3npi003372
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 21:03:49 +0200
Received: (from root@localhost)
	by delo.gdit (8.14.2/8.14.2/Submit) id n8GJ3ns5003370
	for linux-lvm@redhat.com; Wed, 16 Sep 2009 21:03:49 +0200
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
From: Ambrogio De Lorenzo <ambrogio.de.lorenzo@alice.it>
In-Reply-To: <20090916181947.GB15438@us.ibm.com>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916181947.GB15438@us.ibm.com>
Content-Transfer-Encoding: 7bit
Date: Wed, 16 Sep 2009 21:03:48 +0200
Message-Id: <1253127828.3243.1.camel@delo.gdit>
Mime-Version: 1.0
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

Il giorno mer, 16/09/2009 alle 11.19 -0700, malahal@us.ibm.com ha
scritto:
> Ambrogio De Lorenzo [ambrogio.de.lorenzo@alice.it] wrote:
> > Hi all.
> > I'm doing a big upgrade on my computer and I tryed to use lv mirroring
> > to obtain a copy of my data before to do it.
> > 
> > As I do with LVM on other OS i thought that after mirroring one could
> > chose to split the mirrored lv.
> > 
> > I can't find how to do it with LVM2 on Linux.
> 
> snapshot may be a good fit in this case, but if you insist you can use
> lvconvert to convert your linear volume to a mirrored volume. Once the
> sync is complete, you can use the same lvconvert to convert the mirror
> volume to a linear one.
But with this I loose the secondary copy.
It's not a good idea.
Backup and destroy backup :-)

Bye
 Ambrogio
