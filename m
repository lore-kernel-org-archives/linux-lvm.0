Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6MKOKdr028664
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 16:24:20 -0400
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6MKNSEu027629
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 16:23:47 -0400
Subject: Re: [linux-lvm] Wisdom of multiple disks in one VG
From: Ross Boylan <ross@biostat.ucsf.edu>
In-Reply-To: <b072968d0807220922s4187314es136605041c26c9ae@mail.gmail.com>
References: <1216674096.7888.5.camel@corn.betterworld.us>
	<b072968d0807220922s4187314es136605041c26c9ae@mail.gmail.com>
Date: Tue, 22 Jul 2008 13:23:21 -0700
Message-Id: <1216758201.20426.4.camel@iron.psg.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2008-07-22 at 18:22 +0200, David Robinson wrote:
[lots of good info snipped]
> 
> > So, my general question is what the best approach would be in this
> > situation, multiple disks of much different sizes.  The existing disks
> > all have separate VG's on them.  The biggest disk is empty so far.
> 
> Do you need a single large filesystem that spans disks? 
No.
> Do you have a
> proper disaster recovery plan (eg, backups)?
Yes.  Kind of!  I definitely need to move my on disk backups onto a
separate physical disk than the one being backed up.

Thanks to everyone for your help.

-- 
Ross Boylan                                      wk:  (415) 514-8146
185 Berry St #5700                               ross@biostat.ucsf.edu
Dept of Epidemiology and Biostatistics           fax: (415) 514-8150
University of California, San Francisco
San Francisco, CA 94107-1739                     hm:  (415) 550-1062
