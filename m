From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030818185719.C29420@uk.sistina.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817114638.GA1839@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030817114638.GA1839@gondor.com>; from list039@gondor.com on Sun, Aug 17, 2003 at 01:46:38PM +0200
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
Date: Mon Aug 18 12:58:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <list039@gondor.com>
Cc: linux-lvm@sistina.com

On Sun, Aug 17, 2003 at 01:46:38PM +0200, Jan Niehusmann wrote:
> pvmove --abort really hangs... 

Puzzling.  But we can think of some explanations that could tie this in
with the 383/384 problem.

> The difference is that the first pvmove just doesn't show any progress,
> but can be stopped with ctrl-c. 

> pvmove --abort doesn't return, isn't
> killable, and after issuing it, every attempt to access a filesystem on
> lvm also blocks.

I'd like to see the debug log file/strace for that pvmove --abort and
the full ps output for the process (incl decoded wchan and process state,
nice value, resident memory size & whether its CPU time is static or
increasing) - before and after issuing the 'kill -9' that doesn't work.

We're probably going to need to start sending you patches to instrument
the kernel if we are to work out what's going on here [unless you happen
to have the machine set up for kgdb].

Also, careful use of 'dmsetup' should let us deduce some internal state.

Do you use irc or IM - might speed things up if so?

Alasdair
