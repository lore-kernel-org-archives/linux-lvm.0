Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9SHI7V21714
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 13:18:07 -0400
Received: from volumehost.com
	(IDENT:JNxFJIcPZCtsMFbcnrUNjMDwG/ApWl8p@adsl-69-154-123-201.dsl.fyvlar.swbell.net
	[69.154.123.201])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9SHI1Po016158
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 13:18:05 -0400
Received: from volumehost.com (localhost.localdomain [127.0.0.1])
	by volumehost.com (8.12.8/8.12.5) with ESMTP id j9SHHsUN008181
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 12:17:54 -0500
Received: (from apache@localhost)
	by volumehost.com (8.12.8/8.12.8/Submit) id j9SHHsCm008179
	for linux-lvm@redhat.com; Fri, 28 Oct 2005 12:17:54 -0500
Message-ID: <1130519874.43625d4253324@webmail.volumehost.com>
Date: Fri, 28 Oct 2005 12:17:54 -0500
From: Zac Slade <krakrjak@volumehost.com>
Subject: Re: [linux-lvm] pvresize patch pending
References: <1130518796.4362590c75cf0@webmail.volumehost.com>
	<20051028170130.GH11086@agk.surrey.redhat.com>
In-Reply-To: <20051028170130.GH11086@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Quoting Alasdair G Kergon <agk@redhat.com>:

> On Fri, Oct 28, 2005 at 11:59:56AM -0500, Zac Slade wrote:
> > Is this the right venue to distribute this patch 
> 
> Yes!

Well alright.  Attached is a unified diff I validated that it merges
successfully against LVM2.2.01.13.tar.gz and LVM2.2.01.14.tar.gz.  Those files I
obtained through gentoo's portage system.  I also checked out the cvs and the
patch does apply successfully.  To integrate the patch just enter the
distribution directory where the LVM2 sources are and execute, patch -p1 <
path-to.patch.

For testing we used an lv that was mounted on a loopback device.  The only
option that pvresize will take is a pv pathname.

Here's your patch!
Zac Slade
krakrjak@volumehost.com


-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
