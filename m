From: "Anthony W. Marino" <anthony@AWMObjects.com>
Subject: Re: [linux-lvm] LVM System
References: <auto-000021223409@front2.mail.megapathdsl.net>
    <auto-000019991746@front1.mail.megapathdsl.net>
    <20020304172754.K18939@kluge.net>
In-Reply-To: <20020304172754.K18939@kluge.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <auto-000019995456@front1.mail.megapathdsl.net>
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
Date: Mon Mar  4 16:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Theo Van Dinter <felicity@kluge.net>

On Monday 04 March 2002 05:27 pm, Theo Van Dinter wrote:
> On Mon, Mar 04, 2002 at 05:07:03PM -0500, Anthony W. Marino wrote:
> > When I went to 3ware for 7800 driver for SuSE I didn't find one for that
> > particular release.  I found one for SuSE 7.0 and wonder if I could use
> > that one for my SuSE 7.3 system.
> >
> > I think I found an reply to an old message from me that states it would
> > work just fine.   How do you like the 7410?
> >
> > What RAID configuration are you running?
>
> It's the 3w-xxxx kernel module.  It seems to be standard in the 2.4.x
> series kernels, I didn't have to do any compiling to get it to work.  I
> don't know what kernel the SuSE distros use though.
>

I don't understand.  Are you saying the all the software I need is contained 
within my kernel or do I still need to get a driver from 3Ware?
I'm running SuSE Mantel 2.4.18 which the changes text states it has 
2.4.19-pre1 as well as XFS.


> The 7410 works nicely.  I only planned to do RAID1, so I didn't go for the
> extra cache 7450.  The only thing I don't like about it so far is the RAID
> manager tool that you get from 3ware has a really terribly installation
> script (let's figure out which distro I'm running on based on the kernel
> version I'm running... yeah! <G>)  So I haven't installed it yet.  It's
> also looking like they only have a GUI tool, which means it'll be difficult
> getting a monitor setup to watch for failed disks. :(
