Date: Sat, 29 Jan 2000 12:26:14 -0800
From: Tracy R Reed <treed@ultraviolet.org>
Subject: Re: [linux-lvm] Re: (reiserfs) Re: AIX JFS dual-mount
Message-ID: <20000129122614.C13523@ultraviolet.org>
References: <Pine.LNX.4.10.10001280539550.13561-100000@home.suse.com> <20000129001449.A13523@ultraviolet.org> <20000129095403.A24375@lenin.nu>
Mime-Version: 1.0
In-Reply-To: <20000129095403.A24375@lenin.nu>; from spacey@lenin.nu on Sat, Jan 29, 2000 at 09:54:03AM -0800
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Peter C. Norton" <spacey@lenin.nu>
Cc: linux-lvm@msede.com

On Sat, Jan 29, 2000 at 09:54:03AM -0800, Peter C. Norton wrote:
> GFS seems to require some support from hardware in the way of "dlocks", a
> not-too widely supported standard.  I think you'd need to have drives that
> implement dlocks, and that the lvm would have to know about them.  What
> would need to be done to the volume stuff to support dlocks?  Could any
> filesystem be built on top of a volume manager with dlock support?

There are two options: You can use dlocks with special drive firmware or you
can use a global lock manager over TCP with one of the hosts running the lock
manager. I was thinking the latter way might be possible for non-fibrechannel
setups.

--
Tracy Reed      http://www.ultraviolet.org
"She moves in mysterious ways"
