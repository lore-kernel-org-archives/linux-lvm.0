From: "Michelic Adalbert" <a.michelic.suse@aon.at>
Subject: Re: [linux-lvm] New LVM user, couple of problems
Date: Wed, 12 Jul 2000 22:29:09 +0200
Message-ID: <NDBBLPMOHKFCMNGCEHDOCEPFDNAA.a.michelic.suse@aon.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.SOL.4.10.10007121311030.5718-100000@basm.cerias.purdue.edu>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,

Brian Poole wrote:
>
> The first issue I hit upon is with lv[extend,reduce]. Essentially I will
> change the size of the lv (eg lvreduce /dev/vg00/lvol1 -L 200m) however
> when I mount lvol1 the size shown is the same as it was before, according
> to df. lvdisplay shows the correct size of 200m, but the system seems to
> disagree saying the lv is still 6.7g which was the original size. Curious
> I decided to test what would happen if I attempted to write more than 200m
> of data to the mounted lv, so I did dd if=/dev/zero of=/lvol1/bigfile
> bs=1024k count=500 which resulted in a looping scroll of lvm_map errors (I
> don't have them at the moment, but I can get them if it is needed|desired)
> after it passed the 200m mark. This obviously is a bad thing, if diskspace
> is exceeded it should just say no more diskspace, or similar, not go into
> a loop that I can't get out of except by reboot ;). Not sure if I missed
> some essential step to 'sync' between what lvdisplay thinks is there and
> what df, etc do? What I did appears very similar to the LVM-HOWTO.

You have to resize your filesystem - take a look at
http://linux.msede.com/ext2/

-Adalbert
