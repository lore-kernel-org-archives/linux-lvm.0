Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 3 Apr 2001 17:03:24 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Re: linux-lvm digest, Vol 1 #118 (MSG 5)
Message-ID: <20010403170324.A568@tykepenguin.com>
References: <200104030645.f336jhV12163@rdb.linux-help.org> <Pine.LNX.4.21.0104031114410.31846-100000@rdb.linux-help.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0104031114410.31846-100000@rdb.linux-help.org>; from ardy@rdb.linux-help.org on Tue, Apr 03, 2001 at 11:21:38AM -0400
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

On Tue, Apr 03, 2001 at 11:21:38AM -0400, ardy@rdb.linux-help.org wrote:
> 
> Patrick, thanks for responding,

No problem, that's what we're here for :-)


> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/hdb2" of VG "vg0" [4.75 GB / 44 MB free]
> pvscan -- ACTIVE   PV "/dev/hdd2" of VG "vg0" [9.49 GB / 4.78 GB free]
> pvscan -- total: 2 [14.25 GB] / in use: 2 [14.25 GB] / in no VG: 0 [0]
> 
> Since I only have 44 MB free on hdb2, is that the size limit of any new
> additional striped volumes I can create? 

'fraid so. If you need striping then you must have the same amount of space on
all the available volumes, otherwise it can't stripe effectively.
 
> Can I create unstriped volumes with the balance of the space left on the
> volume group?

Oh yes, a linear (normal) lv will span the remaining space as required so you
can have a 4.78G+44M LV if you want one.
 
> Can I resize existing striped volumes and make them larger, and if yes, am
> I limited to a maximum of 44MB as shown by pvscan?

Again, I'm afraid so as it stands. 

What you could do is to use pvmove to copy some physical extents from hdb2 to
hdd2 so that would free up some space you could use for your striped volume.
Read the man page for pvmove carefully and I recommend you unmount your volumes
before doing this as there is a lockup bug in pvmove that shows up when the
volumes are busy.

patrick
