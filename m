Date: Fri, 12 Oct 2001 15:44:45 +0200
Subject: Re: [linux-lvm] Lock patch
Message-ID: <20011012154445.A4346@brightstar.swin.de>
References: <20011011184323.A20226@brightstar.swin.de> <1348330000.1002820832@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1348330000.1002820832@tiny>
From: Julian Einwag <julian@brightstar.swin.de>
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

> > Will there be a VFS lock patch for 2.4.12? The patch for 2.4.9 doesn't
> > work with kernels > 2.4.10
> 
> I'd like to clean this up a little so the extra semaphore isn't required,
> but it does work.  There's an extra hunk tacked onto the end that you'll
> need for reiserfs.

Thank you!
