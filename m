Subject: Re: [linux-lvm] Lost partition table, how can I find the start of
	the PV?
From: qv6 <sundiatah1@comcast.net>
In-Reply-To: <1069736195.28598.76.camel@pc>
References: <1069736195.28598.76.camel@pc>
Message-Id: <1069773294.12078.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Nov 25 10:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Mon, 2003-11-24 at 23:56, Brian J. Murrell wrote:
> Yes, in a most stupid error, I trashed my partition table, but I know
 
> 
> I am hoping somebody can suggest a tool/operation to try to recover at
> least enough of a partition table to try to get /dev/hda3 (and hda1 and
> hda2 if possible. bit hda3 is most important) back in order, get the VG
> up and get the data off it.
> 
> Any ideas at all on how to proceed?  Just for reference in versions of
> filesystems, LVM, etc. this was a Debian Woody system.
> 
> b.

How about booting from the installation cd that you used to build the
system. I've done something similar on Gentoo.BTW, what about the rescue
disk that you created or should have created after the install?

Qv6 
