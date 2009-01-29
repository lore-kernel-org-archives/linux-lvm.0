Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0TFVAQQ016129
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 10:31:10 -0500
Received: from Vail.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0TFUmUd006002
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 10:30:49 -0500
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by Vail.esri.com (8.13.7+Sun/8.13.7) with ESMTP id n0TFUlBg023837
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 07:30:47 -0800 (PST)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.1) with ESMTP id n0TFUlpB010360
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 07:30:47 -0800
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n0TFUlKK010359
	for linux-lvm@redhat.com; Thu, 29 Jan 2009 07:30:47 -0800
Date: Thu, 29 Jan 2009 07:30:47 -0800
From: Ray Van Dolson <rvandolson@esri.com>
Message-ID: <20090129153047.GA10306@esri.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Local + iSCSI disks
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

Looking for thoughts on a VolGroup and LV made up of both local and
remote, iSCSI attached disks.  Obviously it will work, but are there
any settings or "gotchas" I should be aware of with this configuration?
Obviously a speed penalty...

I know I could also aggregate with the md driver and set things up to
do writes/reads to a specific disk depending on whether or not its
local, etc.  Anything like that in the LVM world?

Thanks,
Ray
