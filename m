Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j04MHgr10895
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 17:17:42 -0500
Received: from storix.com (mill-adnc_internal-206-71-178-18.adnc.com
	[206.71.178.18] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j04MHfOu031196
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 17:17:41 -0500
Received: from [192.168.1.126] (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id DB6F21592C
	for <linux-lvm@redhat.com>; Tue,  4 Jan 2005 13:56:10 -0800 (PST)
From: rich turner <rich@storix.com>
Message-Id: <1104877190.10802.15.camel@rich>
Mime-Version: 1.0
Date: Tue, 04 Jan 2005 14:19:51 -0800
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] root filesystem snapshots
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

in the past i have read a number of posts related to problems with doing
snapshots of logical volumes that contain the root filesystem. i am able
to replicate the problem here as well, the system just hangs. can anyone
tell me specifically what the problem relates to and if there is a fix
available? i have downloaded the latest LVM2 source and there is no
mention of it in WHATS_NEW.

i would like to warn people should they decide to do a snapshot of a
logical volume that contains the root filesystem. under what
circumstances will i run into this problem?
is it a certain level of LVM?
a certain level of the kernel?
a certain level of device-mapper?
a certain filesystem type?

also, i have seen problems with doing snapshots of filesystems using
ext3. i assume this is related to the VFS lock patch. should i be able
to perform snapshots of ext3 filesystems without failure?
