From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Patching a kernel that already has VFS-lock
Message-ID: <20030313081020.GA1357@tykepenguin.com>
References: <8075D5C3061B9441944E137377645118012E9B@cinshrexc03.shermfin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8075D5C3061B9441944E137377645118012E9B@cinshrexc03.shermfin.com>
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
Date: Thu Mar 13 02:11:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 12, 2003 at 05:18:35PM -0500, Rechenberg, Andrew wrote:
> Good day,
> 
> I'm trying to upgrade my kernel from LVM 1.0.3 to 1.0.7.  My kernel with
> 1.0.3 already has the VFS lock pactch installed and all I want to do is
> upgrade the LVM code because my snapshots are misbehaving.  I should not
> have to re-patch to get the VFS-lock to work should I?
> 
> The reason I ask is because when I just patch the kernel with LVM 1.0.7
> and reboot all my VG's/LV's come up clean, and I can create snapshots
> but the snapshots do not mount.  I get the:
> 
> mount: wrong fs type, bad option, bad superblock on /dev/flux1/snap,
>        or too many mounted file systems
> 
> error which would indicate to me that the VFS lock is not working with
> my ext3 filesystem.  Does anyone have any ideas on what could be causing
> this problem?  
> 
> Red Hat kernel source RPM 2.4.18-26
> LVM 1.0.7 from the Sistina FTP site
> 


If you've managed to successfully patch LVM into the kernel (and it sounds like
you have), all that should be needed to enable VFS-Lock functionality is to
uncomment the line in lvm.c that reads:

/* #define LVM_VFS_ENHANCEMENT */


to be

#define LVM_VFS_ENHANCEMENT

and rebuild.

patrick
