Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1MAbDYV026334
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 05:37:13 -0500
Received: from isis.ankh.org (isis.ankh.org [146.185.21.133])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1MAbBG7019187
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 05:37:12 -0500
Received: from hathor.ankh.org (hathor.ankh.org [91.186.8.35])
	by isis.ankh.org (8.14.5/8.14.5) with ESMTP id s1MAb6TP019862
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 10:37:07 GMT
Received: from ammut.ankh.org ([46.65.25.30] helo=[172.22.128.210])
	by hathor.ankh.org with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.76) (envelope-from <oolon@ankh.org>) id 1WH9xD-0001Zf-48
	for linux-lvm@redhat.com; Sat, 22 Feb 2014 10:37:07 +0000
Message-ID: <53087DDD.7010406@ankh.org>
Date: Sat, 22 Feb 2014 10:37:17 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <20140222071408.GA10598@localhost.localdomain>
In-Reply-To: <20140222071408.GA10598@localhost.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LV mirror extents on same physical device
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Ok I am not really sure what you are trying to do with madm, from what I 
can see you want to move data from pv on md1 to a pv on md2, this is 
really easy to do.

#pvcreate /dev/md2
#vgextend VolGroup00 /dev/md2
# Stop the old pv getting lvs created on it
pvchange -x n /dev/md1
# Whole thing in one go
pvmove -v /dev/md1 /dev/md2
# One at a time
pvmove -v -n rootlv /dev/md1 /dev/md2
vgreduce VolGroup00 /dev/md2

Your done.

James
