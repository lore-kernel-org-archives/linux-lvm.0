Return-Path: <sct@devserv.devel.redhat.com>
Date: Sat, 20 Jan 2001 15:42:43 +0000
From: Stephen Tweedie <sct@redhat.com>
Subject: Re: [linux-lvm] Kernel panic while snapshotting.
Message-ID: <20010120154243.F2656@redhat.com>
References: <20010119163758.B1874@66bassett.freeserve.co.uk> <Pine.LNX.4.30.0101190915110.28951-100000@beefcake.hdqt.valinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0101190915110.28951-100000@beefcake.hdqt.valinux.com>; from jweber@valinux.com on Fri, Jan 19, 2001 at 09:22:55AM -0800
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

Hi,

On Fri, Jan 19, 2001 at 09:22:55AM -0800, Jay Weber wrote:
> Are the LockPage() calls necessary? 

They are if you are doing kiobuf IO on user virtual addresses, because
the 2.2 VM has no other way to synchronise the IO with the dirty flags
on the page.  For non-user-VA pages, it shouldn't matter.

2.4 does not lock pages in kiobufs at all.

--Stephen
