Subject: Re: [linux-lvm] lvm on linux RAID5?
From: Anders Henriksson <anders.henriksson@xelin.se>
In-Reply-To: <3DAD6971.3040305@ednet.ns.ca>
References: <1034773372.1658.8.camel@frodo.xelin.se> 
	<3DAD6971.3040305@ednet.ns.ca>
Content-Transfer-Encoding: 7bit
Message-Id: <1034779135.1652.13.camel@frodo.xelin.se>
Mime-Version: 1.0
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
Date: Wed Oct 16 09:59:43 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 2002-10-16 at 15:28, Patrick Boutilier wrote:
> Anders,
> 
> That should work. I run LVM on top of one raid5 device but I don't see 
> why it wouldn't work over 4 of them.
> 
> For example run pvcreate on /dev/sda, then /dev/sdb, etc..

It seems to work fine, I just tried it and it works smoother than
expected.

> 
> What kind of machine did you manage to get 4 RAID5 arrays into?

It is actually not that hard, take your one array and split it into 4.
I have 4 discs which are split into 4 raid partitions each.

/Anders



> 
> 
> 
> Anders Henriksson wrote:
> 
> > Hej,
> >
> > I have tried scanning the list archive and re-read the documentation but
> > still....
> >
> > I want to run lvm over four linux raid5 devices, can I just treat the
> > raid devices as discs? i.e. run pvcreate on them directly and go on from
> > there.
> >
> > I am running a linux 7.3 server almost out of the box.
> >
> > /Anders
> >
> >
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
