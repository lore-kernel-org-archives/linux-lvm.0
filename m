Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k83EoRO3007656
	for <linux-lvm@redhat.com>; Sun, 3 Sep 2006 15:50:27 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GJtIp-0006HG-9K
	for linux-lvm@redhat.com; Sun, 03 Sep 2006 15:50:27 +0100
Date: Sun, 3 Sep 2006 15:50:27 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Restore after lvmove crash
Message-ID: <20060903145027.GD13859@agk.surrey.redhat.com>
References: <1157243204.44fa2144de2a0@imp1-g19.free.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1157243204.44fa2144de2a0@imp1-g19.free.fr>
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

On Sun, Sep 03, 2006 at 02:26:44AM +0200, fabsk@free.fr wrote:
> I don't understand where LVM2 can find this "pvmove0", I thought that if should

Use 'pvmove --abort' to remove that.

Alasdair
-- 
agk@redhat.com
