Subject: Re: [linux-lvm] LVM in a cluster
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <2F75AEE4E86FDE44BF97709D289BAA7C38E008@vega.voltaire.com>
References: <2F75AEE4E86FDE44BF97709D289BAA7C38E008@vega.voltaire.com>
Message-Id: <1067271751.29688.76.camel@david.internal.NorcrossGroup.com>
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
Date: Mon Oct 27 10:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sun, 2003-10-26 at 13:04, Dan Bar Dov wrote:
> Is it possible to define PVs/VGs/LVs on one system, and then using lvscan
> discover them all on another connected to the same storage?
> 
> Is it then possible to serve those LVs further to other computers, say via
> NFS, and then what about coherency between the two LVM servers?
> 
> We are wotking on a storage gateway - iscsi from one side, FC on the other.
> We are thinking on adding LVM functionality in there, but I have a feeling
> it'll make HA impossible.
> 
> Dan  
> 

I don't believe the above is officially supported, but it has been done
by some people on the Linux-HA list.  I've heard the Sistina will be
offering a commercial version of LVM 2 that does officially supports
clustered LVM.

Also, EVMS 2.x, a opensource alternative to LVM from IBM specifically
supports the above if you use the Linux-HA clustering solution, and
should be extendable to other clustering environments.

Both LVM 2 and EVMS 2 use DM as their core kernel component, so most of
the difference is in user space (which is totally different).  I believe
EVMS also offers a couple of DM targets that are not supported by LVM 2.

FYI: Whose iscsi implementation are you using.  Is it GPL?

Greg
-- 
Greg Freemyer
