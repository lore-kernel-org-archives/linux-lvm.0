From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030818225358.GA1712@gondor.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817114638.GA1839@gondor.com> <20030818185719.C29420@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030818185719.C29420@uk.sistina.com>
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
Date: Mon Aug 18 17:55:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 18, 2003 at 06:57:19PM +0100, Alasdair G Kergon wrote:
> I'd like to see the debug log file/strace for that pvmove --abort and
> the full ps output for the process (incl decoded wchan and process state,
> nice value, resident memory size & whether its CPU time is static or
> increasing) - before and after issuing the 'kill -9' that doesn't work.

The ps simply says 

F   UID   PID  PPID PRI  NI   VSZ  RSS WCHAN  STAT TTY        TIME COMMAND

4     0 24006  1180   1 -18 14140 14140 down  D<L  tty1       0:00 pvmove --abort

(or numeric:)
4     0 24006  1180   1 -18 14140 14140 105b14 D<L tty1       0:00 pvmove --abort

This doesn't change with kill -9, all stays exactly the same. 
I do not yet have a logfile of pvmove --abort.

But http://gondor.com/lvm/lvm2.log.20030818  does contain the complete
logfile of pvmove -v /dev/hda4.

I'm going to sleep now. Lets do further debugging tomorrow (Tuesday), if
that's ok for you.

Jan
