Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3B0A90FD.A08EDE7F@in.tum.de>
Date: Tue, 22 May 2001 18:17:01 +0200
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
References: <3B0A8441.5CEE6BF6@in.tum.de> <20010522162623.A1445@66bassett.freeserve.co.uk>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Makefile
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
To: Joe Thornber <thornber@btconnect.com>, lvm <linux-lvm@sistina.com>

Joe Thornber wrote:

> Try adding these lines to the end of PATCHES/fragments-2.4.0 and
> regenerating the patch.
>
> fragments/add_lvm_fs_2.4.patch
> fragments/remove_lvm_snap_h_2.4.patch
> fragments/register_ioctl_2.4.patch
>
> - Joe

Yes, it worked... Thanks for the lines above. Now, why aren't they added to the CVS version?
--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod <at> in DOT tum DOT de)
