From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] ERROR "parameter error" setting up snapshot copy
    on write exception table
Message-Id: <20020121150414.C17020@sistina.com>
References: <200201201741.g0KHfEX13025@in-cadcae4.ing.temic.de>
    <200201211146.g0LBkui23525@in-cadcae4.ing.temic.de>
    <21530000.1011615003@methusalix>
    <200201211231.g0LCVs323967@in-cadcae4.ing.temic.de>
MIME-Version: 1.0
In-Reply-To: <200201211231.g0LCVs323967@in-cadcae4.ing.temic.de>;
    from emanuel.quass@temic.com on Mon, Jan 21, 2002 at 01:31:54PM +0100
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
Date: Mon Jan 21 08:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 21, 2002 at 01:31:54PM +0100, Emanuel Quass wrote:
> Hi again,
> 
> 
> Am Montag, 21. Januar 2002 13:10 schrieb Marc Grimme:
> > Hi
> >
> > --On Montag, Januar 21, 2002 12:46:56 +0100 Emanuel Quass
> >
> > <emanuel.quass@temic.com> wrote:
> > > Hi
> > >
> > > I rebooted the server several times (and tried several kernel-versions)
> > > but  every time I got the same error!
> > > The problem is (afaik see) the snapshot. I think if I can get rid of the
> > > snapshot everything will work all right. But I am not able to remove the
> > > snapshot because the Volumegroup is not active ......
> >
> > I had exactly the same problem and the same thoughts but I really don't
> > know how to delete a snapshot of an inactive volumegroup and I couldn't
> > find any program that was provided and did the job. Perhaps you can recover
> > some old configurations without snapshot with vgcfgrestore and stuff. But
> > I'm not really sure if this works cause the problem went away after I
> > rebooted the machine and was never to be seen again. And I was happy and
> > didn't touch this system again.
> 
> I already tried to do so, no result! :-(
> vgcfgrestore didn't helpo me out.

In order to be successfull with vgcfgrestore you need to

a) figure out the most recent metadata backup which *doesn't* contain
   information about the snapshot in question (you can do that with the -ll
   and the -f option of the vgcfgrestore command on the files in
   /etc/lvmconf/NameOfYourVG*) *and*

b) run "pvcreate -ff" on all the PVs before vgcfgrestore *and*

c) run vgcfgrestore on *all* of the PVs of your VG in question


> 
> >
> > And if vgcfgrestore helps, what if you create a snapshot and then some
> > other vgs and lvs and then your snapshot gets corrupt like this, can
> > vgcfgrestore help here also?
> >
> > So I would say I'm out. :-(
> >
> > > Is there a way to remove the snapshot (the volumegroup can't be made
> > > active)  without touching the other logical volumes ?
> >
> > Would be really interesting to know the answer.
> >
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

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
