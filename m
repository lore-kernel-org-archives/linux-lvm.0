Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5AIml1d023143
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 14:48:47 -0400
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5AImWrQ007266
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 14:48:33 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.7) with ESMTP id n5AImW206204
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 11:48:32 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id n5AImWpO032618
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 11:48:32 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n5AImVSN032616
	for linux-lvm@redhat.com; Wed, 10 Jun 2009 11:48:31 -0700
Date: Wed, 10 Jun 2009 11:48:31 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Data deduplication in LVM?
Message-ID: <20090610184831.GA32441@esri.com>
References: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
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

On Wed, Jun 10, 2009 at 11:41:52AM -0700, Roy Sigurd Karlsbakk wrote:
> Hi all
> 
> I've been reading up a little about data deduplication, and have been  
> in search for an OSS filesystem with dedup without much luck. While  
> testing snapshots and so on in LVM, I started wondering if dedup would  
> be better off in LVM than in the filesystem. Would it be possible/ 
> efficient to add dedup to the LVM layer, or perhaps a layer above LVM?  
> This could make dedup work for all or most of filesystems. Make a hash  
> table with 4k (or whatever) blocks, make virtual blocks pointing to  
> the physical blocks and run a remapping/deduping job at night. If  
> written to, copy-on-write could be used to increase speed.
> 
> Is this nonsense, or might it be an idea?
> 

I like the idea. :-)  Maybe it could be done at the LV layer.

Ray
