From: Oliver Jovic <jovi@unixag-zw.fh-kl.de>
Subject: Re: [linux-lvm] offtopic but ...
In-Reply-To: <20020508074927.A18631@connectlive.com>
Message-Id: <Pine.LNX.4.33.0205081502560.3518-100000@diablo.unixag-zw.fh-kl.de>
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
Date: Wed May  8 08:11:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 8 May 2002, Tim wrote:

> Quoth Oliver Jovic:
> > Hello,
> >
> > after searching the web for a while i now bother you with my wish. ;-)
> >
> > Well i use LVM now already for nearly 2 years and had in this time 2 big
> > problems (some harddisks gave up) where i lost nearly everything. I tried
> > to restore the LVM and filesystem but well if you lose 1/4 of your
> > LVM its really hopeless (or maybe I just didnt know how ;-P coz the
> > howto's to this question where well not very helpfull).
>
> This is a solved problem.  Use RAID.
>
> You lose a drive to parity information; that's the price of admission.
>
> It's not like a Promise RAID card is that expensive.
>
>

Hehe Tim,

that was fast, but as i told little bit lower in the email I dont want to
put everything in a RAID. The RAID controller isnt the problem if you buy
me a further 160GB Maxtor i will buy the RAID contoller or do
software-RAID. ;-)
The goal is simply to combine more diskspace+more security then just a
LVM+one logical unit (mountpoint/device where you dont have to care all
the time
how the data gets stored and where)+better usage of the diskspace (you
dont have on the one everything free and the other is halffull.

Or just imagine you would like to have 500gb and have only 4x3,5 slots to
build the harddrives in and the maximum size is at the moment 160GB. How
would you do it and you would give up some security for the advantage to
have more space but not to lose everything if one drive fails.
And the idea i described in the email below is somehow between a RAID0/LVM
and a RAID5.

OJ
