Subject: Re: [linux-lvm] e2fsadm and snapshots?
From: Jim King <jrk@mipl.jpl.nasa.gov>
In-Reply-To: <20021031232551.GG23959@clusterfs.com>
References: <1036105045.10397.68.camel@theory.jpl.nasa.gov> 
	<20021031232551.GG23959@clusterfs.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1036112887.10402.88.camel@theory.jpl.nasa.gov>
Mime-Version: 1.0
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
Date: Thu Oct 31 19:09:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2002-10-31 at 15:25, Andreas Dilger wrote:
> The LVM snapshot is the whole filesystem (with only the parts that
> actually change being written to the snapshot LV) - no need to change
> the filesystem size at all.  All you need to change is the LV size.

OK -- so using lvextend I can extend it. But once it's extended, I can
no longer mount it. I get:

  mount: wrong fs type, bad option, bad superblock on
    /dev/data1/.mer_dev.hourly.3, or too many mounted file systems

Is there something I'm missing here? (ok -- obviously yes...)


-- 
------------------------------------------------------
Jim King
Multimission Image Processing Lab  (MIPL) Engineering Group
Science Data Processing Systems Section,  Jet Propulsion Lab
James.King@jpl.nasa.gov  
------------------------------------------------------
