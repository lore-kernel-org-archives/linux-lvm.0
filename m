Return-Path: <thornber@btconnect.com>
Date: Wed, 18 Jul 2001 09:22:01 +0100
Subject: Re: [linux-lvm] HUGE LVM log file...
Message-ID: <20010718092201.C382@btconnect.com>
References: <85063BBE668FD411944400D0B744267A643448@AUSMAIL>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85063BBE668FD411944400D0B744267A643448@AUSMAIL>; from austin@coremetrics.com on Tue, Jul 17, 2001 at 04:52:21PM -0500
From: Joe Thornber <thornber@btconnect.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jul 17, 2001 at 04:52:21PM -0500, Gonyou, Austin wrote:
> Is there a how-to or cookbook type doc which tells how/why you should setup
> your LE/PE's? Outter tracks/inner tracks, speed areas, etc?
> Theory around this is a good thing with relation to LVM and using it. Any
> ideas on that?

We've not had much feedback on this, I guess that people don't really
notice much of a difference, I certainly haven't.  The allocation
policy for PE's is to start at the beginning of the disk (which tend
to have faster data transfer rates) and work back.  Anybody done any
benchmarking in this area ?

- Joe
