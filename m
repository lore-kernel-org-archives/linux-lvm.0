Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB43CClT024780
	for <linux-lvm@redhat.com>; Mon, 3 Dec 2007 22:12:12 -0500
Received: from smtpoutwbe05.prod.mesa1.secureserver.net
	(smtpoutwbe05.prod.mesa1.secureserver.net [208.109.78.207])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id lB43Bftu031923
	for <linux-lvm@redhat.com>; Mon, 3 Dec 2007 22:11:41 -0500
Date: Mon, 03 Dec 2007 20:11:35 -0700
From: Dave Scott <dave@mauidiver.com>
Message-ID: <20071203201135.51068ac31da99c5a25b4d9fb7ad88fd1.20f9b5c6c2.wbe@email.secureserver.net>
MIME-Version: 1.0
Subject: [linux-lvm] recovering data off of unavailable logical volume
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
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I have a disk that used to contain a valid physical volume (pv), volume
group (vg),
and 3 logical volumes (lv). The disk is intact, but cannot be started by
lvm.

Is there a way (via 'dd' or some other fashion) to copy the data off of
this disk
and on to another volume such that I can recover the files?

I have other disks available, but don't know how to get the data off in
a form that
I will be able to read later.

Thanks for your help,

--dave;
