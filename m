Date: Wed, 27 Sep 2000 14:47:14 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] lv not persistent across reboot?
Message-ID: <20000927144714.A21932@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <Pine.LNX.4.21.0009251623060.25906-100000@tp.sf.opensales.com> <20000926113521.C17132@srv.t-online.de> <avo3tsssjd645dc7l0m7cdav900gm3i9ge@4ax.com>
Mime-Version: 1.0
In-Reply-To: <avo3tsssjd645dc7l0m7cdav900gm3i9ge@4ax.com>; from brewgyman@yahoo.com on Wed, Sep 27, 2000 at 07:19:14AM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Brueggeman <brewgyman@yahoo.com>
Cc: linux-lvm@msede.com


Morning Steve :-{)

On Wed, Sep 27, 2000 at 07:19:14AM -0500, Steve Brueggeman wrote:
> Does this imply that Linux LVM will also have problems with discs in H.A.
> configurations? 

Yes.

> 
> For example: Fibre Channel drives have two ports on them.  If I have a Linux box
> with two Host Adapters, and each adapter is connected to the same set of drives,
> but on different ports, will v0.8final (without the patch below) have unstable
> vgscans?

Yes, it should.

> 
> I have not been following the high availability mailing list, and a solution may
> already exist  there.  If so, and you know how, I'd be interested in a quick
> description.

Not that i am aware of.

Cheers,
Heinz

> 
> Later,
> 
> Steve Brueggeman
> 
> On Tue, 26 Sep 2000 11:35:21 +0000, you wrote:
> 
> >
> >Just recently i faced the efect with 2.4.0-test8, that devices where
> >exposed multiple times. For eg. /dev/sdb and /dev/sdf accessed the same drive.
> >
> >Sent a message to linux-kernel.
> >
> >Here's a temporary workaround for the LVM 0.8final library to deal
> >with this bug.
> >
> >
> >Please replace the loop block in tools/lib/pv_read_all_pv_of_vg.c
> >starting at line 84 by:
> >
> >      for ( p = 0; pv_tmp != NULL && pv_tmp[p] != NULL; p++) {
> >         if ( pv_check_consistency ( pv_tmp[p]) < 0) continue;
> >
> >         /* avoid dual access pathes for now (2.4.0-test8) */
> >         for ( i = 0; i < np; i++) {
> >            if ( pv_tmp[i] == NULL) continue;
> >            if ( strncmp ( pv_tmp[i]->vg_name, pv_tmp[p]->vg_name,
> >                           NAME_LEN) == 0 &&
> >                 pv_tmp[i]->pv_number == pv_tmp[p]->pv_number &&
> >                 strncmp ( pv_tmp[i]->pv_uuid, pv_tmp[p]->pv_uuid,
> >                           UUID_LEN) == 0) {
> >               free ( pv_tmp[p]);
> >               pv_tmp[p] = NULL;
> >               goto pass_end;
> >            }
> >         }
> >
> >         if ( strcmp ( pv_tmp[p]->vg_name, vg_name) == 0) {
> >            if ( pv_number < pv_tmp[p]->pv_number)
> >               pv_number = pv_tmp[p]->pv_number;
> >            np++;
> >         }
> >pass_end:
> >      }
> >
> >
> >Gimme feedback if it works for you.
> >
> >Regards,
> >Heinz      -- The LVM guy --
> >
> >On Mon, Sep 25, 2000 at 04:52:40PM -0700, Tim Pepper wrote:
> >> I've set up a little test machine to play with lvm.  It's running RedHat 6.2
> >> with a 2.4-test8 kernel and lvm 0.8.
> >> 
> >> I've successfully created and used an lv (with a reiserfs filesystem on top
> >> of it).  My problem is that when I reboot the lv is gone.  vgscan finds
> >> nothing.  pvdisplay, lvdisplay and vgdisplay likewise show nothing.  If I go
> >> through the steps though to recreate the lvm, pvcreate seems to think
> >> something's there and wants me to do a '-ff'.  I can then continue on.
> >> 
> >> Playing around I see:
> >> 
> >> 	[root@qalab5 /root]# umount /mnt/nz
> >> 	
> >> 	[root@qalab5 /root]# lvdisplay /dev/netzero/big 
> >> 	--- Logical volume ---
> >> 	LV Name               /dev/netzero/big
> >> 	VG Name               netzero
> >> 	LV Write Access       read/write
> >> 	LV Status             available
> >> 	LV #                  1
> >> 	# open                0
> >> 	LV Size               34.18 GB
> >> 	Current LE            8750
> >> 	Allocated LE          8750
> >> 	Allocation            next free
> >> 	Read ahead sectors    120
> >> 	Block device          58:0
> >> 	
> >> 	[root@qalab5 /root]# vgscan
> >> 	vgscan -- reading all physical volumes (this may take a while...)
> >> 	vgscan -- no volume groups found
> >> 
> >> 	[root@qalab5 /root]# lvdisplay /dev/netzero/big 
> >> 	lvdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> >> 	vgscan
> >> 
> >> 	[root@qalab5 /root]# vgscan
> >> 	vgscan -- reading all physical volumes (this may take a while...)
> >> 	vgscan -- no volume groups found
> >> 	
> >> 	[root@qalab5 /root]# mount /mnt/nz
> >> 
> >> I can't seem to display it, but it does remount here.
> >> 
> >> I was thinking that maybe the 'vgchange -a n' shouldn't be done or perhaps I
> >> was doing it at the wrong time (at shutdown after the filesystem on the lv was
> >> umounted), but the above seems flakey even without vgchange in the picture.
> >> 
> >> Any ideas what could be going on?  Thanks in advance for any help.
> >> 
> >> Tim
> >> 
> >> --
> >> *********************************************************
> >> *  tim.pepper@opensales dot com     * Venimus, Vidimus, *
> >> *  http://www.opensales.com         * Dolavimus         *
> >> *********************************************************
> >
> >=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> >
> >Heinz Mauelshagen                                 Sistina Software Inc.
> >Senior Consultant/Developer                       Bartningstr. 12
> >                                                  64289 Darmstadt
> >                                                  Germany
> >Mauelshagen@Sistina.com                           +49 6151 7103 86
> >                                                       FAX 7103 96
> >=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
