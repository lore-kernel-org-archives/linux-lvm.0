Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8RAmCin015804
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 11:48:12 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CBt3E-0004Qc-2Q
	for linux-lvm@redhat.com; Mon, 27 Sep 2004 11:48:12 +0100
Date: Mon, 27 Sep 2004 11:48:12 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Devive mapper compile error
Message-ID: <20040927104812.GP11810@agk.surrey.redhat.com>
References: <200409271222.55865.wim@unetix.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200409271222.55865.wim@unetix.nl>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Sep 27, 2004 at 12:22:55PM +0200, Wim Bakker wrote:
> ioctl/libdm-iface.c:982: error: dereferencing pointer to incomplete type

> What might be causing this?
 
Missing header files or incorrect arguments to 'configure'?
Check the instructions in the 'INSTALL' file carefully.
(e.g. Most people shouldn't specify a kernel source dir).

Alasdair
-- 
agk@redhat.com
