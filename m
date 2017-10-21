Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AB545D75E
	for <linux-lvm@redhat.com>; Sat, 21 Oct 2017 16:05:36 +0000 (UTC)
Received: from sonic307-9.consmr.mail.gq1.yahoo.com
	(sonic307-9.consmr.mail.gq1.yahoo.com [98.137.64.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75671711F9
	for <linux-lvm@redhat.com>; Sat, 21 Oct 2017 16:05:35 +0000 (UTC)
Date: Sat, 21 Oct 2017 16:05:32 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1244564108.1073508.1508601932111@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1244564108.1073508.1508601932111.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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

0) what is the full DD command you are issuing? (I think we have this)

1) does your DD command work when LVM is not using caching of any kind.

2) does your DD command work if using 'direct' mode

3) are you able to write smaller chunks from NON-cached LVM volume to SSD vdev? Is there an inflection point in size where it goes haywire?

4) what is your IO elevator/scheduler set to?

5) what is value of
vm.dirty_background_ratio
vm.dirty_ratio
vm.dirty_background_bytes
vm.dirty_bytes

What do you observe in /proc/vmstat during DD?

6) run DD via strace
