Return-Path: <hch@ns.caldera.de>
Date: Mon, 19 Feb 2001 18:04:56 +0100
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] snapshot of Reiserfs
Message-ID: <20010219180456.A5632@caldera.de>
References: <14993.17840.666402.870140@nv.winux.com> <20010219161226.B1774@66bassett.freeserve.co.uk>
Mime-Version: 1.0
In-Reply-To: <20010219161226.B1774@66bassett.freeserve.co.uk>; from joe@66bassett.freeserve.co.uk on Mon, Feb 19, 2001 at 04:12:26PM +0000
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

On Mon, Feb 19, 2001 at 04:12:26PM +0000, Joe Thornber wrote:
> > Is there a comparable patch for 2.4.1?
> 
> Try the PATCHES/linux-2.4.0-test10-VFS-lock.patch in the latest
> release, it should apply ok.

At least the write_super_lockfs super_operations _is_ already in 2.4.1.

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.
