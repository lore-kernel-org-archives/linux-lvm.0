Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iB9KhYH6000536
	for <linux-lvm@redhat.com>; Thu, 9 Dec 2004 20:43:34 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CcV8Q-00030J-Ay
	for linux-lvm@redhat.com; Thu, 09 Dec 2004 20:43:34 +0000
Date: Thu, 9 Dec 2004 20:43:34 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] some issues with pvmove
Message-ID: <20041209204334.GA11338@agk.surrey.redhat.com>
References: <1102623183.3579.113.camel@benway>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1102623183.3579.113.camel@benway>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Dec 09, 2004 at 02:13:03PM -0600, Aran Cox wrote:
> I've been working on lvmove, a frontend to pvmove that I've used in the
> past with LVM1 systems to re-organize the layout of logical volumes in a
> volume group.  I keep getting failures with pvmove that require
> restoring metadata from backup.  
 
Try to get full diagnostics from the simplest case you can which
causes it to fail: turn on debug-to-file in lvm.conf:
    log {
        file="/tmp/lvm2.log"
        level=7
        activation=1
    }
then when it crashes, grab the current metadata
with vgcfgbackup [may need -P if it's corrupt]
(and check against /etc/lvm/backup/<vgname>)

[If machine hangs you'll may have to set activation=0
but that loses some of the debug info we want]

and dump the device-mapper status:
  dmsetup info -c
  dmsetup status
  dmsetup table

Alasdair
-- 
agk@redhat.com
