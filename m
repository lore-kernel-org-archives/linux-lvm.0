From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Removing PV with disk errors from VG
Message-Id: <20020312143404.B18690@sistina.com>
References: <20020311163211.D13418@sistina.com>
    <Pine.LNX.4.44.0203111559500.10883-100000@pzat.meep.org>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0203111559500.10883-100000@pzat.meep.org>;
    from oolon@ankh.org on Mon, Mar 11, 2002 at 04:22:56PM +0000
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
Date: Tue Mar 12 07:35:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 11, 2002 at 04:22:56PM +0000, James Hawtin wrote:
> 
> 
> On Mon, 11 Mar 2002, Heinz J . Mauelshagen wrote:
> 
> >
> > well that's a bug in 1.0.3 which will be fixed in 1.0.4.
> > If you wnat to try it at your own risk, check out LVM1 CVS and
> > try "pvmove -i" again.
> >
> > 1.0.4 will hopefully be released this week :)
> >
> > Regards,
> > Heinz    -- The LVM Guy --
> >
> >
> 
> Hmmm, I had a problem with pv move over the weekend as well.. I was
> replacing a hard disk for more space. and when I tried pvmove it worked
> for 2 small partitions, but for a larger data area it failed to move
> (because of a read error). Interestingly I had not got any error messages
> in dmsg about bad seeks.
> 
> Not knowing about pvmove -i I feel back to my old system for using tar in
> a pipe to move data, not quick not pretty but it works ;-)
> 
> So fortunately it looks like it was a virgin sector.
> 
> My question is.... This pvmove bug does it make "read error" problems in
> which  case the disk might be ok, or does it just not handle read errors
> gracefully?

It displays "read errors" because the bug lead to llseek errors which
where handed backup to an internal read function call.

Regards,
Heinz    -- The LVM Guy --

> 
> Yes I was using 1.0.3.
> 
> The Disk was an 46G IBM (From the ICL (newer glass platter C**p)) so I am
> willing to beleive it was a disk problem (I have space on the shelf so
> it can sit with its friends) it which case I will not use the disk agian.
> 
> I already lost 2 IBM disks from the older range and have another one
> which when I have the money I will be swapping out... Agh! I hate IBM. Yup
> i know I can RMA it, but whats the point if the new one might have
> problems too, my data is worth more than that.
> 
> Does make for fun at computer fairs though,
> 
> Me:   I need a new harddisk...
> Them: IBM make the best ones.
> (The specs are great and are dead fast)
> Me:   IBM disks live fast and die fast, what do you have in a non IBM
>       disk.
> 
> PS anyone else know of other brands I should avoid buying?
> 
> James
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
