Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Thu, 4 Jan 2001 09:45:21 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] kernel oops when trying to extend volume group
Message-ID: <20010104094521.B386@66bassett.freeserve.co.uk>
References: <20010103195320.19864.qmail@nw174.netaddress.usa.net>
Mime-Version: 1.0
In-Reply-To: <20010103195320.19864.qmail@nw174.netaddress.usa.net>; from bcorsello@usa.net on Wed, Jan 03, 2001 at 02:53:20PM -0500
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

On Wed, Jan 03, 2001 at 02:53:20PM -0500, Brad Corsello wrote:
> Does anyone know if this problem is going to be fixed when final version 2.4
> is released?  I'm now using one of the late test13 kernels, which supposedly
> contains an update to LVM, but it vgextend is still broken.

The fixes for this and other major bugs are in cvs, it's just a matter
of them propogating towards the kernel.  We will be releasing a new
tarball soon, or if you're impatient you can get the LVM_0-9-patches
branch from cvs (which I can guarantee is better than the 0.9 tarball
:)

- Joe
