From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] LVM System
Message-Id: <20020304172754.K18939@kluge.net>
References: <auto-000021223409@front2.mail.megapathdsl.net>
    <20020304170002.J18939@kluge.net>
    <auto-000021227972@front2.mail.megapathdsl.net>
    <auto-000021223409@front2.mail.megapathdsl.net>
    <20020304170002.J18939@kluge.net>
    <auto-000019991746@front1.mail.megapathdsl.net>
    <auto-000021227813@front2.mail.megapathdsl.net>
    <auto-000021223409@front2.mail.megapathdsl.net>
    <20020304170002.J18939@kluge.net>
    <auto-000019991746@front1.mail.megapathdsl.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auto-000019991746@front1.mail.megapathdsl.net>;
    from anthony@AWMObjects.com on Mon, Mar 04, 2002 at 05:07:03PM -0500
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
Date: Mon Mar  4 16:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Anthony W. Marino" <anthony@AWMObjects.com>
Cc: linux-lvm@sistina.com

On Mon, Mar 04, 2002 at 05:07:03PM -0500, Anthony W. Marino wrote:
> When I went to 3ware for 7800 driver for SuSE I didn't find one for that 
> particular release.  I found one for SuSE 7.0 and wonder if I could use that 
> one for my SuSE 7.3 system.

> I think I found an reply to an old message from me that states it would work 
> just fine.   How do you like the 7410?

> What RAID configuration are you running?

It's the 3w-xxxx kernel module.  It seems to be standard in the 2.4.x series
kernels, I didn't have to do any compiling to get it to work.  I don't know
what kernel the SuSE distros use though.

The 7410 works nicely.  I only planned to do RAID1, so I didn't go for the
extra cache 7450.  The only thing I don't like about it so far is the RAID
manager tool that you get from 3ware has a really terribly installation script
(let's figure out which distro I'm running on based on the kernel version I'm
running... yeah! <G>)  So I haven't installed it yet.  It's also looking like
they only have a GUI tool, which means it'll be difficult getting a monitor
setup to watch for failed disks. :(

-- 
Randomly Generated Tagline:
"I hear you collect plants.  So does my wife."      - Napoleon
