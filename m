Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j14E65S9032413
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2005 14:06:05 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Cx461-0008HG-RK
	for linux-lvm@redhat.com; Fri, 04 Feb 2005 14:06:05 +0000
Date: Fri, 4 Feb 2005 14:06:05 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Removing faulty disk from LVM2
Message-ID: <20050204140605.GB14093@agk.surrey.redhat.com>
References: <1107510555.14978.30.camel@sauron.int.tixit.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1107510555.14978.30.camel@sauron.int.tixit.se>
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

On Fri, Feb 04, 2005 at 10:49:15AM +0100, Magnus Nilsson wrote:
> Through pvmove'ing parts of the PV I've narrowed it down to PE #14858 of
> 38154 4MB PE's. 

> Is there any way of just skipping that last PE and let me repair the
> filesystem afterwards? Perhaps by vgcfgrestore'ing an edited backup,
> excluding the broken PV?


Firstly, pvmove --abort abandons a pvmove cleanly.

Two ideas:
  Use dmsetup directly to hide the problematic PE.
e.g. dmsetup table vg1-lvol1 to display the table,
  Work out which sector(s) are the problem and replace them with
  an 'error' line


  Edit a (current) VG backup file to 'move' 1 extent elsewhere.
e.g. 1 segment containing the problematic extent turns into 3 segments

Alasdair
-- 
agk@redhat.com
