From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] Can not boot: unable to mount root fs:
Message-ID: <20030902224216.GB9145@DUK2.13thfloor.at>
References: <3F54CEFE.2080203@redshift.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F54CEFE.2080203@redshift.com>
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
Date: Tue Sep  2 17:43:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Samuel A. Rogers" <srogers@redshift.com>
Cc: linux-lvm@sistina.com

On Tue, Sep 02, 2003 at 10:10:22AM -0700, Samuel A. Rogers wrote:
> So far I can not compile and boot any kernel from 2.4.19 - 2.4.21. I get 
> the below error message:
> 
> VFS: cannot open device 3a:00
> kernel panic: VFS: unable to mount root fs 3a:00

send some more information, like a complete
bootup log, your boot loader and your kernel
configuration ...

best,
Herbert

> I took this from an archive message and it should be very close to the 
> message I get except for the device number. I think mine says 1a:00 as I am 
> only using ide and not scsi. The system locks up and I have to manually 
> press the reset button to reboot.
> 
> I have checked the archives but could not find a solution.
> 
> Also the kernels I get from Redhat can boot just fine, but they have turned 
> off my sound card so I need to regen the kernel. I have tried to get ahold 
> of Redhat by phone, e-mail and newsgroup but no reply.
> 
> Regards,
> 
> 	Sam Rogers.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
