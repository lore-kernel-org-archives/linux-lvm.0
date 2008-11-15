Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mAF2uVMN031478
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 21:56:31 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1L1BKp-0000y3-78
	for linux-lvm@redhat.com; Sat, 15 Nov 2008 02:56:31 +0000
Date: Sat, 15 Nov 2008 02:56:31 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Editing LVM 2 metadata
Message-ID: <20081115025631.GY30569@agk.fab.redhat.com>
References: <878853.96084.qm@web38301.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878853.96084.qm@web38301.mail.mud.yahoo.com>
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

On Fri, Nov 14, 2008 at 06:37:51PM -0800, Michael Jensen wrote:
> However, after I edited the LABELONE area where the binary copy of the PV
> UUID is stored (200x offset area) and the ASCII version at 12b0x and 16b0x
> and reboot - vgscan no longer recognizes the VG.
 
If you just need to change the UUIDs to make them unique look in the list
archives for instructions: the tools have options to do that.

Alasdair
-- 
agk@redhat.com
