From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Linux 2.4.16+SMP+Ext3+LVM snapshots
Message-ID: <20011130084157.D15936@lynx.no>
References: <B45465FD9C23D21193E90000F8D0F3DF01790039@mailsrv.linkvest.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF01790039@mailsrv.linkvest.com>; from Jean-Eric.Cuendet@linkvest.com on Fri, Nov 30, 2001 at 08:24:20AM +0100
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
Date: Fri Nov 30 09:40:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Cc: linux-lvm@sistina.com

On Nov 30, 2001  08:24 +0100, Jean-Eric Cuendet wrote:
> > So I grabbed lvm 1.0.1 (released a couple days ago).  I 
> > patched the kernel 
> > with the new lvm and the VFS-lock patch for 2.4.11.  There 
> 
> Is VFS-lock patch necessary to run LVM? 
> I have LVM 1.0.1 on some of our servers without any problem, but what is
> the goal of this patch?

You only need it if you are making snapshots of journaled filesystems
(e.g. ext3, reiserfs, XFS).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
