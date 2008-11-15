Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mAF2tFdW031278
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 21:55:16 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1L1BJb-0000xy-PD
	for linux-lvm@redhat.com; Sat, 15 Nov 2008 02:55:15 +0000
Date: Sat, 15 Nov 2008 02:55:15 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Editing LVM 2 metadata
Message-ID: <20081115025515.GX30569@agk.fab.redhat.com>
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
> I have a need to edit the metadata on an LVM2 PV.

Why?

If you really have to, please do this using the supplied tools - it's *much*
easier!

vgcfgbackup gives you a text file, edit it, vgcfgrestore puts it back.

If you need to edit the label too, careful use of pvcreate --restorefile --uuid
plus vgcfgrestore lets you do that.

Alasdair
-- 
agk@redhat.com
