Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5AJZE5B023157
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 15:35:15 -0400
Received: from Vail.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5AJZ1S4002171
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 15:35:02 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by Vail.esri.com (8.13.7+Sun/8.13.7) with ESMTP id n5AJYxZL025522
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 12:34:59 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id n5AJYxV5001564
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 12:34:59 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n5AJYxwu001562
	for linux-lvm@redhat.com; Wed, 10 Jun 2009 12:34:59 -0700
Date: Wed, 10 Jun 2009 12:34:59 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Data deduplication in LVM?
Message-ID: <20090610193459.GA1334@esri.com>
References: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
	<4A30015D.1010409@gmail.com>
	<38673305-3BDC-49F8-A04A-F327034D9D59@karlsbakk.net>
	<4A3009D1.4070409@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A3009D1.4070409@gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Jun 10, 2009 at 12:30:25PM -0700, Les Mikesell wrote:
> Roy Sigurd Karlsbakk wrote:
> >
> >> Roy Sigurd Karlsbakk wrote:
> >>> Hi all
> >>> I've been reading up a little about data deduplication, and have been 
> >>> in search for an OSS filesystem with dedup without much luck. While 
> >>> testing snapshots and so on in LVM, I started wondering if dedup 
> >>> would be better off in LVM than in the filesystem. Would it be 
> >>> possible/efficient to add dedup to the LVM layer, or perhaps a layer 
> >>> above LVM? This could make dedup work for all or most of filesystems. 
> >>> Make a hash table with 4k (or whatever) blocks, make virtual blocks 
> >>> pointing to the physical blocks and run a remapping/deduping job at 
> >>> night. If written to, copy-on-write could be used to increase speed.
> >>> Is this nonsense, or might it be an idea?
> >>
> >> This is "supposed" to be coming in the next OpenSolaris/ZFS release 
> >> (per the roadmap with the just-released 2009.06 version).
> > 
> > 
> > What about Linux/LVM? Or did I misunderstand you?
> 
> I thought the question was about OSS...  I wouldn't hold my breath 
> waiting for a Linux/LVM version - and for that matter I'll believe the 
> ZFS release when I see it, but at least it is being planned and could be 
> less than a year away.
> 

Also, both btrfs and tux3 are planning on adding dedup support.

Ray
