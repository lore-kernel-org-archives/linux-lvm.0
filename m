Return-Path: <mason@suse.com>
Date: Thu, 22 Mar 2001 15:10:55 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] [catch22] lvm vs reiserfs
Message-ID: <416700000.985291855@tiny>
In-Reply-To: <01032214463100.00819@oscar>
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


On Thursday, March 22, 2001 02:46:31 PM -0500 Ed Tomlinson
<tomlins@cam.org> wrote:

> Hi,
> 
> I decided to really try out some of the features built into 2.4.  Using a 
> 2.4.2-ac20 kernel I my root on /dev/lv/root as a reiserfs filesystem.  So
> far so good.  Now I want to back it up.  So I created a snapshot with
> lvcreate -L 50 -s -n snap /dev/lv/root.  This works too.  Problem happens
> when I want to mount /dev/lv/snap to back it up logically.  At this point
> reiserfs wants to replay its journal....  Of course it cannot
> (snapshot=ro).
> 
> How can this be resolved?  Is there a way to sync root just after the lvm
> data gets updated in /etc but before the snapshot starts?  How else might
> this be fixed (is it fixed already somewhere)?

Go to ftp.sistina.com, and grab 0.9.1_beta6.  Apply
linux-2.4.2-VFS-lock.patch that is included in PATCHES directory after
untarring.  This provides the rest of the lockfs API I coded with the LVM
guys.

-chris
