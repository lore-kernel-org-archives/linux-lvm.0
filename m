Return-Path: <lembark@wrkhors.com>
Message-ID: <3B1F9E1C.1984FAF8@wrkhors.com>
Date: Thu, 07 Jun 2001 10:30:36 -0500
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
References: <20010605210727.C1870@pc.ilinx>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

> Not only cool but sometimes necessary.  Sometimes root rides so close
> to full that you cannot upgrade.  Then you start doing the "diskspace
> shuffle" to get something you can upgrade.
> 
> Without wasting a ton of space when you initially install a system,
> every system's root partition will hit the wall sooner or later.  That
> is the unfortunate side effect of software evolution.

Use separate mount points for /var, /usr & /home.  This keeps
root down to mainly /etc, /dev, /bin, /sbin and /lib -- none of 
which is all that enormous.  Short of writing the File From Hell
to /tmp a 128MB root file system works well enough for me.  I do
put /usr & /opt on LVM but only because all the tools needed to
revive the system are in /bin, /sbin & /lvm on the root.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
