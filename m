Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HEOdur011850
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 10:24:39 -0400
Received: from smtp.andrew.cmu.edu (smtp.andrew.cmu.edu [128.2.10.81])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HEOZqD010137
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 10:24:35 -0400
Received: from [192.168.1.100] (CMU-179222.WV.CC.cmu.edu [128.237.227.255])
	(user=gnychis mech=PLAIN (0 bits))
	by smtp.andrew.cmu.edu (8.13.5/8.13.6) with ESMTP id k4HEOauK004207
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 10:24:36 -0400
Message-ID: <446B3233.6070104@cmu.edu>
Date: Wed, 17 May 2006 10:24:51 -0400
From: George Nychis <gnychis@cmu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] what is vgwrapper and where did it go?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

In my mkinitrd for FC3, it tries copying /sbin/vgwrapper to the initrd
and linking vgscan and vgchange to it.  But... it doesn't exist it any
version of LVM i've ever seen.

So i'm not sure why it does this, but I can't boot LVM's so i think i
need to fix this up.

Thanks!
George
