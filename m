Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2NNXnj26919
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 18:33:49 -0500
Received: from ip66-106-138-51.z138-106-66.customer.algx.net
	(ip66-106-138-51.z138-106-66.customer.algx.net [66.106.138.51])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2NNXlWA028658
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 18:33:47 -0500
Received: from [192.168.1.126] (rich [192.168.1.126])
	by ip66-106-138-51.z138-106-66.customer.algx.net (Postfix) with ESMTP
	id BD2F711804
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 15:33:46 -0800 (PST)
From: Rich Turner <rich@storix.com>
Message-Id: <1080084826.2434.34.camel@rich>
Mime-Version: 1.0
Date: Tue, 23 Mar 2004 15:33:46 -0800
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshots and 2.6 kernel
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

i understand from numerous posts on this list and many others that
snapshots in the 2.6 kernel is not yet supported.

the lvm commands allow you to create the snapshot but do nothing with
it. even worse, i am unable to remove the snapshot or get the original
logical volume active.

is there any progress in the 2.6 kernel supporting snapshots?

is there any way to know if the snapshot will be valid before creating
the snapshot (other than 'uname -r')?

which is the culprit: device-mapper, lvm?
