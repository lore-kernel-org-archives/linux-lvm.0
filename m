In-Reply-To: <00fa01c22327$0de25a70$6a754c0f@india.hp.com>
References: <00fa01c22327$0de25a70$6a754c0f@india.hp.com>
References: <200203250337.OAA55079@snort.melbourne.sgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20020704164737N.masano@tnes.nec.co.jp>
From: ASANO Masahiro <masano@tnes.nec.co.jp>
Subject: [linux-lvm] Re: kernel panicked when mounting XFS LVM volumes on
 kernel-2.4.17-ia64
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Jul  4 02:47:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: zameer@india.hp.com
Cc: linux-lvm@sistina.com, linux-xfs@oss.sgi.com

Hi,

From: "Zameer M" <zameer@india.hp.com>
Subject: kernel panicked when mounting XFS LVM volumes on kernel-2.4.17-ia64
Date: Thu, 4 Jul 2002 12:20:14 +0530
Message-ID: <00fa01c22327$0de25a70$6a754c0f@india.hp.com>

> Hi,
> 
>    Kernel panicked when mounting XFS LVM volumes.
> 
> The following is configuration used.
> 1)kernel-2.4.17
> 2)linux-2.4.17-ia64-011226.diff
> 3)linux-2.4.17-xfs-2002-02-07.cvs-patch
> 4)lvm-1.1-rc1

If your box's page size is larger than 4KB, use more recent CVS tree
(at least after 25th March) or change _pagebuf_page_io() in
linux/fs/pagebuf/page_buf.c as follows.

 from:	struct buffer_head *bh, *bufferlist[8];
 to:	struct buffer_head *bh, *bufferlist[PAGE_SIZE/512];

--
Masano
