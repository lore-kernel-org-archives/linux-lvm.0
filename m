Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8ALUFu8008762
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 22:30:15 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GMWsZ-0002TZ-6n
	for linux-lvm@redhat.com; Sun, 10 Sep 2006 22:30:15 +0100
Date: Sun, 10 Sep 2006 22:30:15 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Cannot get rid of root filesystem LVM snapshot
Message-ID: <20060910213014.GD13859@agk.surrey.redhat.com>
References: <b91808310609091349tf363c5dy57ced3b611523c18@mail.gmail.com>
	<20060909231739.GB13859@agk.surrey.redhat.com>
	<b91808310609091653o63dbdb0fi9f34848cb4479a1d@mail.gmail.com>
	<20060910154107.GC13859@agk.surrey.redhat.com>
	<878xkriq0r.fsf@hades.wkstn.nix>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878xkriq0r.fsf@hades.wkstn.nix>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Sep 10, 2006 at 06:35:00PM +0100, Nix wrote:
> I must admit I can't see what's so special about the root filesystem.

The tools you are running may be stored on it and access files on it.
Some operations the tools do temporarily suspend I/O to the LVs involved.
If a tool suspends I/O to the root then does anything that causes an access
to it the system can lock up.  Caches/flushing/scheduling can make this
indeterminate.  Even the filesystem type matters (e.g. timing of journal
transactions e.g. lazy inode time updates).

> The tools work for me: even doing things like pvmoving root filesystems in
> active use works fine. I'd vaguely guess that only snapshot support is
> broken?
 
pvmove also may fail.

Workaround is to copy required components into ramdisk and run from
there.  I have never done a complete audit, but:
  lvm binary (& libraries) should not be on root filesystem [use lvm.static
in ramdisk] 
  /dev must not be part of root filesystem being changed [ramdisk copy]
  log/activation = 0 in lvm.conf (the default)

Depending on the particular command and configuration there may be more
restrictions.  (E.g. some commands may still require config files and lock
files not to be in the root filesystem.)  dmeventd is also unsafe as
currently implemented - one reason it is not enabled by default upstream.

Upstream support entails a full review and changes to deal with as many
problems as possible (regardless of the user's configuration and
compile-time options) and then detecting the remaining problems and issuing
warning messages or refusing to proceed as appropriate.

Alasdair
-- 
agk@redhat.com
