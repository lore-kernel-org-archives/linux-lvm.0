Date: Fri, 12 Oct 2001 08:33:31 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Lock patch
Message-ID: <20011012083330.B971@tykepenguin.com>
References: <20011011184323.A20226@brightstar.swin.de> <1348330000.1002820832@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1348330000.1002820832@tiny>; from mason@suse.com on Thu, Oct 11, 2001 at 01:20:32PM -0400
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

On Thu, Oct 11, 2001 at 01:20:32PM -0400, Chris Mason wrote:
> 
> 
> On Thursday, October 11, 2001 06:43:23 PM +0200  wrote:
> 
> > Hi!
> > 
> > Will there be a VFS lock patch for 2.4.12? The patch for 2.4.9 doesn't
> > work with kernels > 2.4.10
> 
> I'd like to clean this up a little so the extra semaphore isn't required,
> but it does work.  There's an extra hunk tacked onto the end that you'll
> need for reiserfs.
> 

I'll put this into the LVM CVS so we have a copy available. If you do any
changes then post it again and I'll update it.

patrick
