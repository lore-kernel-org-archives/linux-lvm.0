Return-Path: <cjs2895@hotmail.com>
From: "cjs 2895" <cjs2895@hotmail.com>
Date: Fri, 06 Apr 2001 11:00:08 -0400
Mime-Version: 1.0
Message-ID: <F3YA5kcDj6QqW9F0qnq000014e8@hotmail.com>
Subject: [linux-lvm] Help! vgchange -> invalid argument
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Howdy folks!

I am about one step away from setting up a new system with LVM!
There is just one thing keeping me back. When I try to activate
the volume group I've created -- vgchange does this for sure, I
get an error "Invalid Argument". According to all the debug
output I'm passing all of my checks, its the last point where
the volume group is brought online that this dies. I think this
is a known problem with a known fix, but I can't find a patch
in the mailing list. Could someone post it here or to me
in e-mail?

My kernel is stock 2.4.3.
My tools are stock 0.9.1-Beta6
Everything else is whats in stock Debian 2.2 -- I can look up
  versions of specific things if need be.

Thanks,
Christopher

_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com
