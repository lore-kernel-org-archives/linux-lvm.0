Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4AFjqO2012893
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 16:45:52 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Fdqsq-0003on-7F
	for linux-lvm@redhat.com; Wed, 10 May 2006 16:45:52 +0100
Date: Wed, 10 May 2006 16:45:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Cant remove a locked volume
Message-ID: <20060510154552.GQ16180@agk.surrey.redhat.com>
References: <20060507111720.GA10160@deepthought.kylesfamily.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060507111720.GA10160@deepthought.kylesfamily.com>
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

On Sun, May 07, 2006 at 09:17:20PM +1000, Jason Wilson wrote:
> 	    status = ["READ", "WRITE", "VISIBLE", "LOCKED"]

pvmove adds the lock.
It removes it when it has finished.

'pvmove --abort' is the way to stop a pvmove.

Alasdair
-- 
agk@redhat.com
