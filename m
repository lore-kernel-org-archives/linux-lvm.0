From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Re: Here we go again: vgscan doesn't see my volume groups.
Message-ID: <20011126110142.G730@lynx.no>
References: <20011126172715.1498.qmail@web12301.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011126172715.1498.qmail@web12301.mail.yahoo.com>; from thelars@yahoo.com on Mon, Nov 26, 2001 at 09:27:15AM -0800
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
Date: Mon Nov 26 12:00:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Kellogg-Stedman <thelars@yahoo.com>
Cc: linux-lvm@sistina.com

On Nov 26, 2001  09:27 -0800, Lars Kellogg-Stedman wrote:
> I've upgraded the userspace tools to today's CVS code.  There's not
> much I can do with the kernel until *after* I'm able to access the
> volume group again.
> 
> There doesn't appear to be any chance in behavior with the updated
> tools.
> 
> Is there any way for me to determine *why* the lvm tools won't assemble
> this volume group?  Vgscan isn't giving me any errors, and the debug
> output, while copious, doesn't really help me much.

Post it to the lvm-devel list, or put it on a web page.  Those "skilled
in the art of throwing away the tons of crap that LVM debugging output
prints" should be able to see why it isn't recognizing your VG.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
