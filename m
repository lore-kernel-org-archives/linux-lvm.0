Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i4OIfLtl016911
	for <linux-lvm@redhat.com>; Mon, 24 May 2004 19:41:21 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BSKO1-0003W8-4N
	for linux-lvm@redhat.com; Mon, 24 May 2004 19:41:21 +0100
Date: Mon, 24 May 2004 19:41:21 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM on a drive with a bad sector?
Message-ID: <20040524184121.GI19299@agk.surrey.redhat.com>
References: <40B1B898.2050204@mlug.missouri.edu> <40B23F7D.6040207@shoenix.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40B23F7D.6040207@shoenix.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, May 24, 2004 at 08:31:25PM +0200, Martijn Schoemaker wrote:
> (as far as I know there is no
> bad-block mapping within LVM, correct me if I'm wrong)

The closest in LVM2 would be to put the bad sectors inside a single
LV and avoid using that LV.

e.g.  lvcreate -l1 vg -n broken /dev/sda5:46
if the bad sector falls inside physical extent 46 on /dev/sda5.

Alasdair
-- 
agk@redhat.com
