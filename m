From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Cluster LVM
Message-Id: <20020227101949.M12832@lynx.adilger.int>
References: <3C7CC4F3.9DA76FC9@lmco.com>
    <200202271145.MAA11838@mailgate.sara.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200202271145.MAA11838@mailgate.sara.nl>; from r.post@sara.nl
    on Wed, Feb 27, 2002 at 12:45:05PM +0100
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
Date: Wed Feb 27 11:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Feb 27, 2002  12:45 +0100, Remco Post wrote:
> clusters all have one major problem to solve: split brain. Make sure that the 
> node manipulating the LV/VG does indeed have the right to do so, and doesn't 
> screw up everything for everybody. Maybe introduce a (LV/VG) master concept 
> into the VG, so as long as that is set, no other node in the cluster will 
> manipulate anything in the vg. (just some random rant, ignore if I'm talking 
> nonsense ;)

Having a single master is a _terrible_ idea, since this would mean that
if that node is down you are unable to change the VG until/if it is back
working again.

Rather use a DLM (as the other poster suggested) and a client needs to
get a lock on the VG in order to change anything.  You can start with
a lock per VG and one per shared PV not in a VG, and then go more fine
grained if you want (e.g. write lock on VG and specific LV being changed,
which does not block users of other LVs).  In the end, because you are
not changing a VG configuration very often, and it doesn't take very long
when you do (excluding pvmove), the big lock is probably enough.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
