Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o12HiDeE016388
	for <linux-lvm@redhat.com>; Tue, 2 Feb 2010 12:44:13 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o12HhvDo009406
	for <linux-lvm@redhat.com>; Tue, 2 Feb 2010 12:43:58 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o12Hhvdr020123
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 2 Feb 2010 12:43:57 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o12HhvP2005104
	for <linux-lvm@redhat.com>; Tue, 2 Feb 2010 12:43:57 -0500
Date: Tue, 2 Feb 2010 12:43:56 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <201002021725.05245.simonw@zynet.net>
Message-ID: <Pine.LNX.4.64.1002021242040.4976@bmsred.bmsi.com>
References: <201002011828.29896.simonw@zynet.net>
	<20100202065547.GA24147@maude.comedia.it>
	<201002021021.32002.simonw@zynet.net>
	<201002021725.05245.simonw@zynet.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm]
 =?iso-8859-1?q?Newbie=3A_Yet_another_=22Incorrect_met?=
 =?iso-8859-1?q?adata_area=09header_checksum=22?=
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2 Feb 2010, Simon Waters wrote:

> On Tuesday 02 February 2010 10:21:30 Simon Waters wrote:
> > Is this due to old metadata on the disk, or is there something going wrong
> > in the installation process.
> 
> dd if=/dev/zero of=/dev/sda
> dd if=/dev/zero of=/dev/sdb
> 
> >From the Debian install CD, and then a reboot (otherwise the Debian installer 
> remembers the old LVM information it read from disk when it booted, and 
> complains things aren't like the use to be.

Above wipes entire disk - which is good for a fresh install.  But
just making sure.  Not so good if you wanted to keep some partitions...

A faster way to wipe the entire disk is to use the security erase
feature of SMART disks available via /sbin/hdparm.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
