Return-Path: <andrea@suse.de>
Date: Wed, 15 Aug 2001 22:16:23 +0200
From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com
Message-ID: <20010815221623.C11146@athlon.random>
References: <20010815175659.A29749@sistina.com> <20010815182548.U3941@gum01m.etpnet.phys.tue.nl> <20010815185005.A32239@sistina.com> <20010815190428.A11146@athlon.random> <20010815210622.A1221@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010815210622.A1221@btconnect.com>; from thornber@btconnect.com on Wed, Aug 15, 2001 at 09:06:22PM +0100
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
To: Joe Thornber <thornber@btconnect.com>
Cc: Kurt Garloff <garloff@suse.de>, linux-lvm@sistina.com, lvm-devel@sistina.com, linux-kernel@vger.kernel.org

On Wed, Aug 15, 2001 at 09:06:22PM +0100, Joe Thornber wrote:
> In previous beta releases of LVM the PE position was always being
> calculated, rather than calculated upon PV creation and put in the
> metadata.  I was not aware of this.
> 
> This calculation varied through the beta series, it was based on some
> constants that I changed (eg, SECTOR_SIZE which I changed to support

You can put the algorithm used by beta7 in a separate program and ask
this program where the pe start. Since the beta7 tools knows where the
pe_start (the proof is that I can use lvm in my machines), also this new
program will know where the pe_start.

Andrea
