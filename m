Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i88Bwf316695
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2004 07:58:41 -0400
Received: from server.klaube.net (root@www.klaube.net [195.190.148.2])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i88BwdS0020388
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2004 07:58:39 -0400
Received: from server.klaube.net (localhost [127.0.0.1])
	by server.klaube.net (8.12.3/8.12.2/SuSE Linux 0.6) with ESMTP id
	i88BwUJO023723
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2004 13:58:30 +0200
Received: (from t1@localhost)
	by server.klaube.net (8.12.3/8.12.3/Submit) id i88BwUl2023722
	for linux-lvm@redhat.com; Wed, 8 Sep 2004 13:58:30 +0200
Date: Wed, 8 Sep 2004 13:58:30 +0200
From: Thomas Klaube <thomas@klaube.net>
Subject: Re: [linux-lvm] LVM2 snapshots on root fs
Message-ID: <20040908115830.GA23040@server.klaube.net>
References: <20040907110330.GE2689@server.klaube.net>
	<20040907181748.GD6264@agk.surrey.redhat.com>
	<1094581563.9586.98.camel@pc>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1094581563.9586.98.camel@pc>
Reply-To: Thomas Klaube <thomas@klaube.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Tue, Sep 07, 2004 at 02:26:03PM -0400, Brian J. Murrell wrote:
> On Tue, 2004-09-07 at 19:17 +0100, Alasdair G Kergon wrote:
> 
> > It is possible to snapshot the root volume, but the method is probably 
> > distribution-specific.
> 
> Like what?  Using a copy of the /sbin/lvm2 binary not living in the
> rootfs when you want to snapshot it?  What about /lib/libdevmapper.so.*?
> Does it have the same problem?


Just copying /sbin/lvm2 to some other (non root) lvm does not do the 
job for me. Even if it worked it seems to be an ugly workaround. 

The question is, if there are plans to change the snapshot capabilities
of lvm2 in a way, that makes it possible to create snapshots even if the
tools reside on the lvm.

Regards
Thomas Klaube
