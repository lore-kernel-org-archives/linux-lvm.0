Subject: Re: [linux-lvm] xfs quota on lvm
From: Christophe Zwecker <doc@zwecker.de>
In-Reply-To: <20020116181545.E30220@wobbly.melbourne.sgi.com>
References: <1011111148.3294.8.camel@fry.sysctl-office.de>
    <20020116181545.E30220@wobbly.melbourne.sgi.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1011175583.3295.18.camel@fry.sysctl-office.de>
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
Date: Wed Jan 16 04:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 2002-01-16 at 08:15, Nathan Scott wrote:
> On Tue, Jan 15, 2002 at 05:12:28PM +0100, Christophe Zwecker wrote:
> > Hi,
> > 
> > Ive got alle volumes on linux RH with xfs and all except /  "lvmed".
> > 
> > I got quota enabled in kernel, xfs quota support too. Quota is enabled
> > at mount. However when I do eduota -u user, I get only to change numbers
> > on the nonlvm partition.
> > 
> > Is quota nonfunctional on lvm partitions ?
> > 
> 
> Should work fine.  What does "repquota -vug /dev/XXX" give you
> on the LVM devices when the filesystems are mounted?  (this'll
> tell you whether quota is enabled at all on these devices).
> If they are indeed enabled ("Accounting: ON; Enforcement: ON"
> will be in the output) then try "strace setquota ..." to try
> to diagnose further (look for quotactl syscalls).  setquota is
> better than edquota for diagnosis because its not interactive,
> but it interacts with the kernel in much the same way.


I get this: 

[root@bender /root]# repquota -vug /dev/bender/home 
Not all specified mountpoints are using quota.

I got it like this in fstab:
/dev/bender/home        /home                   xfs    
defaults,usrquota,grpquota	  1 2


/dev/sda2 works tho, its not lvm and as this in fstab:
/dev/sda2               /                       xfs    
defaults,usrquota,grpquota        1 1

while booting I can see this:
XFS mounting filesystem sd(8,2)
XFS: WARNING: quotacheck required on readonly filesystem.
XFS: write access will be enabled during mount.
XFS quotacheck sd(8,2): Please wait.
XFS quotacheck sd(8,2): Done.
VFS: Mounted root (xfs filesystem) readonly.
Freeing unused kernel memory: 316k freed
XFS mounting filesystem lvm(58,1)
XFS quotacheck lvm(58,1): Please wait.
XFS quotacheck lvm(58,1): Done.
XFS mounting filesystem lvm(58,2)
XFS quotacheck lvm(58,2): Please wait.
XFS quotacheck lvm(58,2): Done.
XFS mounting filesystem lvm(58,3)
XFS quotacheck lvm(58,3): Please wait.
XFS quotacheck lvm(58,3): Done.

any ideas ?

thx & best regards,

Christophe
