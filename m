Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBDGe7r07778
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 11:40:07 -0500
Received: from desire.voip.primustel.com (_postfix@desire.cv.telegroup.com
	[208.219.5.17])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBDGe1wh023476
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 11:40:01 -0500
Received: from male.ia.us.primus (male.cv.telegroup.com [10.40.40.244])
	by desire.voip.primustel.com (Postfix) with ESMTP id 029E111C79
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 16:40:00 +0000 (UTC)
Received: from benway.cv.telegroup.com (benway.cv.telegroup.com [10.40.41.175])
	by male.ia.us.primus (8.12.10/8.12.10) with ESMTP id iBDGbOxl007867
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 10:37:24 -0600
Subject: Re: [linux-lvm] some issues with pvmove
From: Aran Cox <acox@ia.primustel.com>
In-Reply-To: <20041209204334.GA11338@agk.surrey.redhat.com>
References: <1102623183.3579.113.camel@benway>
	<20041209204334.GA11338@agk.surrey.redhat.com>
Date: Mon, 13 Dec 2004 10:37:23 -0600
Message-Id: <1102955844.3579.116.camel@benway>
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

On Thu, 2004-12-09 at 20:43 +0000, Alasdair G Kergon wrote:
> On Thu, Dec 09, 2004 at 02:13:03PM -0600, Aran Cox wrote:
> > I've been working on lvmove, a frontend to pvmove that I've used in the
> > past with LVM1 systems to re-organize the layout of logical volumes in a
> > volume group.  I keep getting failures with pvmove that require
> > restoring metadata from backup.  
>  
> Try to get full diagnostics from the simplest case you can which
> causes it to fail: turn on debug-to-file in lvm.conf:
>     log {
>         file="/tmp/lvm2.log"
>         level=7
>         activation=1
>     }
> then when it crashes, grab the current metadata
> with vgcfgbackup [may need -P if it's corrupt]
> (and check against /etc/lvm/backup/<vgname>)
> 
> [If machine hangs you'll may have to set activation=0
> but that loses some of the debug info we want]
> 
> and dump the device-mapper status:
>   dmsetup info -c
>   dmsetup status
>   dmsetup table
> 
> Alasdair

Basically I ended up buying a new HD and after adding that to the VG I
never triggered that bug again.  I intend to try a similar re-
organization on a lab machine some time soonish.  If I trigger any such
bugs in the future I'll try and collect all of the above info before
posting.



-- 
Aran Cox <acox@ia.primustel.com>
