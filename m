From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Recovering from disk failure
Message-ID: <20030828132053.C14441@uk.sistina.com>
References: <yw1xwucyty8b.fsf@users.sourceforge.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yw1xwucyty8b.fsf@users.sourceforge.net>; from mru@users.sourceforge.net on Thu, Aug 28, 2003 at 02:36:04AM +0200
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
Date: Thu Aug 28 07:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 28, 2003 at 02:36:04AM +0200, M?ns Rullg?rd wrote:
> Recently one of two disks in a volume group crashed, and I can't read
> it at all.  Now, some LVs are entirely on the disk that survived.  Is
> there any way I can just disable the broken LVs and continue using the
> complete ones?  I'm using device-mapper and LVM2

Read the description of '--partial' on the lvm(8) man page.
e.g. (lv|vg)change -ay --partial

And '--removemissing' in vgreduce(8) to *permanently* destroy
the lost LVs (run with --test first to check what it will do).

Alasdair
-- 
agk@uk.sistina.com
