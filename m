From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 27 Sep 2001 09:55:16 -0600
Subject: Re: [linux-lvm] Disk Died - Ideas?
Message-ID: <20010927095516.C19527@turbolinux.com>
References: <3BB09C88.8234FDE4@lmco.com> <20010925110909.D392@turbolinux.com> <3BB30FD9.853E39DA@lmco.com> <53040000.1001601637@dizzy>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53040000.1001601637@dizzy>
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

On Sep 27, 2001  09:40 -0500, Steven Lembark wrote:
> <broken record>
> 
> boot once.
> 
> vgexport /dev/vgwhatever;
> vgimport /dev/vgwhatever <list of drives that didn't croak>
> 
> you will now have your VG back on line with whatever portion of the
> data is no the clean drives.  any LV's spanning the dead drive are
> likely to be lost anyway.  It'll take you less time to vgextend the
> imported group onto a new, working drive an recover backups onto
> new LV's than almost anything else you can try.
> 
> </broken record>

bzzzt.  This _may_ work on HPUX and AIX, but I _highly_ doubt it will
work with Linux LVM.  The Linux LVM code requires that all of the disks
be present, and that they all have the correct data (no metadata backups
yet).  You could hack the vgscan code so that it doesn't require this,
but it would probably end up causing grief somewhere else before you
could actually read from the LV.

AFAIK, not even HPUX or AIX would allow you to read from a partial LV
(which is the situation we are discussing here), so it wouldn't help.
What _would_ be very useful is a tool that reads the LVM metadata
directly, creates a list of available LEs (in order) and dumps them
to a file, writing zeros for LEs that are not available (and writing
large warnings for each missing LE).

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
