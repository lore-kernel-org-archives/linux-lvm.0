From: Nathan Hunsperger <linux-lvm@hunsperger.com>
Message-ID: <20030716230227.GB23833@munchnet.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] System lockups when snapshoting
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
Date: Wed Jul 16 18:03:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm experiencing severe issues when creating snapshots, and would
appreciate some advice.  These problems are occuring on 2.4.21 with LVM
1.0.7.  Without snapshots, I am not experiencing any problems.

After creating a snapshot of a live filesystem, my system starts to
hang.  This hanging takes two forms, temporary lockups, and permanent
lockups.  Sometimes, commands take 5+ minutes to execute after they are
typed, but more usually, they still fail to execute after 12 hours.

However, it seems that only commands which hit up the filesystem layer
are affected.  The system is always pingable, characters on console
always echo, and ssh connections stay responsive, until a request for
the fs is made.  Shell built-ins like "echo hello" succeed, however,
"echo /*" hangs.  / (which is not on lvm) should always be cached, so
nothing below the fs layer should need to be touched to list echo /*.
Lastly, I will receive a "raid 5 sync complete" message on console for
the md lvm is ontop of, an hour after I cannot issue any more fs-using
commands, so the block device the lvm volume group is on should be fine.

Based on this, it looks to me like there may be a race / deadlock in the
filesystem layer when a snapshot is active.  Or I am doing something
considerably wrong.

I experience these issues when using ext3 or ext2, SMP or uni-processor,
GCC 2.95.4 or GCC 3.3.  I've tried ext2 with and without the VFS patches
(always applied when testing ext3).  In applying the VFS and lvm patches, I
always apply the lvm patch, and then the VFS patch.

Also, when these temporary lockups occur, all my shells waiting to use the
fs execute at about the same time, and then lockup together.  If I am able
to issue a lvremove for the snapshot, the entire system comes back alive.

Thanks,
Nathan
