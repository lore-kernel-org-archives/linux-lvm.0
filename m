Message-ID: <92091C60D5E2B74CB77C1FDB84F5FA76F026@s99mail02.okdhs.org>
From: "Little, Chris" <Chris.Little@okdhs.org>
Subject: RE: [linux-lvm] can i extend a volumen bigger 256 gigas ?thx
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
Date: Mon May  5 15:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

no.  it is destructive.

> -----Original Message-----
> From: fnt [mailto:FNT@mail.ono.es]
> Sent: Monday, May 05, 2003 3:49 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] can i extend a volumen bigger 256 gigas ?thx
> 
> 
> Hi,
> 
> Recreating the VG , i will keep the data?
> thx
> 
> Joaquin Ign.
> Best Regads-
> ---- Original Message -----
> From: "Daniel Barbar" <dbarbar@legato.com>
> To: <linux-lvm@sistina.com>
> Sent: Monday, May 05, 2003 10:40 PM
> Subject: Re: [linux-lvm] can i extend a volumen bigger 256 gigas ?thx
> 
> 
> > Yes, it is possible. What's the command you're using and the error
> > you get? The maximum size of a logical volume is a function of the
> > volume group physical extent size (I don't remember the details).
> > You may need to create the volume group with a larger physical
> > extent in order to have larger capacity logical volumes, for
> > instance, 'vgcreate -s 16m ...'. As far as I know, you do have to
> > recreate the volume group in order to change the physical extent
> > size. Hope this helps.
> >
> > ---
> > Daniel Barbar
> >
> > fnt wrote:
> > > Hello,
> > >
> > > It is possible to extend a volumen more than 256 gigas?
> > > it doesnt let me grow the space.
> > > this is muy info :
> > > root]# cat /proc/lvm/global
> > > LVM module LVM version 1.0.3(19/02/2002)
> > >
> > > Total:  1 VG  2 PVs  1 LV (1 LV open 1 times)
> > >
> > > Global: 449424 bytes malloced   IOP version: 10   1175 
> days 12:40:03
> active
> > >
> > > VG:  gl  [2 PV, 1 LV/1 open]  PE Size: 4096 KB
> > >   Usage [KB/PE]: 294883328 /71993 total  113950720 /27820 used
> 180932608
> > > /44173 free
> > >   PVs: [AA] ide/host0/bus0/target0/lun0/part4 113950720 /27820
> 113950720
> > > /27820          0 /0
> > >        [AA] ide/host0/bus0/target1/lun0/part1 180932608 /44173
> 0 /0
> > > 180932608 /44173
> > >     LV:  [AWDL  ] vol1                     113950720 
> /27820    1x open
> > >
> > > i have installed: lvm-1.0.1-2mdk.i586.rpm
> > >
> > > thanks on advanced.
> > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> > --
> > Daniel Barbar
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
