From: Erik Rask <erik@strakt.com>
Subject: Re: [linux-lvm] Can not boot: unable to mount root fs:
In-Reply-To: <3F54CEFE.2080203@redshift.com>
Message-ID: <Pine.LNX.4.21.0309030824260.32688-100000@rife.strakt.com>
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
Date: Wed Sep  3 01:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 2 Sep 2003, Samuel A. Rogers wrote:

> So far I can not compile and boot any kernel from 2.4.19 - 2.4.21. I get the below error message:
> 
> VFS: cannot open device 3a:00
> kernel panic: VFS: unable to mount root fs 3a:00
> 
> I took this from an archive message and it should be very close to the message I get except for the 
> device number. I think mine says 1a:00 as I am only using ide and not scsi. The system locks up and 
> I have to manually press the reset button to reboot.
> 
> I have checked the archives but could not find a solution.
> 
> Also the kernels I get from Redhat can boot just fine, but they have turned off my sound card so I 
> need to regen the kernel. I have tried to get ahold of Redhat by phone, e-mail and newsgroup but no 
> reply.
> 
> Regards,
> 
> 	Sam Rogers.
> 

I do not know exactly how far this discussion has progressed, since I have
lost some mail recently and may have missed out. I apologize if my advice
has already been given and rejected.
I experienced the exact same problem when installing a devfs capable
kernel before installing the devfsd daemon. I use Debian, so I do not know
where or how to find devfsd with redhat/RPM. Try installing devfsd and
then rebooting one of the new kernels.
Best regards
-- 
Erik Rask, systems administrator @ AB Strakt
"There is no normal life. There's just life. So get on with it."
