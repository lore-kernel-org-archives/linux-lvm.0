Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5N3cIu10994
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 23:38:18 -0400
Received: from mail.antispamx.com ([202.85.226.213])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5N3cAsI002588
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 23:38:11 -0400
Message-Id: <200506230338.j5N3cAsI002588@mx3.redhat.com>
From: "Felix Chu" <felixchu@powernetix.com>
Date: Thu, 23 Jun 2005 11:38:10 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Logical volume > 2TB question
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


Hi all,

I have a 4TB storage on iscsi target(Linux). Volume group can show 4TB. When
I create a 3TB logical volume, I find that Windows initiator cannot use this
3TB storage. If I use Linux initiator, it can connect but only 2TB is
available. 

I know that there is limitation of LV with 2TB max. Any method to solve it?
I am using Fedora core 3 with kernel 2.6.11.12.

Thanks,
Felix
