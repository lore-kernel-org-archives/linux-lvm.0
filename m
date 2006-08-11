Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BLfoxL031221
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 22:41:50 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GBelK-0000gB-Kq
	for linux-lvm@redhat.com; Fri, 11 Aug 2006 22:41:50 +0100
Date: Fri, 11 Aug 2006 22:41:50 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Archive Question
Message-ID: <20060811214150.GL18633@agk.surrey.redhat.com>
References: <44DCF352.3080605@cup.hp.com>
	<20060811211922.GK18633@agk.surrey.redhat.com>
	<44DCF622.4030006@cup.hp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44DCF622.4030006@cup.hp.com>
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

On Fri, Aug 11, 2006 at 02:26:58PM -0700, John DeFranco wrote:
> /etc/ is a local writeable filesystem. I believe this occurs when I'm 
> issuing a vgchange --addtag and/or vgchange -a y. I have scripts scripts
> that are executing these commands but nothing that should be done in 
> parallel.
 
And you have default locking enabled?
  locking_type = 1  locking_dir = "/var/lock/lvm"
  in lvm.conf with /var also local

Perhaps there's some race in the backup file code:
It would be useful to have a list of all the lvm commands that might
possibly be executing against each other.

Alasdair
-- 
agk@redhat.com
