From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] offtopic but ...
Message-Id: <20020508082357.B18631@connectlive.com>
References: <20020508074927.A18631@connectlive.com>
    <Pine.LNX.4.33.0205081502560.3518-100000@diablo.unixag-zw.fh-kl.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0205081502560.3518-100000@diablo.unixag-zw.fh-kl.de>;
    from jovi@unixag-zw.fh-kl.de on Wed, May 08, 2002 at 03:12:45PM +0200
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
Date: Wed May  8 08:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Hehe Tim,
> 
> that was fast, but as i told little bit lower in the email I dont want to
> put everything in a RAID. The RAID controller isnt the problem if you buy
> me a further 160GB Maxtor i will buy the RAID contoller or do
> software-RAID. ;-)

Fair enough.  Personally (having to do this at work) I feel like an IDE
enclosure or a hardware RAID card is a relatively small investment in
data security, but then again, the 500GB I have live right now is not
content that I can tolerate data loss on.  We probably should not use
IDE drives for it at all, except that it is replicated onto a whole
steaming mess of SCSI drives, also RAIDed up... 

I think your requirements are different than the ones I am used to.


> The goal is simply to combine more diskspace+more security then just a
> LVM+one logical unit (mountpoint/device where you dont have to care all
> the time
> how the data gets stored and where)+better usage of the diskspace (you
> dont have on the one everything free and the other is halffull.

Makes sense, but I'm not sure how one would dynamically reallocate
parity information while everything is in-flight (eg. live).


> Or just imagine you would like to have 500gb and have only 4x3,5 slots to
> build the harddrives in and the maximum size is at the moment 160GB. How
> would you do it and you would give up some security for the advantage to
> have more space but not to lose everything if one drive fails.
> And the idea i described in the email below is somehow between a RAID0/LVM
> and a RAID5.

Again, the difference between my requirements and the ones you're
outlining is that I simply call a vendor and order another enclosure
when I need another 500GB.

I think I am beginning to see what your idea is, but the logistics of
having LVM take care of the metadata seem rather daunting.


-- 
    We should take care not to make the intellect our god; 
    it has powerful muscles, but no personality. 

                                        --Albert Einstein 
