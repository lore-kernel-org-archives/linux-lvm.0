Subject: Re: [linux-lvm] 2TB limit of Linux
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <E1AD2e7-0006Es-00@hermes.sistina.com>
References: <E1AD2e7-0006Es-00@hermes.sistina.com>
Message-Id: <1067033333.29688.40.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Fri Oct 24 17:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Fri, 2003-10-24 at 10:10, Deas, Jim wrote:
> Has any work been done to change the 2TB LV limit on i386 stuff up to
> 1PB? I am looking for a solution where I can combine several 2TB NFS
> shares to make volumes in the 10TB range for rich media content storage.
> Also are there any file systems for i386 that could handle this size if
> LVM could make them?
> 
> Regards,
> J. Deas
The below is XFS specific.  I don't know what the LVM 1.x or LVM 2.0/DM
limitations are.  I also don't know what the NFS limitations are.

I too am curious to know.

Anyway. if you can make 2+ TB volumes, XFS can handle them in theory,
but I have been seeing bug reports on the XFS list related to 2+ TB
filesystems.  I have not been following as closely I should.

XFS is generally considered a good choice for rich media content
storage.  I believe that was one of the main things it was designed for.

For i386 and 2.4.x kernel you need the LBD patch (Large Block Device)
and the XFS patch.  (I believe SuSE has both in their distro.)

For i386 and 2.6.0-test kernel, you just have to enable LBD and XFS via
"make config".  i.e. 2.6.0 has both of them in the vanilla kernel.

All 2+ TB testing I am aware of is being done on 2.6.0, but XFS is
supposed to support 2+ TB even on 2.4.x kernels.

Greg
-- 
Greg Freemyer
