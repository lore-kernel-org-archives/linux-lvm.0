Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Mon, 19 Feb 2001 16:59:48 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] snapshot of Reiserfs
Message-ID: <20010219165947.A2042@66bassett.freeserve.co.uk>
References: <14993.17840.666402.870140@nv.winux.com> <20010219161226.B1774@66bassett.freeserve.co.uk> <20010219180456.A5632@caldera.de>
Mime-Version: 1.0
In-Reply-To: <20010219180456.A5632@caldera.de>; from hch@caldera.de on Mon, Feb 19, 2001 at 06:04:56PM +0100
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

On Mon, Feb 19, 2001 at 06:04:56PM +0100, Christoph Hellwig wrote:
> On Mon, Feb 19, 2001 at 04:12:26PM +0000, Joe Thornber wrote:
> > > Is there a comparable patch for 2.4.1?
> > 
> > Try the PATCHES/linux-2.4.0-test10-VFS-lock.patch in the latest
> > release, it should apply ok.
> 
> At least the write_super_lockfs super_operations _is_ already in 2.4.1.

OK, we'll make a new patch for the next beta release (due out in the
next couple of days).

- Joe
