Return-Path: <thornber@btconnect.com>
Date: Thu, 26 Jul 2001 10:46:50 +0100
Subject: Re: [linux-lvm] Upgrade to 0.9.1b8 went ok but....
Message-ID: <20010726104650.D490@btconnect.com>
References: <85063BBE668FD411944400D0B744267A643517@AUSMAIL>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85063BBE668FD411944400D0B744267A643517@AUSMAIL>; from austin@coremetrics.com on Wed, Jul 25, 2001 at 04:57:06PM -0500
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

On Wed, Jul 25, 2001 at 04:57:06PM -0500, Gonyou, Austin wrote:
> The Devices won't mount for some reason. Here is the ouput I get from trying
> to mount an XFS LVM Volume:

<snip>

looks like it's got the positions of the PE's wrong.  Can you
pvdisplay -v a couple of your pv's and note down the position of the
first PE's.  Then I suggest you move back to beta7 using pvversion -1,
and check you can mount XFS there.  If you can, do a pvversion -v
again and see if the PE positions are the same.  Either mail your
results to the list (not *all* the pvversion output, just the first
PE's), or try and find AJ or I on irc.openprojects.net #lvm.

- Joe
