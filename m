Return-Path: <mason@suse.com>
Date: Mon, 30 Apr 2001 07:43:50 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] Re: [reiserfs-list] mounting reiserfs snapshot
 fails
Message-ID: <713260000.988631030@tiny>
In-Reply-To: <01043000231400.00694@oscar>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com, reiserfs-list@namesys.com


On Monday, April 30, 2001 12:23:14 AM -0400 Ed Tomlinson <tomlins@cam.org>
wrote:

> 
> Chris,
> 
> This is not fixing the problem here.  What else do you need to figure this
> one out?  I did verify that I built from souce with both the fix VFS
> locking the the reiserfs fix applied.  Symptoms remain the same,
> debugreiserfs is  still finding a null block where it expects the sb.
> 

Sigh.  Could you please try 2.4.4aa2 + the two patches I sent?  If that
doesn't do it, I'll send along some debugging patches.

-chris
