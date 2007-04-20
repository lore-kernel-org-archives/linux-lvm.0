Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3KDafOl013650
	for <linux-lvm@redhat.com>; Fri, 20 Apr 2007 09:36:41 -0400
Received: from mail.esperi.org.uk (41-052.adsl.zetnet.co.uk [194.247.41.52])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3KDaakA017015
	for <linux-lvm@redhat.com>; Fri, 20 Apr 2007 09:36:38 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	l3KDaSIJ004347
	for <linux-lvm@redhat.com>; Fri, 20 Apr 2007 14:36:28 +0100
Subject: Re: [linux-lvm] LVM questions
References: <Pine.LNX.4.44.0703291325420.29826-100000@bmsred.bmsi.com>
From: Nix <nix@esperi.org.uk>
Date: Fri, 20 Apr 2007 14:36:26 +0100
In-Reply-To: <Pine.LNX.4.44.0703291325420.29826-100000@bmsred.bmsi.com>
	(Stuart D. Gathman's message of "Thu,
	29 Mar 2007 13:38:50 -0400 (EDT)")
Message-ID: <87r6qfgobp.fsf@hades.wkstn.nix>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 29 Mar 2007, Stuart D. Gathman said:
> For anything that will never be physically moved to another machine, keep
> it all on one volume group.  But, for instance, if you think you might
> want to move the iSCSI data to another box at some point, keep it 
> in its own VG (with its own set of drives) to make that easy.

I also use VGs when I have several classes of PV with radically
different properties (especially failure properties) and want to be sure
that the failure of one PV can't possibly affect the LVs on the devices
with other failure properties.

At one point I had three VGs on one of my systems. One spanned PVs on
top of a RAID-5 md array. That array was composed of disks of radically
different sizes, so I had another VG spanning PVs consuming all that
slack space. Then, for testing purposes, I had another VG sitting
entirely atop the network block device.

The NBDed VG could be expected to go down fairly frequently (as NBD
connections don't outlast server reboots), but I didn't want that to
affect either of the local VGs. The non-RAIDed VG might fail if a single
disk dies, but that only had news spool and caches on it so I didn't
want it to affect the important stuff on the RAIDed VGs.

Hence, three VGs made considerable sense.
