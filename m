From: Melinda Taylor <melinda@phys.unsw.edu.au>
Subject: Re: [linux-lvm] LVM disk died
In-reply-to: <3F111240.5080807@xs4all.nl>
Message-id: <1058094066.1241.9.camel@neko>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <5.1.1.6.0.20030712160456.02b2e398@imap.phys.unsw.edu.au>
 <3F111240.5080807@xs4all.nl>
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
Date: Sun Jul 13 06:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sun, 2003-07-13 at 18:03, Gert van der Knokke wrote:
> Melinda Taylor wrote:
> 
> > can someone direct me to the faq that shows me how to recover from a 
> > dead drive.
> >
> > I had LVM spanning 4 HDDs and one will no longer spin up. 
> 
> Hi Melinda,
> 
> Sometimes a 'dead' drive can be brought back to (temporary) live again 
> by giving it a hard knock or better: a sharp twist, as the heads tend to 
> stick to the surface of the platters. Mind though that such a drive is 
> not trustworthy anymore but if it does spin up you might be able to get 
> the data off it.
> 
> Best way to this is to take the drive out of the PC and  hold it flat in 
> your hand and give it a sharp twist in the horizontal direction. This  
> helped me  a few times with such 'sticky' drives. After that, mount it 
> back in the PC and try it.

Hi Gert,

I'll try what you suggest tomorrow. It is all very strange since my last
email another of the 4 disks now has the same error. I am that unlucky
that 2 disks fail? 

When the machine boots the SCSI bios says:

ASYN start unit request failed

It does seem to be spinning.I can hear it and if I rotate it I can feel
the centrifugal force from the disks spinning inside.

If i boot with my linux boot disk it sees the drives sda sdb and the two
partitions on each but it says 

"sda spinning up disk....................." 

and ultimately fails It can also identify the vendor and model number on
the linux boot.

I'll take this to another list but its just interesting so I thought I
would post (I'd still like some advice for my original question though
regarding rebuilding from what is now 2 disks of 4 in my LVM)

Thanks,

Melinda
