From: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Subject: RE: [linux-lvm] More strangeness
Date: Wed, 10 Oct 2001 06:18:24 -0400
Message-ID: <000c01c15174$e552f580$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011009215612.K6348@turbolinux.com>
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
To: linux-lvm@sistina.com

No official patch for ext3 and 2.4.10?!  Can I run an older kernel
version?  2.4.8 or 9 maybe?  Will that run ext3 and lvmtools 1.0.1rc4?

This is going back to a comment I made earlier about asking for a stable
version of LVM/kernel to use.  Everyone said 1.0.1rc4/2.4.10 would be
fine (but I didn't mention ext3, because I didn't think it was a
factor).

Advice?

> -----Original Message-----
> From: linux-lvm-admin@sistina.com 
> [mailto:linux-lvm-admin@sistina.com] On Behalf Of Andreas Dilger
> Sent: October 9, 2001 11:56 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] More strangeness
> 
> 
> On Oct 09, 2001  23:31 -0400, Jason A. Lixfeld wrote:
> > Oct  9 22:26:36 hit0day kernel: hdg: read_intr: error=0x10 { 
> > SectorIdNotFound }, LBAsect=239992834, sector=2 Oct  9 22:26:36 
> > hit0day kernel: hdg: read_intr: status=0x59 { DriveReady 
> SeekComplete 
> > DataRequest Error } Oct  9 22:26:36 hit0day kernel: hdg: read_intr: 
> > error=0x10 { SectorIdNotFound }, LBAsect=239992834, sector=2
> > Oct  9 22:26:36 hit0day kernel: hdg: read_intr: status=0x59 
> { DriveReady
> > SeekComplete DataRequest Error }
> > Oct  9 22:26:36 hit0day kernel: hdg: read_intr: error=0x10 {
> > SectorIdNotFound }, LBAsect=239992834, sector=2
> > Oct  9 22:26:36 hit0day sshd: Starting sshd:
> > Oct  9 22:26:36 hit0day kernel: hdg: read_intr: status=0x59 
> { DriveReady
> > SeekComplete DataRequest Error }
> > Oct  9 22:26:36 hit0day kernel: hdg: read_intr: error=0x10 {
> > SectorIdNotFound }, LBAsect=239992834, sector=2
> > Oct  9 22:26:36 hit0day kernel: ide3: reset: success
> > <various hard drive errors for ALL drives (/dev/hde /dev/hdg AND
> > /dev/hdi) in LVM test continue for a couple of pages>
> 
> There is another user with similar problems with SCSI disks.  
> With LVM on, it causes disk errors, but with LVM off (or raw 
> disk access) all is well.  It must be something in the 
> low-level LVM kernel code which is going wrong.
> 
> The above looks like LVM doing wrong math - LBAsect=239992834 
> is 119996417 kiB = 117184 MiB which is larger than hdg (61GB 
> or so). Do you have similar problems with ext2 and/or reiserfs?
> 
> Could you try using an older version of the LVM kernel code 
> to see if the problem exists there as well?  Running ext3 on 
> 2.4.10 is a bit on the risky side, since there is no 
> "official" patch for it.
> 
> You could try enabling LVM DEBUG_MAP (don't log to an LVM 
> device!!!) to see what it is doing when it gets these errors. 
>  You could also try enabling the JBD buffer debugging to get 
> additional info.
> 
> Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound 
> of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/             
>   -- Dogbert
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com 
> http://lists.sistina.com/mailman/listinfo/linu> x-lvm
> read the 
> LVM HOW-TO at 
> http://www.sistina.com/lvm/Pages/howto.html
> 
