From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] Re: [lvm-devel] [ANNOUNCE] LVM reimplementationre
    ady for beta testing
In-Reply-To: <20020201102439.B15135@sistina.com>
Message-Id: <Pine.LNX.4.10.10202051326310.19683-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Tue Feb  5 08:04:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Fri, 1 Feb 2002, Heinz J . Mauelshagen wrote:

> 
> It is quite intersting how many people don't take backups even though
> almost everybody claims to know that backups are crucial and some of them
> know that they are still, even though they might have RAID in place.
> 

I think the reason most people don't do backups is because, hard disk
drives are really big and really cheap. Tape drives are really expensive,
media is also expensive and frankly tapes are very small for the cost.
Effective backup can double the cost of a system and requires time to
manage it.

For the "home" market its just to much. The only system just about
affordable is DAT tape, DLT blanks are about double the cost for the
storage ammount. I bought a DDS4 drive for "home" use, 1 week after I got
it I had my laptop stolen, so it justified its cost pretty fast :-) A 60
gig hard disk, costing 100 pounds requires 2-3 DSS4 tapes to backup At 15
pounds each, one round of backups cost 1/3 of the cost of the disk
multiply that by the number of disks, add in the hassle factor of changing
tapes. Auto changers are nice, but alot more! For "PC" based systems the
backup costs are oftain higher than the price of the machine, and thats
hard for people to justify.

If anyone suggests they use "hard drives" to back up I will scream, cost
that system just don't scale, and yup you have an old copy but do people
ever update it? Yes... when they get another hard drive... however before
that happens they have put the old on back into service because they
needed a little more space ;-)

All in all, backup is expensive/slow, my sister/mom/dad ain't going to pay
that kind of money for home... For Work its slow, fine if your a sysadmin
and that your job... If you are a sysadmin you probably don't get to do
bugets, your manager does, and they don't understand the cost and aways
want to cut corners to keep costs down, XXX is a "developement" system so
we don't need to back it up cos its not "production" etc etc. Store all
your data on the network file server, (which is aways full with p0rn) and
connected via a doggie network, taping 3 minutes to access the smallest
file, so people store data on the local machine, and forget to copy it
back to the network...

This why people don't have backups in my book.

Sorry I didn't mean this to become a rant, just got on a roll...

James
