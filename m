From: Werner John <john@oswf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <15280.9856.340823.868715@rigel.oswf.de>
Date: Tue, 25 Sep 2001 08:38:56 +0200 (MEST)
Subject: Re: [linux-lvm] e2fsck probs with LVM and 2.4.9-ac9+
In-Reply-To: <Pine.LNX.4.21.0109241818520.3621-100000@zeke.goatskin.org>
References: <20010924131709.A30558@sistina.com>
	<Pine.LNX.4.21.0109241818520.3621-100000@zeke.goatskin.org>
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
To: linux-lvm@sistina.com

Good morning,

I have a question about mixing user space tools from 0.9.1_beta8 with a
2.4.9-ac14 kernel. I understood that the linux-2.4.9-acX ; X >= 9; kernels
use lvm 1.0 code already. So far I had no problems using the "old" lvm user
space tools. Do I have to expect serious problems?

Anyhow, I'll upgrade user space tools to the most recent version but I'm
really curious if it's just a coincidence that everything seems to work
nicely here. 

Regards

Werner

Shane Shrybman writes:
> 
> Yes, I thought the lvm user mode tools might be the problem. Are the user
> spce tools _always_ backwards compatible? Would it be wise to list the
> version of tools required in Documentation/Changes?
> 
> On Mon, 24 Sep 2001, Heinz J . Mauelshagen wrote:
> 
> > 
> > Shane,
> > 
> > -ac9 has the LVM 1.0 code in it.
> > You should give the LVM 1.0.1-rc2 user space code a try in order to address
> > your problem.
> > 
> > On Sat, Sep 22, 2001 at 07:11:14PM -0400, Shane Shrybman wrote:
> > > Hello,
> > > 
> > > When I attempted to upgrade to 2.4.9-ac9 and ac14 from 2.4.9-ac6 I ran
> > > into a problem.
> > > 
> > > With either of these kernels (I didn't try any others between ac6 and
> > > ac14) the kernel boots fine and lvm-mod gets loaded ok but when the first
> > > filesystem that is on an lv gets mounted e2fsck complains and drops me to
> > > admin prompt. The error message is something like this:
> > > 
> > > The filesystem size (according to the superblock) is 524288 blocks
> > > the physical size of the device is 57344
> > > ...
> > > 
> > > When I reboot back into 2.4.9-ac6 everything is fine after e2fsck.
> > > 
> > > I have e2fsprogs version 1.19, do I need a more recent version?
> > > 
> > > Regards,
> > > 
> > > Shane
> > > 
> > > 
> > > -- 
> > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> > 
> 
> -- 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
