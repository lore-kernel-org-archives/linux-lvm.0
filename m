Return-Path: <austin@coremetrics.com>
Date: Tue, 29 May 2001 13:35:07 -0500 (CDT)
From: Austin Gonyou <austin@coremetrics.com>
Subject: Re: [linux-lvm] Problem extending a LV
In-Reply-To: <20010529120104.C29771@sistina.com>
Message-ID: <Pine.LNX.4.33.0105291333520.8330-100000@UberGeek.coremetrics.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: AJ Lewis <lewis@sistina.com>
Cc: linux-lvm@sistina.com

Are there plans to have this functionality? As in, I have a 2 disk striped
set, and now I'm running out of space, so I add a third pv, and now I want
to restripe and extend onto the third disk? I ask because Veritas has this
ability, and it could be a deal breaker for some choosing which to use.

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com

On Tue, 29 May 2001, AJ Lewis wrote:

> On Tue, May 29, 2001 at 11:33:54AM +0200, Carsten Balzer wrote:
> > If I try to extend the LV with:
> > lvextend -L+78164M /dev/NVolGroup/nVol
> > then I get:
> > lvextend -- rounding size 240119808 KB to stripe boundary size
> 240123904
> > KB
> > lvextend -- only 19541 free physical extents in volume group
> "NVolGroup"
> >
> > Next try with: lvextend -l+19541 /dev/NVolGroup/nVol
> > lvextend -- rounding size 240119808 KB to stripe boundary size
> 240123904
> > KB
> > lvextend -- only 19541 free physical extents in volume group
> "NVolGroup"
>
> You cannot currently extend a striped LV onto a new disk.  It would
> involve
> completely rearranging the data to account for the new striping
> configuration.  The reason you get the error is because the tools know
> this
> and are trying to extend on the two original PVs.  If you want to have
> the
> ability to extend the LV onto new disks, you must use linear LVs.
>
> Regards,
>
