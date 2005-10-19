Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9JHO7V25117
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 13:24:07 -0400
Received: from lennier.cc.vt.edu (lennier.cc.vt.edu [198.82.162.213])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9JHO6IG016396
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 13:24:06 -0400
Received: from vivi.cc.vt.edu (IDENT:mirapoint@evil-vivi.cc.vt.edu [10.1.1.12])
	by lennier.cc.vt.edu (8.12.11/8.12.11) with ESMTP id j9JHO1Bq022877
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 13:24:01 -0400
Subject: Re: [linux-lvm] error on extending ext3
From: Bill Ranck <ranck@vt.edu>
In-Reply-To: <ED9BF0756A45484AB3EAB2E20D1AD49C7D9DC5@server4.bfc.net>
References: <ED9BF0756A45484AB3EAB2E20D1AD49C7D9DC5@server4.bfc.net>
Date: Wed, 19 Oct 2005 13:22:56 -0400
Message-Id: <1129742576.29185.113.camel@joesgrill.cc.vt.edu>
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
To: LVM discussion list <linux-lvm@redhat.com>

On Wed, 2005-10-19 at 01:10 +0200, Durnin, Robert wrote:
> 

> the logical volume (when displayed etc) shows itself to be the correct
> size. However, when I try to run resize2fs I get messages coming back
> which say it is impossible and even full.

Have you tried ext2online to grow the filesystem?  I did this with an
ext3 filesystem after adding another physical volume and it worked
great.  Almost scary how easy it worked.

-- 
Bill Ranck
Blacksburg, Va.
540-231-3951
