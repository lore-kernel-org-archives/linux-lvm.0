Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0E7OY94031662
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2015 02:24:34 -0500
Received: from mail.shockmedia.nl (mail.shockmedia.nl [31.7.4.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0E7OWge011866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2015 02:24:32 -0500
Received: from office.shockmedia.nl ([31.7.3.253] helo=[192.168.8.179])
	by mail.shockmedia.nl with esmtpa (Exim 4.82)
	(envelope-from <bram@shockmedia.nl>) id 1YBIJb-0002me-75
	for linux-lvm@redhat.com; Wed, 14 Jan 2015 08:24:31 +0100
Message-ID: <54B619AE.6020704@shockmedia.nl>
Date: Wed, 14 Jan 2015 08:24:30 +0100
From: Bram Klein Gunnewiek <bram@shockmedia.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] determining snapshot overhead
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello,

I am trying to create snapshots of thick volumes that can't break 
because they overflow (thin volumes are not an option right now). I 
can't find information on how to calculate (in advance) the metadata 
overhead of a snapshot when all blocks in the origin volume are changed 
(e.g. the snapshot is 100% full). Is there a way to do this?

-Bram
