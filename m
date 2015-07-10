Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6AMt3mn024866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 18:55:03 -0400
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mx1.redhat.com (Postfix) with ESMTPS id C2766413056
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 22:55:02 +0000 (UTC)
Received: by wifm2 with SMTP id m2so58005004wif.1
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 15:55:01 -0700 (PDT)
MIME-Version: 1.0
From: Dax Kelson <dkelson@gurulabs.com>
Date: Fri, 10 Jul 2015 16:54:41 -0600
Message-ID: <CAFDa5Q2orc8Z+Apizq17xVGy8Tb+964w2AidDU6k5yhfzg=Ajw@mail.gmail.com>
Subject: [linux-lvm] CachePoolLV with multiple Origin LVs?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@redhat.com>

Couple questions about LVM Caching

First question.

I have a couple SSDs in a hardware RAID 1 as /dev/sdb

I'd like to use them to speed up with write-back cache a couple LVs
that reside on /dev/sda.

Can I use one CachePoolLV with multiple Origin (slow) LVs?

Second question.

If I grow the size of sda can I run pvresize on it and and the add the
space to the slow LVs in an online fashion?

Thanks,
Dax kelson
