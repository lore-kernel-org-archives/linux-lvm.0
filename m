Subject: Re: [linux-lvm] raid and lvm
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20030128.rVq.68055000@dl380.home.network>
References: <20030128.rVq.68055000@dl380.home.network>
Message-Id: <1043789186.2100.4.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Jan 28 15:27:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Am Die, 2003-01-28 um 20.00 schrieb SI Reasoning:

> maybe I am misunderstanding. I was looking to do software raid (off of a non-raid
> SCSI controller.)
> The main reason I wanted raid5 was as a failsafe measure since it would appear
> that things can get tricky if a harddrive fails in lvm. Is there another way to
> create a failsafe through lvm without needing to implement software raid?

Sorry, this post wasn't an answer to your problem, it was a comment on
the discussion whether raid should be implemented in LVM or not.

At the moment neither LVM1 nor DM (LVM2) can provide redundancy. But you
can use LVM on top of the software raid5 driver in linux. I don't think
there is another way at the moment.

-- 
Christophe Saout <christophe@saout.de>
