Message-ID: <3E6C5FAD.358F23F9@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm and md
References: <3E6803F3.5060507@exavio.com.cn> <3E68BDA5.175E6C6C@silicide.dk> <3E6BEB8B.4040802@exavio.com.cn>
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
Date: Mon Mar 10 03:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Peter Yao wrote:
> 
> Jon Bendtsen wrote:
> > Peter Yao wrote:
> >
> >>Should we build lvm volumns on top of soft raid(md) or build md on top
> >>of lvm volumns?
> >>I prefer to build md on top of lvm volumns because lvm can hide the
> >>hardware details from md. Just want to know how do you think about this.
> >>Or any URLs? Thanks.
> >
> >
> > why would you need to hide the hardware details from md ?
> I am using some hot-plugging disks and their device number may change
> after reboot. For example, if i build md with /dev/sda and /dev/sdb,
> after reboot md may cannot start because the two disks' device name
> change to /dev/sdc and /dev/sdd. If i build md on top of lvm this
> problem is avoided. Can you give me some advice for this issue?

sure. Dont change device names ;-D

Perhaps you can use labels ? and label the partitions ?

Another thing is that i dont think the kernel uses /etc/raidtab
i think it looks at the partitions and then starts the md. You 
can set the partition type to raid autodetect. Then it might work
even if you change the partition names.


JonB
