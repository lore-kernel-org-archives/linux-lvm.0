Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j4VD0Ohf007434
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 14:00:24 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Dd6M4-0001EA-4q
	for linux-lvm@redhat.com; Tue, 31 May 2005 14:00:24 +0100
Date: Tue, 31 May 2005 14:00:24 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] deadlock on snapshot creation;
	any way out without a reboot?
Message-ID: <20050531130024.GV15809@agk.surrey.redhat.com>
References: <20050531110414.GP686@strugglers.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050531110414.GP686@strugglers.net>
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

On Tue, May 31, 2005 at 11:04:14AM +0000, Andy Smith wrote:
> One of my LVs has just become unusable and I am hoping there is a
> way to fix it without rebooting.
 
What's the output of?
  dmsetup info -c
  lvs -v

Alasdair
-- 
agk@redhat.com
