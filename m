Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103080552.f285qaV21678@webber.adilger.net>
Subject: Re: [linux-lvm] EXT2-fs panic (device lvm(58,0)):
In-Reply-To: <3AA6A289.B8EF010D@mbsmm.com> from Bill Clark at "Mar 7, 2001 04:05:13
 pm"
Date: Wed, 7 Mar 2001 22:52:36 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Bill Clark writes:
> I also tried the patch and it didn't panic this time, the machine just
> re-booted  :(  I was trying to cp the file and it aborted with:
> 
> cp: win2000.dsk: Input/output error

Any error messages in /var/log/messages?

> > Also, the output from debugfs "stat <inode_number>" would help as well.
> 
> Im not as familiar with this.  I am assuming I should try an inode of
> the file I am trying to copy, which I will try next.

Yes, you can use "ls -i win2000.dsk" to get the inode number for debugfs.

> Filesystem state:         not clean with errors

This means that there is something wrong with the filesystem (could be a
result of the above IO error.  Should be something in one of the logs.
You will also need to run e2fsck to clear it up.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
