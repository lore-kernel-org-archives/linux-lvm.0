From: Tom Dawes-Gamble <tmdg@avbrief.com>
Message-Id: <200005111750.RAA15892@lindbergh.avbrief.com>
Subject: Re: [linux-lvm] 2.2.15 Kernel LVM 0.8 vgscan -- invalid i/o proto
Date: Thu, 11 May 2000 17:50:50 +0000 (UTC)
In-Reply-To: <31A612FE6020D2119F6400A0C9B67EBB0381B0EF@FTHW901E> from "Franken Klaus" at May 11, 2000 06:01:41 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Cc: linux-lvm@msede.com

On Thu May 11 16:01:41 2000 Franken Klaus wrote:-
> 
> > -----Original Message-----
> > From: Tom Dawes-Gamble [mailto:tmdg@avbrief.com]
> > Sent: Thursday, May 11, 2000 5:39 PM
> > To: linux-lvm@msede.com
> > Subject: [linux-lvm] 2.2.15 Kernel LVM 0.8 vgscan -- invalid i/o
> > protocol version
> > 
> > So.  now I'm out of things to try I tought about using a 
> > 2.3.X kernel but 
> > I really don't want to use a beta kernel.
> > 
> > The distribution I'm using is RedHat 6.2 (Zoot).
> > 
> > So what should I try next.
> 
> You don't need a newer kernel. The format changed between <= 0.8 and 0.8final.
> You have to re-create your physical volumes and to re-compile the new lvm-utils.
> 
	
I did some more digging and found the 2.2.13 patch only gives you 

#define LVM_DRIVER_IOP_VERSION          5      

The 0.8final requires

#define LVM_DRIVER_IOP_VERSION          6

So I grabed lvm_0.8-pre02.10.1999.tar.gz

That gave me the lvm tools that matched the kernel  :-)

So now I have disk space to spare I will look at some of the 2.3.X patches 
and see if they go on to the 2.2.15 kernel :-)

Regards,
Tom.
-- 
Tom Dawes-Gamble				Email: tmdg@avbrief.com
