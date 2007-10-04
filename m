Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l94GEBba019179
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2007 12:14:11 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l94GDx1x031620
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2007 12:14:00 -0400
Date: Thu, 4 Oct 2007 12:13:42 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Poison pills
In-Reply-To: <20071003214759.GA10385@us.ibm.com>
Message-ID: <Pine.LNX.4.44.0710041211540.814-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: malahal@us.ibm.com
Cc: linux-lvm@redhat.com

On Wed, 3 Oct 2007 malahal@us.ibm.com wrote:

> It would be a lot cheaper if you can test it with loop devices!

Loop devices don't let you disconnect them while active (or at least they
complain and I've never tried to override them).  The torture test is
removing the drive while active in the VG, file system mounted, etc.

> Stuart D. Gathman [stuart@bmsi.com] wrote:
> > I think an inexpensive torture test of this logic is to get 3 or 4 external USB
> > drives, put them all in a VG, and start playing games with hotplugging them.
> > (E.g. unplug drive, vgreduce, plug drive back in).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
