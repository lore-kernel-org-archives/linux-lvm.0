From: Kevin Corry <corryk@us.ibm.com>
Subject: Re: [linux-lvm] Disk Died - Ideas?
Date: Thu, 27 Sep 2001 10:32:44 -0500
References: <3BB09C88.8234FDE4@lmco.com> <53040000.1001601637@dizzy> <20010927095516.C19527@turbolinux.com>
In-Reply-To: <20010927095516.C19527@turbolinux.com>
MIME-Version: 1.0
Message-Id: <01092710324404.08721@boiler>
Content-Transfer-Encoding: 8bit
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

> > <broken record>
> >
> > boot once.
> >
> > vgexport /dev/vgwhatever;
> > vgimport /dev/vgwhatever <list of drives that didn't croak>
> >
> > you will now have your VG back on line with whatever portion of the
> > data is no the clean drives.  any LV's spanning the dead drive are
> > likely to be lost anyway.  It'll take you less time to vgextend the
> > imported group onto a new, working drive an recover backups onto
> > new LV's than almost anything else you can try.
> >
> > </broken record>
>
> bzzzt.  This _may_ work on HPUX and AIX, but I _highly_ doubt it will
> work with Linux LVM.  The Linux LVM code requires that all of the disks
> be present, and that they all have the correct data (no metadata backups
> yet).  You could hack the vgscan code so that it doesn't require this,
> but it would probably end up causing grief somewhere else before you
> could actually read from the LV.

I'd agree with Andreas. I have tested this situation, and the 
vgexport/vgimport method isn't always guaranteed to work. If you have run 
vgscan at any point after a PV is lost, the VG will no longer be recognized, 
and you can't run vgexport anymore. It just complains and tells you to run 
vgscan again.

> AFAIK, not even HPUX or AIX would allow you to read from a partial LV
> (which is the situation we are discussing here), so it wouldn't help.
> What _would_ be very useful is a tool that reads the LVM metadata
> directly, creates a list of available LEs (in order) and dumps them
> to a file, writing zeros for LEs that are not available (and writing
> large warnings for each missing LE).

EVMS already does this. It is perfectly happy recognizing partial volume 
groups, and exports any complete volumes it finds in such a group. Any 
incomplete volume in the group (one that had data on the lost disk) will be 
exported read-only, so you can at least do a raw backup of whatever data is 
left, or use some sort of filesystem recovery tools if they are available for 
your fs.

-Kevin
