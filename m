Date: Fri, 5 Oct 2001 09:05:22 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] What have I done!?
Message-ID: <20011005090522.A1245@sistina.com>
References: <009401c14cc3$c63106c0$836788cf@industry> <009501c14cc7$2f5cd360$836788cf@industry> <20011004113309.E31061@turbolinux.com> <30980000.1002218241@dizzy>
Mime-Version: 1.0
In-Reply-To: <30980000.1002218241@dizzy>; from lembark@wrkhors.com on Thu, Oct 04, 2001 at 12:57:21PM -0500
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 04, 2001 at 12:57:21PM -0500, Steven Lembark wrote:
> 
> 
> -- Andreas Dilger <adilger@turbolabs.com>
> 
> >> Is there a way that I can blow the whole thing away and start over?  I
> >> think I've screwed things up too badly to try to resurrect them.  I'd
> >> really like to blow it all away and start over and see if this stuff
> >> happens again, but again I can't use the lv* tools to remove the
> >> configurations because of the errors I mention in my initial post so I
> >> need a manual way to blow away the entire LVM configuration and start
> >> from scratch again.
> >
> > "pvcreate -ff" I think
> 
> If you really want to wipe things clean:
> 
>     (1) vgexport /dev/vgname; # avoids collisions w/ stale config info.
>     (2) for disk in your disks here; do pvcreate -ff $disk; done;
> 
> The export isn't strictly necessar:  rm -rf and a vgscan should do the
> same basic thing with a few nastygrams added in.  Personally, I get
> enough nastygrams to prefer avoiding a few more :-)

I'm curious: which ones are thouse?

> 
> 
> --
> Steven Lembark                                               2930 W. Palmer
> Workhorse Computing                                       Chicago, IL 60647
>                                                             +1 800 762 1582
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

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
