From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 migration on 2.4.24 troubles - prepare for 2.6
Message-ID: <20040119171824.S18942@uk.sistina.com>
References: <6154.1074373571@bongo.freakout.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6154.1074373571@bongo.freakout.de>; from lvm@freakout.de on Sat, Jan 17, 2004 at 10:06:11PM +0100
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
Date: Mon Jan 19 12:19:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Jan 17, 2004 at 10:06:11PM +0100, Axel Reinhold wrote:
> Are there incompatibilities regarding snapshots with LVM1/2?

Yes - snapshots are implemented differently: the on-disk data
is different.

Always drop snapshots before switching between LVM1 / LVM2.

Alasdair
-- 
agk@uk.sistina.com
