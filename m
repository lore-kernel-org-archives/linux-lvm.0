From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030816195606.B25758@uk.sistina.com>
References: <20030816102005.GA12916@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030816102005.GA12916@gondor.com>; from list039@gondor.com on Sat, Aug 16, 2003 at 12:20:06PM +0200
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
Date: Sat Aug 16 13:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <list039@gondor.com>
Cc: linux-lvm@sistina.com

On Sat, Aug 16, 2003 at 12:20:06PM +0200, Jan Niehusmann wrote:
> On my computer, pvmove just hangs at 0.2% done. 

  If pvmove fails, you can use 'pvmove --abort' to abandon it
  or 'pvmove' on its own [or with same source pv as before] to
  retry.  xxchange -ay may also attempt to restart pvmoves in
  progress (leaving a pvmove daemon running).

> But then I booted to singe user mode and didn't mount any partitions on
> lvm, and still, pvmove was hanging at 0.2%.

Need more precise description of what you mean by 'hanging'.

And the usual diagnostics:  debug log file from the command that should
have set the pvmove running, any kernel error messages, lvm.conf, a copy 
of the current VG's metadata [e.g. with vgcfgbackup -f] etc.
If pvmove process itself freezes, then a long/wide 'ps' output for that
process, kcopyd & kmirrord (incl cols: NI, VSZ, RSS, STAT 
and symbolic WCHAN).
 
Alasdair
-- 
agk@uk.sistina.com
