From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] removing a failed disk from VG
Message-ID: <20030128125219.A12578@uk.sistina.com>
References: <E18dFrq-00042Q-00@adroit.an-dns.com> <20030128114724.A17531@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030128114724.A17531@sistina.com>; from mauelshagen@sistina.com on Tue, Jan 28, 2003 at 11:47:24AM +0100
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
Date: Tue Jan 28 06:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 28, 2003 at 11:47:24AM +0100, Heinz J . Mauelshagen wrote:
> b. you implement LVM2/device-mapper and run "vgscan ; vgchange -P -ay", which
>    will activate your VG without the missing drive. This solution enables
>    you to retrieve the data still accessable _but_ won't let you change
>    your volume group configuration. We are working on an enhancement supporting
>    such changes.

So far, 'vgreduce --removemissing' is in CVS; this removes everything
necessary to make a VG consistent again after losing disk(s).
If *any* part of an LV is missing, the *entire* LV gets deleted, so
you should ensure you've made a copy of anything you want to retain
first.  Running first with '--test' shows you which LVs would get
deleted.

Alternatively, if you have replacement disk(s), you can use pvcreate &
vgcfgrestore to put it into the VG in place of the one(s) lost.

Or if you want to do anything differently, you can edit the metadata
in text form and use vgcfgrestore to effect your changes.

Alasdair
-- 
agk@uk.sistina.com
