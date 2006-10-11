Date: Wed, 11 Oct 2006 19:17:46 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [RFC] Let udev play with snapshots
Message-ID: <20061011181746.GR17654@agk.surrey.redhat.com>
References: <20061011173421.GC4636@hasse.suse.de>
	<20061011174604.GQ17654@agk.surrey.redhat.com>
	<20061011180857.GE4636@hasse.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061011180857.GE4636@hasse.suse.de>
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
Cc: kay.sievers@vrfy.org

The cow begins life as a real LV.
There is no way to distinguish it from other LVs.

Changing that means changing the "create a snapshot" process into a single
LVM2 metadata transaction (or a pair of related transactions).  Currently it's
two independent transactions - creating a new, empty LV; creating a snapshot
using that LV.  Doing that would allow us to back out the change properly if
it's aborted too.

Alasdair
-- 
agk@redhat.com
