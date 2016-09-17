Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8HD4xmw029602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 09:04:59 -0400
Received: from nm15-vm3.bullet.mail.ne1.yahoo.com
	(nm15-vm3.bullet.mail.ne1.yahoo.com [98.138.91.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88CA344804
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 13:04:58 +0000 (UTC)
Date: Sat, 17 Sep 2016 13:04:56 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <368387847.156920.1474117496841@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <368387847.156920.1474117496841.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] creating DD copies of disks
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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


> What is the proper procedure when duplicating a disk with DD?

If you're literally duplicating the entire disk, what on earth are you doing keeping it in the same system? OF COURSE you remove it from the origin box if you expect to do anything with it. And I presume there are no active filesystems or frankly writable LVM components on the source disk while the DD is running? 

Most times it's only the filesystems that contain interesting data an so a DD of the filesystem is understandable even though there are other tools like RSYNC which are more logical.

If you're trying to make a forensic copy, please delegate the task to professionals, who know what they are doing.
