Date: Tue, 23 Nov 1999 11:47:28 -0500 (EST)
From: Rusty Wickell <twickell@clio.dlib.indiana.edu>
Subject: Re: [linux-lvm] kernel oops. 
Message-ID: <Pine.A41.4.20.9911231147080.59896-100000@clio.dlib.indiana.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


I am unsure which driver redhat 6.1 is using for ips. I guess I'll just
have to 1.0  and see if I notice a difference. I'm glad somebody got this
working with the same configuration, it gives me hope. :)

It acts like it is a version before the they patched a kernel oops bug
that is noted in the ips.c file.

Thanks,
Rusty


On Fri, 19 Nov 1999, Matthias G. Eckermann wrote:

> Hi all out there,
> 
> On Fri, Nov 19, 1999 at 04:35:25PM -0500, Rusty Wickell wrote:
> > 
> > I am installing lvm on a netfinity 5000 using the IBM ServeRAID card.
> 
> What release of IPS-driver do You use? 1.0? (this is fine).
> We are running LVM 0.7 on a NetFinitiy 5000-20 with ServeRAID 
> for about 6 weeks without any problems.
> 
> > I have set up a logical paritition with hardware RAID5 that is seen by linux
> > as /dev/sdb . I was able to pvcreate,vgcreate fine.
> 
> Mh, hopefully You set up real partitions before using pvcreate!?
> That means: the PV should be on /dev/sdb1, not on /dev/sdb!
> If not, you do have a real problem :-(#)
> 
> > But when I went to lvcreate -L5000 -nreallv realvg. It gave the kernel
> > ooops. 'Got lvm request?' and just hung there. 
> 
> The LVM-kernel driver says:
> 
> /*
>  * this one never should be called...
>  */
> static void lvm_dummy_device_request(void)
> {
>         printk(KERN_EMERG
>                "%s -- oops, got lvm request?\n", lvm_name);
>         return;
> }
> 
> 
> Well, I did not check, but I think, switches and parameters
> should be separated by space, i.e.:
> 	lvcreate -L 5000 -n reallv realvg
>  
> > Is there something I should know about putting this on top of a hardware
> > raid5 device. I don't think it should matter since this is hidden from the
> > os, the os only sees the sdb1 device for use with lvm. 
> 
> Hope, these hints are helpful
> 
> best regards
> 		Matthias Eckermann
> 
> -- 
> Matthias Eckermann <mge@suse.de>  mobile +49-179-2949448   |  errare
> SuSE Muenchen GmbH, Stahlgruberring 28, D-81829 Muenchen   |  humanum
> http://www.suse.de/                 http://www.suse.com/   |  est
> 
> 
