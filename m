Message-ID: <000901c2af7f$1f5ab1a0$820d2a3e@Desiportatil>
From: "fnt" <FNT@mail.ono.es>
References: <004c01c2af72$d49d8220$820d2a3e@Desiportatil> <3E0F61AE.5090804@comedia.it>
Subject: Re: [linux-lvm] vgcreate -- no valid physical volumes in command line
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
Date: Sun Dec 29 15:13:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

thx, it works :=)
----- Original Message -----
From: "Luca Berra" <bluca@comedia.it>
To: <linux-lvm@sistina.com>
Sent: Sunday, December 29, 2002 9:57 PM
Subject: Re: [linux-lvm] vgcreate -- no valid physical volumes in command
line


>
> > --- List of physical volume UUIDs ---
> > ------------------------------------------------------
> > root]# pvscan
> > pvscan -- reading all physical volumes (this may take a while...)
> > pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/part1" is in no
VG
> > [37.27 GB]
> > pvscan -- inactive PV "/dev/ide/host2/bus1/target1/lun0/part1" is in no
VG
> > [74.53 GB]
> > pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/part1" is in no
VG
> > [19.08 GB]
> > pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/part1" is in no
VG
> > [19.07 GB]
> > pvscan -- total: 4 [149.96 GB] / in use: 0 [0] / in no VG: 4 [149.96 GB]
>
> --------------------------------------------------------------------------
--
> > ---------
> >
> >  root]# vgcreate test-vg /dev/hd[e-h]1
> > vgcreate -- no valid physical volumes in command line
> >
> >
> > i have this error, can samebady help me out?
> >
> vgcreate test-vg /dev/ide/host2/bus1/target0/lun0/part1 .....
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>   /"\
>   \ /     ASCII RIBBON CAMPAIGN
>    X        AGAINST HTML MAIL
>   / \
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
