Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2FGs1S13658
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 11:54:01 -0500
Received: from localhost.localdomain (host-65-120-145-91.coremetrics.com
	[65.120.145.91] (may be forged))
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2FGs007005029
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 11:54:00 -0500
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.12.8/8.12.8) with ESMTP id i2FGrqsN004628
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 10:53:52 -0600
Received: (from austin@localhost)
	by localhost.localdomain (8.12.8/8.12.8/Submit) id i2FGrqLs004624
	for linux-lvm@redhat.com; Mon, 15 Mar 2004 10:53:52 -0600
Subject: Re: [linux-lvm] VGs gone!
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20040315094504.30807.qmail@web80601.mail.yahoo.com>
References: <20040315094504.30807.qmail@web80601.mail.yahoo.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1079369631.3143.10.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Mon, 15 Mar 2004 10:53:51 -0600
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
To: LVM general discussion and development <linux-lvm@redhat.com>

You should not have recreated the lvmtab without backing up the total
config, and restoring it after dding the partitions back. 

On Mon, 2004-03-15 at 03:45, David Minor wrote:
> My volumes have disappeared.  can anyone help recover?
> 
> setup: 
> I have two drives partitioned identically so that they
> can be mirrored.  each drive has a boot, swap, and a
> very large lvm partition.  We had a problem with the
> root partition on the first drive, so we decided to
> restore from the mirror using dd.  After doing this,
> the VGs are not in existence anymore.  running
> 'vgscan' shows it creates /etc/lvmtab and
> /etc/lvmtab.d correctly, but they are empty.  
> 
> Is there a way to recreate this information?
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Austin Gonyou <austin@coremetrics.com>
Coremetrics, Inc.
