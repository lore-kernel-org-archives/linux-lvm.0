From: bscott@ntisys.com
Subject: Re: [linux-lvm] Problem compiling LVM 1.0.5
In-Reply-To: <1611908674.20020731133430@postel.sk>
Message-ID: <Pine.LNX.4.44.0207311140520.29658-100000@dragon.inside.ntisys.com>
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
Date: Wed Jul 31 10:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <linux-lvm@sistina.com>

On Wed, 31 Jul 2002, at 1:34pm, Martin Mosny, PosTel a.s. wrote:
> in the new RH, glibc-devel and the INCLUDE policy/tactics is to DO NOT
> INCLUDE kernel header files to user space program.

  Linus has been trying to get people to do this for years.

  Basically, the Linus policy is that userland programs should *NEVER*
directly include kernel headers.  That includes the C library itself.  
Kernel headers are decreed to be Not For Userland Consumption.  The kernel
provides a binary interface.  If you want to use said binary interface, you
are supposed to write your own headers, either from scratch, or via
cut-and-paste from the kernel headers.

  Whether or not this is the Right Thing to do is immaterial; this is what
the kernel hackers expect you to do.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
