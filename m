Return-Path: <sct@devserv.devel.redhat.com>
Date: Wed, 23 May 2001 10:34:32 +0100
From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: How about ext3? (was RE: [linux-lvm] XFS and LVM)
Message-ID: <20010523103432.D27177@redhat.com>
References: <20010523083432.3601F15CB5@mail.linux-new-media.de> <NBBBKLKHMJHIJLHOGAOJAEMPIOAA.steve.wray@the.net.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJAEMPIOAA.steve.wray@the.net.nz>; from steve.wray@the.net.nz on Wed, May 23, 2001 at 08:35:36PM +1200
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
Cc: Stephen Tweedie <sct@redhat.com>, Steve Wray <steve.wray@the.net.nz>

Hi,

On Wed, May 23, 2001 at 08:35:36PM +1200, Steve Wray wrote:
> Any experience with ext3?
> Is it shrinkable?

It is format-compatible with ext2, so offline e2resize should work
happily on ext3 for both shrinking and growing.  Online, only growing
has been implemented (but not all of the kernel support is
integrated).

I haven't tried doing a resize on ext3 so we might have to teach the
e2resize tools not to worry if they see the HAS_JOURNAL flag set in
the superblock, but there is nothing in the format itself to prevent
it from working.

Cheers,
 Stephen
