From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] error in mounitng snapshot LVs
Message-Id: <20020206134726.GC1076@tykepenguin.com>
References: <20011221084531.A22947@lsc.hu>
    <Pine.LNX.4.43.0202060830060.24753-100000@anubhav.lan.deeproot.co.in>
    <20020205233335.I2928@lynx.turbolabs.com>
    <E16YPmA-0002pD-00@arwen.dev33.cvf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16YPmA-0002pD-00@arwen.dev33.cvf>
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
Date: Wed Feb  6 07:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Feb 06, 2002 at 11:58:06AM +0100, Pierrick PONS wrote:
> 
> > You need the "VFS-lock" patch, from the LVM CVS repository.
> > 
> > Cheers, Andreas
> > --
> > Andreas Dilger
> > http://sourceforge.net/projects/ext2resize/
> > http://www-mddsp.enel.ucalgary.ca/People/adilger/
> > 
> >
> 
> I'm under 2.4.17, which patch do I have to get to use snapshot ? The 
> linux-2.4.11-VFS-lock.patch or linux-2.4.18-VFS-lock.patch ?
> 
> Can I use whatever file system I want for snapshots ?

Use the 2.4.11 patch for kernel 2.4.17

Without the patch only (I think) ext2 will work with snapshots, the journalling
filesystems need the VFS patch.

patrick
