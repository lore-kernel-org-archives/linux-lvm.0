Received: from mx4-phx2.redhat.com (mx02.colomx.prod.int.phx2.redhat.com
	[10.5.7.2])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s558QljW028222
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2014 04:26:47 -0400
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id s558QlGv023425
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2014 04:26:47 -0400
Date: Thu, 5 Jun 2014 04:26:47 -0400 (EDT)
From: Rajesh Joseph <rjoseph@redhat.com>
Message-ID: <1862191909.18215030.1401956807760.JavaMail.zimbra@redhat.com>
In-Reply-To: <1208338730.18211142.1401956193776.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] File-system uuid on LVM snapshot
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
To: linux-lvm@redhat.com

Hi all,

Origin volume and snapshot volume share the same file-system UUID. So after the snapshot we fix the uuid by running xfs_admin or tune2fs.
Do you have any recommendation or best practice in this regard?

Thanks & Regards,
Rajesh
