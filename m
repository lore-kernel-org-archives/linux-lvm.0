Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBBAgVr06912
	for <linux-lvm@redhat.com>; Sat, 11 Dec 2004 05:42:31 -0500
Received: from dedicated.mountainviewdata.com
	(207-234-129-26.ptr.primarydns.com [207.234.129.26])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBBAgNNN003543
	for <linux-lvm@redhat.com>; Sat, 11 Dec 2004 05:42:23 -0500
Received: from DavidLT.cn.mvd (adsl-64-169-170-250.dsl.snfc21.pacbell.net
	[64.169.170.250])
	by dedicated.mountainviewdata.com (Postfix) with ESMTP id 3DBDDA0026
	for <linux-lvm@redhat.com>; Sat, 11 Dec 2004 02:39:52 -0800 (PST)
Date: Sat, 11 Dec 2004 18:42:10 +0800
From: David Yu <david@mountainviewdata.com>
Subject: Re: [linux-lvm] LVM and umount strangeness
Message-Id: <20041211184210.10ac7870.david@mountainviewdata.com>
In-Reply-To: <1101958776.41ae8e789ded6@elm2a.cns.ohiou.edu>
References: <1101958776.41ae8e789ded6@elm2a.cns.ohiou.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi Tim,
On Wed, 01 Dec 2004 22:39:36 -0500
Tim Hibbard <hibbard@ohio.edu> wrote:
> I try to do a umount /dev/lvm/disks I get a message "umount: /dev/lvm/disks: not
> mounted" (even though it is).  
 It seems that the volume is still mounted. You can check /proc/mounts for this.
"Not mounted" means "umount" cannot find a entry in /etc/mtab. You can
add the proper entry in mtab and try umount again.
 Btw, this is my 1st post in lvm list :)

-- 

Best regards,
David
___________________________________________________
David Yu
Mountain View Data Inc.
http://www.mountainviewdata.com
Tel: +86(10)8440-8185
Fax: +86(10)8440-7519
