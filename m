Return-Path: <mason@suse.com>
Date: Fri, 13 Apr 2001 15:36:32 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] mounting reiserfs snapshot fails
Message-ID: <363990000.987194192@tiny>
In-Reply-To: <01041313295800.02991@oscar>
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


On Friday, April 13, 2001 01:29:58 PM -0400 Ed Tomlinson <tomlins@cam.org>
wrote:

> Hi,
> 
> Using debian sid, 2.4.3-ac5, lvm 0.91 beta7, with the vfs locking
> patch applied I get:
> 
> oscar# mount /dev/lv/snap /snap -t reiserfs -oro
> mount: wrong fs type, bad option, bad superblock on /dev/lv/snap,
>        or too many mounted file systems

BTW, you can drop the -o ro, LVM sets the snapshot device readonly, so VFS
forces a readonly mount for you.

> 
> When trying to mount the snap shot.  It was created with: 
> lvcreate -L 1G -s -n snap /dev/lv/root /dev/hdg1
> without problems

I doubt it, but was /dev/lv/root a freshly created reiserfs disk?

What does dumpreiserfs tell you about /dev/lv/snap and /dev/lv/root tell
you?

-chris
