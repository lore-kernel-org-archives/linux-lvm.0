Return-Path: <lembark@wrkhors.com>
Message-ID: <3B1FF038.41D7D184@wrkhors.com>
Date: Thu, 07 Jun 2001 16:20:56 -0500
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
References: <20010605210727.C1870@pc.ilinx> <3B1F9E1C.1984FAF8@wrkhors.com> <20010607104301.A29848@stocks.pillory.com> <20010607182636.H3232@jensbenecke.de>
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

> > > Use separate mount points for /var, /usr & /home.  This keeps root down
> > > to mainly /etc, /dev, /bin, /sbin and /lib -- none of which is all that
> > > enormous.  Short of writing the File From Hell to /tmp a 128MB root
> > > file system works well enough for me.  I do put /usr & /opt on LVM but
> > > only because all the tools needed to revive the system are in /bin,
> > > /sbin & /lvm on the root.
> >     After installation, do:
> > cd / ; mv tmp tmp.old ; ln -s /var/tmp .  reboot rm -rf /tmp.old
> >     Now you don't have to worry about root filling up at all...
> 
> er... I wouldn't do that (at least not on a Debian system).
> 
> Usually /var/tmp is _assumed_ to be only root-writeable, so all sorts of
> daemons and programs running as root put their stuff there. This could open
> a number of security holes, when /var/tmp doesn't get treated as carefully
> as /tmp.

then debian butchered the SVR4 file system layout.  whole idea 
of having /boot and /var was to make sure that diskless systems
that nfs-ed everything else could count on having local storage
in /var and a minimal amount of anything required in /boot.

just about everything else on the planet assumes that /var/tmp
is a replacement for /tmp and should 01777...

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
