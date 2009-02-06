Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n16FPa6t009783
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 10:25:36 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n16FPJW2012371
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 10:25:19 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LVSZw-0003dW-5y
	for linux-lvm@redhat.com; Fri, 06 Feb 2009 15:25:16 +0000
Received: from 69-196-139-226.dsl.teksavvy.com ([69.196.139.226])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 06 Feb 2009 15:25:16 +0000
Received: from monnier by 69-196-139-226.dsl.teksavvy.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 06 Feb 2009 15:25:16 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Fri, 06 Feb 2009 10:25:06 -0500
Message-ID: <jwvbptfmvwi.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <jwvfxisobi2.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<498B590E.3020901@redhat.com>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: LVM skips /dev/hde3 because sysfs tells it not to
	use it
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

> I guess you can also hit this "known" problem with 
> old lvm toolset (<2.02.29) and new kernel with new sysfs layout.

Yes, sorry about that, that was the culprit.  I had done a "apt-get
upgrade", but forgot that this box runs Debian "stable".  After upgrading lvm2
to the "testing" version of the lvm2 package, the problem disappeared.

Thank you for your help,


        Stefan
