Return-Path: <thornber@btconnect.com>
Date: Wed, 16 May 2001 09:39:29 +0100
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
Message-ID: <20010516093929.B482@66bassett.freeserve.co.uk>
References: <200105160032.f4G0WPIP022333@webber.adilger.int> <28230000.989975826@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28230000.989975826@tiny>; from mason@suse.com on Tue, May 15, 2001 at 09:17:06PM -0400
From: Joe Thornber <thornber@btconnect.com>
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

On Tue, May 15, 2001 at 09:17:06PM -0400, Chris Mason wrote:
> You're right though, pv_flush certainly doesn't look like it could cause
> any deadlocks.

I must admit I'm struggling to understand why PV_FLUSH even exists.
It does *exactly* the same thing as a BLKFLSBUF ioctl to the pv device
itself.  As such I agree that it's unlikely to be the culprit.

- Joe
