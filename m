Date: Fri, 19 Nov 1999 23:58:40 +0100
From: "Matthias G. Eckermann" <mge@suse.de>
Subject: Re: [linux-lvm] kernel oops.
Message-ID: <19991119235840.A11444@gruyere.muc.suse.de>
References: <Pine.A32.3.94.991119162848.17956A-100000@clio.dlib.indiana.edu>
Mime-Version: 1.0
In-Reply-To: <Pine.A32.3.94.991119162848.17956A-100000@clio.dlib.indiana.edu>; from Rusty Wickell on Fri, Nov 19, 1999 at 04:35:25PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com
Cc: Rusty Wickell <twickell@clio.dlib.indiana.edu>

Hi all out there,

On Fri, Nov 19, 1999 at 04:35:25PM -0500, Rusty Wickell wrote:
> 
> I am installing lvm on a netfinity 5000 using the IBM ServeRAID card.

What release of IPS-driver do You use? 1.0? (this is fine).
We are running LVM 0.7 on a NetFinitiy 5000-20 with ServeRAID 
for about 6 weeks without any problems.

> I have set up a logical paritition with hardware RAID5 that is seen by linux
> as /dev/sdb . I was able to pvcreate,vgcreate fine.

Mh, hopefully You set up real partitions before using pvcreate!?
That means: the PV should be on /dev/sdb1, not on /dev/sdb!
If not, you do have a real problem :-(#)

> But when I went to lvcreate -L5000 -nreallv realvg. It gave the kernel
> ooops. 'Got lvm request?' and just hung there. 

The LVM-kernel driver says:

/*
 * this one never should be called...
 */
static void lvm_dummy_device_request(void)
{
        printk(KERN_EMERG
               "%s -- oops, got lvm request?\n", lvm_name);
        return;
}


Well, I did not check, but I think, switches and parameters
should be separated by space, i.e.:
	lvcreate -L 5000 -n reallv realvg
 
> Is there something I should know about putting this on top of a hardware
> raid5 device. I don't think it should matter since this is hidden from the
> os, the os only sees the sdb1 device for use with lvm. 

Hope, these hints are helpful

best regards
		Matthias Eckermann

-- 
Matthias Eckermann <mge@suse.de>  mobile +49-179-2949448   |  errare
SuSE Muenchen GmbH, Stahlgruberring 28, D-81829 Muenchen   |  humanum
http://www.suse.de/                 http://www.suse.com/   |  est
