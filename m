From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcfgrestore and bootstrap
Message-ID: <20030924103749.C2618@sistina.com>
References: <200309231754.20420.gingiabios@email.it>
Mime-Version: 1.0
In-Reply-To: <200309231754.20420.gingiabios@email.it>; from gingiabios@email.it on Tue, Sep 23, 2003 at 05:54:20PM +0200
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
Date: Wed Sep 24 03:49:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Gingia,

the normal procedure is "vgscan ; vgchange -ay ; mount -a"
rather than vgcfgrestore before vgchange.

vgscan recognizes changes in the IO configuration (e.g. devices moved
to different addresses causing device nodes t change).

Have you tried "vgscan ; vgchange -ay ; mount -a" before ?
(keep in mind, that vgscan needs space below /etc/ to store metadata copies)

Regards,
Heinz    -- The LVM Guy --


On Tue, Sep 23, 2003 at 05:54:20PM +0200, Gingia wrote:
> Hi all.
> I write in this list to explain the problem with the meta data and the 
> inconsistence.
> 
> Thank to Heinz J . Mauelshagen i solve the principal problem.
> 
> Now i have another problem caused by the same root.
> 
> When i start the devlopment  server (debian woody), it remain in the runlevel 
> 1 e ask me the pass to root access for device-filesystem problem.
> It said that it had problem with the  lvm.
> 
> To start the sewrver i must to :
> 1) vgcfgrestore -n volume1 -f /etc/lvmconf/volume1.conf /dev/i2o/hda3
> 2) vgchange -a y
> 3) mount -a 
>  and only now i can go to runlevel 2 for normal start.
> 
> So i understand that 1) the "restoring" metadata is a routine operation at 
> boostrap instead of a propely restoring 2) for some reason this does not 
> happen more.
> 
> So my question is: Why ?
> How i can restabilished this at boot time? I can move to solve this other 
> problem?
> Can you help me?
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
