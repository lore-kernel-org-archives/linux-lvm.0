Subject: Re: [linux-lvm] Some questions after starting to use 1.1-rc1
In-Reply-To: Message from
    "Heinz J . Mauelshagen"
    <mauelshagen@sistina.com> of
    "Thu, 25 Apr 2002 12:25:28 +0200."
    <20020425122528.D16336@sistina.com>
MIME-Version: 1.0
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E170qrT-0006EB-00@whittlesey.cl.cam.ac.uk>
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
Date: Thu Apr 25 16:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>> 1) I've been comparing the speed of LVM over RAID0 with striped LVM, using:
>> 	perl -e '$n=1900;$x="X"x(1024*1024);foreach $i(1..$n){print $x}'
>>    and I find that striped LVM takes 50% longer.
> which stripe size did you use?

I don't think I specified -- so "the default" ?

> Were the PVs on non-saturated pathes?

What are "non-saturated pathes" ?

There were two PVs, each on an otherwise unused IDE bus.

> Did you compare LVM1 Raid0 to MD Raid0 on the very same hardware?

Yes.

>> 2) When I tried to extend the striped partition, it failed when it used up
>>    the first two PVs, and will not start the next two.  Ideas ?
> That's a LVM1 constraint which will disapear with LVM2.

:-(

Is there an introductory document on device-mapper ?

> No need to vgexport to test it.

Hmmm ...

> Just stop one PV as you did

stop the RAID device while it's in use by LVM ?

>>     b) should it be possible to export a VG if there is a PV of that VG 
which
>>       is still exported ?

?

>> 5) is there some utility to display the contents of VGDA on disk, /etc/lvm*,
>>    etc;  show where the first PE is in a PV, etc ? 
> Run "pvdata -a" on the particular PV.

Where does it say "PE 0 starts at byte offset <n> of the device" ?
