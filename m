Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104140023.f3E0NSIm014650@webber.adilger.int>
Subject: Re: [linux-lvm] mounting reiserfs snapshot fails
In-Reply-To: <01041313295800.02991@oscar> "from Ed Tomlinson at Apr 13, 2001
 01:29:58 pm"
Date: Fri, 13 Apr 2001 18:23:28 -0600 (MDT)
MIME-Version: 1.0
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
Cc: reiserfs-list@namesys.com

Ed Tomlinson writes:
> Using debian sid, 2.4.3-ac5, lvm 0.91 beta7, with the vfs locking
> patch applied I get:
> 
> oscar# mount /dev/lv/snap /snap -t reiserfs -oro
> mount: wrong fs type, bad option, bad superblock on /dev/lv/snap,
>        or too many mounted file systems
> 
> When trying to mount the snap shot.  It was created with: 
> lvcreate -L 1G -s -n snap /dev/lv/root /dev/hdg1
> without problems

Are you sure that the VFS patch is applied, and that the LVM and
reiserfs code was compiled with "enable VFS patch" (whatever it is
called) enabled?  That has been a source of problems in the past.
The patch was applied, but you also need to enable it for both the
reiserfs and LVM code.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
