Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBLGdTr27830
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 11:39:29 -0500
Received: from host1.appws.com ([216.136.72.3])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBLGdNXf006568
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 11:39:23 -0500
Received: from grandmother.littlebald.lan (localhost.localdomain [127.0.0.1])
	by grandmother.littlebald.com (8.12.8/8.12.8) with ESMTP id
	iBLFdC8P012125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 10:39:12 -0500
Received: (from david@localhost)
	by grandmother.littlebald.lan (8.12.8/8.12.8/Submit) id iBLFdBEC012123
	for linux-lvm@redhat.com; Tue, 21 Dec 2004 10:39:11 -0500
Subject: Re: [linux-lvm] lvm/fs issue
From: David Johnston <david@littlebald.com>
In-Reply-To: <0B834CEE3453504B82AB821DFB7047C1FF01AC@enyc11p32003.corpny.csfb.com>
References: <0B834CEE3453504B82AB821DFB7047C1FF01AC@enyc11p32003.corpny.csfb.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1103643551.11586.10.camel@grandmother.littlebald.lan>
Mime-Version: 1.0
Date: Tue, 21 Dec 2004 10:39:11 -0500
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

On Tue, 2004-12-21 at 10:19, Rosenstrauch, David wrote:
> Hi.  Having an odd problem with lvm and/or my file system.  Can anyone offer
> any ideas what might be wrong?
> 
> Drive is set up as follows:
> 
> (parted) print
> Disk geometry for /dev/sda: 0.000-38154.375 megabytes
> Disk label type: msdos
> Minor    Start       End     Type      Filesystem  Flags
> 1          0.016    244.000  primary   reiserfs    boot
> 2        244.000   2197.000  primary   linux-swap
> 3       2197.000  38154.000  extended
> 5       2197.016  16845.000  logical   reiserfs
> 6      16845.016  21728.000  logical
> 7      21728.016  26611.000  logical
> 8      26611.016  31494.000  logical
> 9      31494.016  38154.000  logical
> 
> 
> /dev/sda3 is an extended partition, with /dev/sda5 through 9 under it.
> /dev/sda5 is a standard reiser partition (mounted at /), and /dev/sda6 through
> 9 make up a logical volume /dev/lvgroup1/lvshare (also using reiserfs) which
> gets mounted at /usr/local/share.

I'm not sure about your error, but I would merge sda[6789] into a single
partition.  Splitting a disk and then putting it back together in
software just adds an unnecessary load to your system (only one Physcial
Volume per disk).  In other words, sda6 should go from 16845.016 to
38154.000.  Getting there may be a challenge, though ;-)

Taking a stab at your problem, I would first look to see if you've
exclude sda3 from LVM.  I am guessing that you haven't, and that LVM is
trying to read a PV id off sda3.
-- 
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
