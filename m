From: "Tom Parker" <tom@carrott.org>
Subject: Re: [linux-lvm] Overlapping logical volumes
In-Reply-To: <20031103111117.F1850@sistina.com>
Message-ID: <2154.438T400T202443tom@carrott.org>
MIME-Version: 1.0
Content-transfer-encoding: 7bit
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
Date: Mon Nov  3 05:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Heinz J . Mauelshagen" <linux-lvm@sistina.com>

Heinz J . Mauelshagen <mauelshagen@sistina.com> wrote:

>On Sat, Nov 01, 2003 at 07:07:53PM +1200, Tom Parker wrote:

>> I have just experianced a rather nasty bug in lvextend. I grew a logical
>> volume and it used extents that were already in use for another logical
>> volume.

>You're the first reporting.
>Do you have abn archive copy in /etc/lvmconf representing that situation
>still ? If so, send it to me please <mge@sistina.com>.

I hope I'm not imagining things as I can't reproduce it anymore. It would
appear that I don't currently have any overlapping volumes. I've rebooted
twice since the original incident, and I only have on disk copies of
intermediate files from my original analysis (I had to process the output of
lvdisplay -v with cut and sort and uniq to find the problem, it would be
easier if you provided an easily meachine readable format for lvdisplay -v).
The output of lvdisplay on the effected volumes would appear to be different
from that captured in my intermediate files, however I cannot be 100% certain
I didn't make a mistake and cut at the wrong place or something.

However I'm pritty sure I'm not imagining it. I recall lvdisplay -v reported
all extents allocated from one physical volume, and pvdisplay -v on that
volume showed not as many extents allocated to the logical volume as lvdisplay
did.

The old root logical volume no longer mounts, this logical volume was in use
last week and even remounted after a reboot when I didn't switch onto a new
root correctly.

I'll send you the /etc/lvmconf files from around the incident and hopefully
one of them will show the problem.

>> Is there a program that can validate the logical volume configuration and
>> ensure that no physical extent is allocated to more the one logical volume?

>vgck

This claims my current configuration is good. Is there a way to run it on old
config files?

>Do an "lvcreate -Zn ...", run vgck and check the "lvdisplay -v ..." output
>on all your LVs if there's any overlaps again. If so, that's the archive copy
>you want to send to me.

I'll bear this in mind.

--
Tom Parker - tom@carrott.org
           - http://www.carrott.org
