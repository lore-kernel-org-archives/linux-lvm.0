Date: Tue, 2 Oct 2001 20:18:17 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] how to upgrade from rh70 to rh71
Message-ID: <20011002201817.C17281@colombina.comedia.it>
References: <3BB94405.AA906FBD@americasm01.nt.com> <20011002005304.N3600@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011002005304.N3600@pc.ilinx>; from lvm@interlinx.bc.ca on Tue, Oct 02, 2001 at 12:53:04AM -0400
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Oct 02, 2001 at 12:53:04AM -0400, Brian J. Murrell wrote:
> On Mon, Oct 01, 2001 at 11:35:17PM -0500, Joe Harvell wrote:
> > Hmm:
> > 
> > I never really thought about this when I decided to put all my
> > filesystems on LVM logical volumes; but how am I going to be able to
> > upgrade to RedHat 7.1?
> 
mount your rh71 cd and do
rpm -Ivh /mnt/cdrom/RedHat/RPMS/kernel-2.4.2-2.ix86.rpm
(so it will not upgrade it)
then rpm -Fvh /mnt/cdrom/RedHat/RPMS/*rpm

(speaking of mandrake)
> mounted on, etc.  The only thing they don't do yet is support root on
> an LV -- I am working on that problem when time permits.  Since they
> just released 8.1 I hope to have root on LVs in their next release.
i will add it at least to mkinitrd, since i am switching my main
system to mdk81, at the moment i am busy rebuilding everything with
athlon optimizations

i also had problem with lvm over raid with the installer.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
