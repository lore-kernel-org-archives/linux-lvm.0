Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8C34gxJ025494
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 23:04:42 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8C34cRT015180
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 23:04:38 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p8C34Iv5002359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 23:04:18 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p8C34HI3005666
	for <linux-lvm@redhat.com>; Sun, 11 Sep 2011 23:04:17 -0400
Date: Sun, 11 Sep 2011 23:04:17 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4E6D5600.4060008@tlinx.org>
Message-ID: <alpine.LRH.2.00.1109112258290.5505@bmsred.bmsi.com>
References: <4E6D5600.4060008@tlinx.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] more vg problems or oddities...not using dmsetup
 remove seems to be bad?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 11 Sep 2011, Linda A. Walsh wrote:

> tried to remove an unmounted active snapshot.
>
> lvremove said it wouldn't remove an active snapshot.
>
> Tried -an -- can't change active snapshot.

This is an annoying bug (IMHO).  Use lvremove -f (making sure it
really isn't open).

> Tried turning off monitoring --monitor -n
> It gave no message
> tried removing again...can't remove active snap
>
> tried --ignoremonitoring
>
> no message but still can't remove
>
> tried -- merging it...

Ooops.  You likely did not want that.  That reverts the origin volume
to the snapshot by copying the original data for updated sectors from
the snapshot.  This is an extremely useful feature, but *not* when
you invoke it accidentally!

> Now still can't remove, but says "
> Can't remove merging snapshot logical volume "Home-2011.09.03-00.28.36"
> ...

Correct.  You *don't* want to interrupt the merge.  That will just 
corrupt stuff.

> So now I'm concerned...is it going to try to merge back any changes it 
> recorded by reversing them?

Yes.

> i.e. put the original volume back the way it was when the snapshot started?

Yes.

> Says it couldn't do it on open volume -- does that mean it won't start this 
> until I reboot,
> then it will take a long time to become active?

Possibly.  I've never tried it on an open volume.

> I'm wondering if I really want this 'merge' it wants to do...and if not, how 
> do I abort it?

If it is really delayed until boot (or close), then you have a chance to abort
it, but I don't know how.  I hope an expert answers.  Meanwhile, I'll
peruse the man page to see if it talks about delayed merge.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
