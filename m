Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o12HPLLo020225
	for <linux-lvm@redhat.com>; Tue, 2 Feb 2010 12:25:22 -0500
Received: from h7.zynet2.co.uk (h7.zynet2.co.uk [212.24.80.7])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o12HP6MA003405
	for <linux-lvm@redhat.com>; Tue, 2 Feb 2010 12:25:06 -0500
Received: from h93.zynet2.co.uk (h93.zynet2.co.uk [212.24.80.93])
	by h7.zynet2.co.uk (Postfix) with ESMTP id D182F24509
	for <linux-lvm@redhat.com>; Tue,  2 Feb 2010 17:25:05 +0000 (GMT)
Received: from h66.zynet2.co.uk (h66.zynet2.co.uk [212.24.80.66])
	(Authenticated sender: simon)
	by h93.zynet2.co.uk (Postfix) with ESMTPA id C59FE8B2849
	for <linux-lvm@redhat.com>; Tue,  2 Feb 2010 17:25:05 +0000 (GMT)
From: Simon Waters <simonw@zynet.net>
Date: Tue, 2 Feb 2010 17:25:03 +0000
References: <201002011828.29896.simonw@zynet.net>
	<20100202065547.GA24147@maude.comedia.it>
	<201002021021.32002.simonw@zynet.net>
In-Reply-To: <201002021021.32002.simonw@zynet.net>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <201002021725.05245.simonw@zynet.net>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tuesday 02 February 2010 10:21:30 Simon Waters wrote:
> Is this due to old metadata on the disk, or is there something going wrong
> in the installation process.

dd if=/dev/zero of=/dev/sda
dd if=/dev/zero of=/dev/sdb

From the Debian install CD, and then a reboot (otherwise the Debian installer 
remembers the old LVM information it read from disk when it booted, and 
complains things aren't like the use to be.
