Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3CGpK5j010708
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2010 12:51:20 -0400
Received: from EXHUB016-2.exch016.msoutlookonline.net
	(exhub016-2.exch016.msoutlookonline.net [207.5.72.164])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3CGp75q000697
	for <linux-lvm@redhat.com>; Mon, 12 Apr 2010 12:51:07 -0400
Message-ID: <4BC34F78.8040301@cfl.rr.com>
Date: Mon, 12 Apr 2010 12:51:04 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <OF75144135.FA049A9C-ON48257703.00588F0C-48257703.00593B92@db.com>
In-Reply-To: <OF75144135.FA049A9C-ON48257703.00588F0C-48257703.00593B92@db.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How do I properly backup and restore / on LVM2
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alan Pek <alan.pek@db.com>

On 4/12/2010 12:14 PM, Alan Pek wrote:
> 
> Hi Folks,
> 
> How do I properly backup and restore / on LVM2 , e.g.

The same way you would without LVM2.  Perhaps tar or dump?  If you use
dump then lvm allows you to make a snapshot and back that up instead so
you don't have to boot to single user mode and remount ro.
