Date: Wed, 27 Sep 2000 12:28:10 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] current lvm function questions
Message-ID: <20000927122810.C31723@gruyere.muc.suse.de>
References: <39D14B6C.4C9F6C26@us.oracle.com>
Mime-Version: 1.0
In-Reply-To: <39D14B6C.4C9F6C26@us.oracle.com>; from dbrower@us.oracle.com on Tue, Sep 26, 2000 at 06:20:44PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brower <dbrower@us.oracle.com>
Cc: linux-lvm@msede.com

On Tue, Sep 26, 2000 at 06:20:44PM -0700, David Brower wrote:
> Area 1:  Stable device naming.
> 
> Is there a way in Linux to get a stable name for a
> disk that survive reconfiguration and discovery 
> randomization?

Yes, there are programs to create SysV style LUN device nodes
after the SCSI scan.  Look for scsidev or scsidev2.

> It seems to me that lvm already slaps a label on the 
> disk when it does pvcreate.  What i'm not sure of is
> whether the label used is (a) globally unique and suitable
> for stable device naming, or (b) tied to the device it
> happened to be on at the time the pvcreate was issued.

LVM uses an UUID iirc. ext2 does too BTW (and newer mount even
supports mounting by UUID without lvm). An UUID aims to be globally unique.
 
> Can lvm volumes be accessed as raw devices?  If so, how?
> Is there /dev/rlvname?

Sure. Usually it is a /dev/VG/LVname though. Just bind a raw device
to them.

-Andi
