Subject: Re: [linux-lvm] pvmove root filesystem?
Message-ID: <20011102003346.Q21136@pc.ilinx>
References: <20011101233119.P21136@pc.ilinx> <20011101221529.W16554@lynx.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011101221529.W16554@lynx.no>
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
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
Date: Thu Nov  1 23:32:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 01, 2001 at 10:15:29PM -0700, Andreas Dilger wrote:
> 
> Brian, the "pvmove" mechanism is not yet 100% safe for mounted filesystems.

Ugh.  I was hoping to not hear something like this.  Has it gotten any
better recently?  What I mean is my LVM identifies itself as:

LVM version LVM 0.9.1_beta7(ish)  by Heinz Mauelshagen  (20 June 2001)
lvm -- Module successfully initialized

which I believe is straight out of 2.4.8-ac12 (my kernel is a
2.4.8-ac12 base from Mandrake and I don't believe they do any LVM
patching -- they use what is in the AC kernels).

Am I going to run into even more problems with this verion of LVM vs.
the latest or has the "live" pvmove stuff not changed much between the
version I am running and current.

> If there is little/no activity on the filesystem while it is being moved,
> you are probably OK.

Not a good sign for root and /var, especially when /var has my mail
spool on it.

> There may be a problem with the ext3 journal, it is
> hard to say (there was a report on the ext3 mailing list, but I never got
> enough details to sort it out.

Hrm.  I am running ext3 on my filesystems as well.

> What I would suggest (for the good of all people reading) is you do this:
> 1) Make a backup of everything (obviously).

I always^Walmost always have a good backup -- daily incremental using
Amanda actually.

> 2) Give it a try.
> 3) Tell us how it worked.  Ensure you run a full (forced) e2fsck on
>    everything, preferrably after a reboot (I think if you create the
>    file /forcedfsck or so, check your rc.sysinit or equivalent) it
>    will do this at boot time.

I just don't want this to turn into a "restore my system from tape"
type of operation, especially if the system is operating (i.e.
processing mail, etc.) while it all goes down the sh*tter.  Maybe I
will contemplate it based on your thoughts of how much worse the
operation could be based on my version of LVM installed.

> It is critical that you have a full backup, as I say people have had
> problems, and there are known "holes" in the pvmove locking.

Of course.

Thanx Andreas,
b.

-- 
Brian J. Murrell
