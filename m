Subject: Re: [linux-lvm] lvm on linux RAID5?
From: Anders Henriksson <anders.henriksson@xelin.se>
In-Reply-To: <3DAE79B3.F19BBF21@silicide.dk>
References: <1034773372.1658.8.camel@frodo.xelin.se> 
	<3DAD6971.3040305@ednet.ns.ca> <1034779135.1652.13.camel@frodo.xelin.se> 
	<3DAE79B3.F19BBF21@silicide.dk>
Content-Transfer-Encoding: 7bit
Message-Id: <1034859636.1652.75.camel@lap-13.ida.liu.se>
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
Date: Thu Oct 17 06:06:25 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

<snip>

> > > What kind of machine did you manage to get 4 RAID5 arrays into?
> > 
> > It is actually not that hard, take your one array and split it into 4.
> > I have 4 discs which are split into 4 raid partitions each.
> 
> Why would you split the raid, for then just to run LVM ontop of it ?

Just to have the flexibility to shrink the array and reuse partitions
for other purposes if needed, the same reason I have for wanting to use
lvm in the first place, just plain simple flexibility.

/Anders 
> 
> 
> 
> JonB
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
