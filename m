Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1RNwsew023085
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 18:58:54 -0500
Received: from mail.greatschools.net (zeus.greatschools.net [198.144.205.143])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1RNwpgl024596
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 18:58:52 -0500
Received: from zimbra.greatschools.net (zimbra.GreatSchools.Net
	[198.144.205.155])
	by mail.greatschools.net (8.13.8/8.13.8) with ESMTP id l1RNwgnb041122
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 15:58:42 -0800 (PST)
	(envelope-from dane@greatschools.net)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.greatschools.net (Postfix) with ESMTP id 4152C1FA0037
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 15:58:13 -0800 (PST)
Received: from zimbra.greatschools.net ([127.0.0.1])
	by localhost (zimbra.greatschools.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id WyYw8WctJMLj for <linux-lvm@redhat.com>;
	Tue, 27 Feb 2007 15:58:10 -0800 (PST)
Received: from zimbra.greatschools.net (zimbra.greatschools.net
	[198.144.205.155])
	by zimbra.greatschools.net (Postfix) with ESMTP id 5EE2E1FA0033
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 15:58:10 -0800 (PST)
Message-ID: <4384431.130961172620690322.JavaMail.root@zimbra.greatschools.net>
Date: Tue, 27 Feb 2007 15:58:10 -0800 (PST)
From: Dane Miller <dane@greatschools.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshots documentation clarification
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
To: linux-lvm@redhat.com

afternoon collector
	lvm reading
	GS update: single auth db
	check ebay

	bmi virtual machine
	zimbra schedule downtime: snapshot conversion
	zimbra security updates

Hi,

Section 3.8 "Snapshots" of the LVM Howto has a scary warning after the first paragraph (http://tldp.org/HOWTO/LVM-HOWTO/snapshotintro.html), with a caveat in the last sentence:
  "If the snapshot size equals the origin size, it will never overflow."

What exactly does this mean?  Does this imply that it's safe to use "long-term" snapshots whose size is equal to the origin's size, without worrying about effects of significant divergence from the original?  Long-term to me is 3yrs as the root fs of a (Xen domU) mail server.

Note that in this case, writes to the root fs will be limited to logs (/var/log) and software updates.  Mailboxes live on a separate, non-snapshot logical volume.

Thanks,

Dane
