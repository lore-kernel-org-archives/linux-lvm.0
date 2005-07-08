Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j68Hcr3N013284
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 18:38:53 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DqwoP-0000cl-PE
	for linux-lvm@redhat.com; Fri, 08 Jul 2005 18:38:53 +0100
Date: Fri, 8 Jul 2005 18:38:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvextend
Message-ID: <20050708173853.GU12337@agk.surrey.redhat.com>
References: <20050708164536.GE15561@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050708164536.GE15561@wavehammer.waldi.eu.org>
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
To: linux-lvm@redhat.com

On Fri, Jul 08, 2005 at 06:45:36PM +0200, Bastian Blank wrote:
> I found some mails about a pvextend but noone implemented it. If I see

pvresize

> it correctly, I just need to change the value of pe_count and commit the
> metadata, correct?

No:-)
 
> If yes, a poor mans pvextend is vi and pvcreate with the changed
> metadata backup.

Yes.  


vgcfgbackup
edit file
pvcreate --restorefile --uuid
vgcfgrestore


A pvresize command needs to implement that same sequence of commands internally.
(similar to the way vgconvert works)
 
Alasdair
-- 
agk@redhat.com
