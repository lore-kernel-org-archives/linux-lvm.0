Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k94JK1Yj004584
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 15:20:01 -0400
Received: from web53014.mail.yahoo.com (web53014.mail.yahoo.com
	[206.190.49.44])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k94JJwtE028389
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 15:19:58 -0400
Message-ID: <20061004191947.95695.qmail@web53014.mail.yahoo.com>
Date: Wed, 4 Oct 2006 12:19:47 -0700 (PDT)
From: TNJazzGrass <tnjazzgrass@yahoo.com>
In-Reply-To: <20061004191008.70E6A731BD@hormel.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Serious LVM Problem
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
To: linux-lvm@redhat.com

Unfortunately, I don't have any idea what to do to
accomplish this, or if I can even do it.

I created them with Disk Druid on FC3 a couple of
years ago and pretty much hadn't touched the machine
at all since then.  When I "upgraded" to FC5 a couple
of weeks ago, I unchecked all the boxes for the data
drives (hdb, hdd, hde, hdf and hdg) so they should
have been set to "do not format, keep existing data"
but I can't remember exactly what I did with hda
(which was also part of the array - at least some of
it).  

The box has been sitting in the corner for a month or
so while I try to figure out if it's salvageable.  I
have not done anything with it since FC5 was loaded,
except attempt to attach the Physical Volumes to the
LVM using the LVM Management GUI.

So I'm not sure what you mean by "restore the LV's
back" or how I would go about doing it.

I *may* have destroyed part of the array by
reinstalling the OS on /dev/hda...although I'm not
sure how it was set up in the first place.

If this is the case though, is the data that was on
the other physical volumes still actually accessible
in some way?  At this point I'm ready to start over,
but not before I've exhausted all my options.

Thanks,
Dirk

--- Josef Whiter wrote:
 
> Usually the best thing to do in this case is to try
> and restore the LV's back
> the way they were when you created them.  You
> wouldn't happen to know exactly
> how you created them in the first place would you? 
> If you do you can try and
> recreate the LV's exactly the way they were before
> and it should show up, kind
> of like if your partition table eats it and you have
> the exact geometry of the
> partition tables before they disappeared.  Thank
> you,
> 
> Josef

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
