Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105171531.f4HFV6Bc023180@webber.adilger.int>
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
In-Reply-To: <3B0336BC.B8BC97D4@home.com> "from Tom Otake at May 16, 2001 09:26:04
 pm"
Date: Thu, 17 May 2001 09:31:05 -0600 (MDT)
MIME-Version: 1.0
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

Tom Otake writes:
> I've recreated the system hang exactly as I've described below with a pvscan
> during a copy.  I used a new kernel with hacking enabled, redirected 1 into
> /proc/sys/kernel/sysrq.  None of the sysrq commands seemed to have worked.
> The system hung about 20 to 30 seconds into the copy process.

Try using the kdb patches (available at Sourceforge).  They will allow you
to interrupt the kernel anywhere and to a stack trace (via "bt" command)
to find out where you are stuck.  The SysRQ key does not work if you are
in a tight loop somewhere.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
