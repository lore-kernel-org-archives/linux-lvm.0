From: Johan Ur Riise <riise@rsc.no>
Subject: Re: [linux-lvm] How to mount volumes during boot
Message-ID: <20011023215314.A16387@egg.topp.dyndns.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8BFE9B4949BB4346A146F5231AEF1B87F3D8@CX975884-A.mdmiller.com>
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
Date: Tue Oct 23 14:52:04 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 22, 2001 at 11:18:29AM -0500, Mitchell D. Miller wrote:
> I am running Red Hat 7.1 (with 2.4.12 kernel) and LVM 1.0.1-rc4.  I read
> the documentation on Sistina's website about boot time scripts, but the
> info there seems to deal only with getting LVM loaded at boot time.  
> 
> I'm still uncertain how I should configure my system so the volumes I
> have created (three of them so far) get mounted during boot.  I tried
> modifying my fstab file, but the system didn't boot right after.  It
> stopped, complaining that one of the devices couldn't be mounted.  Is
> this even the right place to configure LVM volumes to be mounted?

Changing fstab should be all right, just make shure you run vgchange -a y
early in the startup scripts (before the mounting takes place).
This should work for all filesystems except root.

-- 
Johan Ur Riise
90 15 77 78
