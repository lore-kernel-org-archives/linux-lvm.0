From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030817164028.GA1766@gondor.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817161022.GA2902@gondor.com> <20030817173326.C25758@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030817173326.C25758@uk.sistina.com>
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
Date: Sun Aug 17 11:41:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Aug 17, 2003 at 05:33:26PM +0100, Alasdair G Kergon wrote:
> The log file might show whether that theory is correct or not.

I sent it to the list a few hours ago, but it seems like it didn't go
through. Perhaps it exceeded some size limitation?

However, now I put the files on http://gondor.com/lvm/
They do contain the following:

lvm2.log	debug log of pvmove, vgcfgbackup (to save the new
		config) and pvmove --abort
lvm.conf	obvious
config-old	config before pvmove
config-new	config after pvmove
ps		output of ps while (first) pvmove is running

I checked the off-by-one theory, by filling up most of the target PV
with a dummy partition and moving a single LV which exactly fits in to
the remaining extents. The pvmove succeeded, so this probably wasn't the
cause.

Jan
