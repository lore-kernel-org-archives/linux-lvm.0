Return-Path: <tmdg@uksr.hp.com>
Message-ID: <3B14B647.9BE16854@uksr.hp.com>
Date: Wed, 30 May 2001 08:58:47 +0000
From: Tom Dawes-Gamble <tmdg@uksr.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problem extending a LV
References: <20010529120104.C29771@sistina.com> <Pine.LNX.4.33.0105291333520.8330-100000@UberGeek.coremetrics.com> <20010529235523.B1414@gatekeeper.osp.nl>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

	The HP VxVm (Veritas Volume Mangager for HP-UX 11i) has this
functionality.  If you have enough spare space you can also change stripe
sizes on the fly too.

Tom.


josv@osp.nl wrote:
> 
> Hi,
> 
> You mention that Veritas (presumably the Volume Manager) has this
> functionality. Are you sure that you can add a subdisk to a striped plex
> in a volume? I'm just curious because I can not remember that this is
> actually possible....
> 
> ++Jos
> 
> And thus it came to pass that Austin Gonyou wrote:
> (on Tue, May 29, 2001 at 01:35:07PM -0500 to be exact)
> 
> > Are there plans to have this functionality? As in, I have a 2 disk striped
> > set, and now I'm running out of space, so I add a third pv, and now I want
> > to restripe and extend onto the third disk? I ask because Veritas has this
> > ability, and it could be a deal breaker for some choosing which to use.
> >
> > --
> > Austin Gonyou
> > Systems Architect, CCNA
> > Coremetrics, Inc.
> > Phone: 512-796-9023
> > email: austin@coremetrics.com
> >
> > On Tue, 29 May 2001, AJ Lewis wrote:
> >
> > > On Tue, May 29, 2001 at 11:33:54AM +0200, Carsten Balzer wrote:
> > > > If I try to extend the LV with:
> > > > lvextend -L+78164M /dev/NVolGroup/nVol
> > > > then I get:
> > > > lvextend -- rounding size 240119808 KB to stripe boundary size
> > > 240123904
> > > > KB
> > > > lvextend -- only 19541 free physical extents in volume group
> > > "NVolGroup"
> > > >
> > > > Next try with: lvextend -l+19541 /dev/NVolGroup/nVol
> > > > lvextend -- rounding size 240119808 KB to stripe boundary size
> > > 240123904
> > > > KB
> > > > lvextend -- only 19541 free physical extents in volume group
> > > "NVolGroup"
> > >
> > > You cannot currently extend a striped LV onto a new disk.  It would
> > > involve
> > > completely rearranging the data to account for the new striping
> > > configuration.  The reason you get the error is because the tools know
> > > this
> > > and are trying to extend on the two original PVs.  If you want to have
> > > the
> > > ability to extend the LV onto new disks, you must use linear LVs.
> > >
> > > Regards,
> > >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> --
> If you do what you've always done,
> You get what you've always gotten.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

- -- 
char  *t,*n,*i="%.9s%.7s%.7s\n";extern void exit(int);extern int printf(const 
char  *,...);int main(){int v=*i,g,e=*(i-~(v/=v))%*(i+v);g=*i+~e--; 
t=n="  DISPLAY'tmdg@uksr';,,;'.hp.com'*>"+g;v=g-e;  e-=printf(i,n- v,e+n,t);
t=n="  DISPLAY'http://www.itrc.hp.com/' *>"-~g;exit(g+~printf(i,n+~v,e+n,t));}

-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5.1i

iQA/AwUBOxS2RAbfKggmajr3EQKACwCggAwu+r/4Q/xTn0pFiYgNsAMXnoUAoPKC
rqG6slFd3xhqXS7oR7vB7pRX
=Pdmj
-----END PGP SIGNATURE-----
