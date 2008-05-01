Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41KPZ5E014301
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:25:35 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m41KPYLi032004
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:25:35 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JrfLS-0000ci-JQ
	for linux-lvm@redhat.com; Thu, 01 May 2008 21:25:34 +0100
Date: Thu, 1 May 2008 21:25:34 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
Message-ID: <20080501202534.GU18935@agk.fab.redhat.com>
References: <4818F2FC.5050907@verizon.net> <20080501154800.GA5941@us.ibm.com>
	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
	<481A08A7.5010305@verizon.net> <481A0E28.5030108@Media-Brokers.com>
	<481A1C09.7070508@verizon.net> <481A1D32.6020705@Media-Brokers.com>
	<481A1FAF.5050303@verizon.net> <481A221D.80209@Media-Brokers.com>
	<481A262C.7080908@verizon.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <481A262C.7080908@verizon.net>
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

On Thu, May 01, 2008 at 04:21:00PM -0400, Gerry Reno wrote:
> At least in the case where the snapshot is read-only (LVM1 default, LVM2 
> by config?), if the snapshot is lost, invalid, not removed from VG prior 
> to reboot, when LVM comes back up it should see this and immediately 
> know that it can just vgreduce VG --removemissing for the old snapshot.  
> In the case of rw (no LVM1, LVM2 default), it should be a user choice 
> and LVM should prompt the user at boot as to whether to remove this old 
> snapshot so it can attempt to activate the VG.  Unless the user knows 
> that there were non-backup related lvm mods written during the snapshot 
> (eg: pvmove) then the user will just answer yes and the system should 
> boot.  This is how LVM should operate in this scenario.
 
If you want your system to do that, update your initrd/initscripts
accordingly to run the appropriate lvm2 commands to do that!

Alasdair
-- 
agk@redhat.com
