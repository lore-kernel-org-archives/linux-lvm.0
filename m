Message-Id: <3.0.6.32.20011102105416.008062e0@mail.doorpi.net>
From: Brent Harding <bharding@doorpi.net>
Subject: Re: [linux-lvm] pvmove root filesystem?
In-Reply-To: <20011102112226.A466@btconnect.com>
References: <20011101235041.B746@lynx.no>
 <20011101233119.P21136@pc.ilinx>
 <20011101221529.W16554@lynx.no>
 <20011102003346.Q21136@pc.ilinx>
 <20011101235041.B746@lynx.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Date: Fri Nov  2 10:50:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

What happens, if you just dd one device to another? Is that a good way to
move one file system to another?
When I set up lvm, I used the cpio option that the howto provided. Never
really used cpio before, but I just copied the line in the howto verbadem
and it moved the partition of /dev/hdb3 in to /dev/root/root for the volume
group, currently with only /dev/hdb2 and 4 in it, 3 still has my old setup
in it. Would it've worked just as good to have went
dd if=/dev/hdb3 of=/dev/root/root
to copy over that whole file system to the lvm device without mounting it?
Of course, I'd have pvcreated it, vgcreated, and lvcreated before I'd do
any of it.
At 11:22 AM 11/2/01 +0000, you wrote:
>On Thu, Nov 01, 2001 at 11:50:43PM -0700, Andreas Dilger wrote:
>> On Nov 02, 2001  00:33 -0500, Brian J. Murrell wrote:
>> > > Brian, the "pvmove" mechanism is not yet 100% safe for mounted
filesystems.
>> > 
>> > Ugh.  I was hoping to not hear something like this.  Has it gotten any
>> > better recently?  What I mean is my LVM identifies itself as:
>> > 
>> > LVM version LVM 0.9.1_beta7(ish)  by Heinz Mauelshagen  (20 June 2001)
>> > lvm -- Module successfully initialized
>> 
>> Well, there have been a lot of changes to the pvmove locking code and
>> such since then.  Whether it actually makes a difference is hard to
>> tell.
>> 
>> > Am I going to run into even more problems with this verion of LVM vs.
>> > the latest or has the "live" pvmove stuff not changed much between the
>> > version I am running and current.
>> 
>> Nobody has really done any good testing on it.
>
>I've done a bit of testing, and have never seen any problems due to
>the holes in the locking; as such I am happy to use pvmove on *my*
>development system (I don't use raw devices).  I certainly couldn't
>recommend it for production systems.
>
>As well as the locking problems there is a potential kernel deadlock,
>which I can easily induce under memory pressure (too much deferred io
>that cannot complete and no free memory to enable the userland copy to
>finish).
>
>- Joe
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
