Return-Path: <root@srv.sistina.com>
Date: Mon, 2 Jul 2001 13:08:32 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Request for misalignment tests
Message-ID: <20010702130832.D18512@sistina.com>
References: <20010626161947.A11918@sistina.com> <3B3A0F47.37860696@ida.xs4all.nl>
Mime-Version: 1.0
In-Reply-To: <3B3A0F47.37860696@ida.xs4all.nl>; from jorg.de.jong@ida.xs4all.nl on Wed, Jun 27, 2001 at 06:52:23PM +0200
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

Jorg,

please avoid recent CVS and if possible don't create PVs with
LVM versions > 0.9.1 Beta 5.

Sorry for the incenvenience.

Regards,
Heinz    -- The LVM Guy --

On Wed, Jun 27, 2001 at 06:52:23PM +0200, Jorg de Jong wrote:
> Heinz Mauelshagen wrote:
> > 
> > All,
> > 
> > we need your help in regard to the misalignment problems we are trying
> > to fix right now in order to get facts concerning how many people are actually
> > suffering from it.
> > 
> > In case you created VGs or extended them with LVM 0.9.1 Beta 6 or 7,
> > we'd appreciate if you could send us the output (if any) of
> > 
> >    pvdisplay -v /dev/YourPVname | grep "^ *00000"
> > 
> > if the sector offset in the last column is odd.
> > 
> > If so, please add a "pvdisplay /dev/YourPVname" as well.
> > 
> > We appreciate your help!
> > 
> Here is one:
> 
> [jorg] /home/jorg > sudo pvdisplay -v /dev/hda9 | grep "^ *00000"
>    00000 /dev/vg00/home            00776   4685
> 
> attached is the pvdisplay
> 
> regards
> 
> jorg

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
