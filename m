Message-ID: <3DAE79B3.F19BBF21@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm on linux RAID5?
References: <1034773372.1658.8.camel@frodo.xelin.se> 
		<3DAD6971.3040305@ednet.ns.ca> <1034779135.1652.13.camel@frodo.xelin.se>
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
Date: Thu Oct 17 04:02:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Anders Henriksson wrote:
> 
> On Wed, 2002-10-16 at 15:28, Patrick Boutilier wrote:
> > Anders,
> >
> > That should work. I run LVM on top of one raid5 device but I don't see
> > why it wouldn't work over 4 of them.
> >
> > For example run pvcreate on /dev/sda, then /dev/sdb, etc..
> 
> It seems to work fine, I just tried it and it works smoother than
> expected.
> 
> >
> > What kind of machine did you manage to get 4 RAID5 arrays into?
> 
> It is actually not that hard, take your one array and split it into 4.
> I have 4 discs which are split into 4 raid partitions each.

Why would you split the raid, for then just to run LVM ontop of it ?



JonB
