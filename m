Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DHhkw6000735
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 13:43:46 -0400
Received: from mail.linbit.com (aug.linbit.com [212.69.162.22])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6DHhamF005778
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 13:43:37 -0400
Received: from soda (office.linbit [213.229.1.138])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id CEC8C2DF6251
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 19:43:30 +0200 (CEST)
Date: Thu, 13 Jul 2006 19:43:31 +0200
From: Lars Ellenberg <linux-lvm@linbit.com>
Subject: Re: [linux-lvm] Re: LVM Performance effects?
Message-ID: <20060713174331.GF4093@soda.linbit>
References: <44B66D47.4000001@designassembly.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44B66D47.4000001@designassembly.de>
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

/ 2006-07-13 17:56:55 +0200
\ Michael Heyse:
> (sorry for disrupting the thread - copied this message from the archives)
> 
> > I have set up a file server with LVM on top of RAID 5, and seem to be
> > having LVM related performance issue.
> 
> Me too.
> 
> > raid device: 118.2 MB/s
> > lvm device: 49.43 MB/s
> > file system: 40.83 MB/s
> 
> Have you found an answer to that problem? I couldn't find anything
> helpful in the archives. Is this a general LVM on software RAID issue?

maybe lvm (device mapper) does not propagate the read-ahead
parameters of the physical device to the upper layers
(we had a similar problem with drbd, which in respect to this problem is
"just an other" virtual block device)

once we did (block device kernel code during device creation)
+
+       if( q->backing_dev_info.ra_pages != b->backing_dev_info.ra_pages) {
+               INFO("Adjusting my ra_pages to backing device's (%lu -> %lu)\n",
+                    q->backing_dev_info.ra_pages,
+                    b->backing_dev_info.ra_pages);
+               q->backing_dev_info.ra_pages = b->backing_dev_info.ra_pages;
+       }
+

we suddenly got basically all the bandwidth the box could deliver.
without that patch and that particular storage backend we had only
about 1/6 of the performance. 
other storage backends don't care at all.

you could verify this with "blockdev --getra /dev/whatever",
and try to tune it with "blockdev --setra 1024 /dev/whatever".

-- 
: Lars Ellenberg                                  Tel +43-1-8178292-0  :
: LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
: Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :
