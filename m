Subject: Re: [linux-lvm] vgscan errors with 1.0.3
Message-Id: <20020306214932.K9090@progsoc.uts.edu.au>
References: <20020306062354.D9090@progsoc.uts.edu.au>
    <20020306105859.C21935@sistina.com>
    <20020306212858.J9090@progsoc.uts.edu.au>
    <20020306113737.H21935@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020306113737.H21935@sistina.com>; from
    mauelshagen@sistina.com on Wed, Mar 06, 2002 at 11:37:37AM +0100
From: Anand Kumria <wildfire@progsoc.uts.edu.au>
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
Date: Wed Mar  6 04:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 06, 2002 at 11:37:37AM +0100, Heinz J . Mauelshagen wrote:
> 
> Could you add the bzipped tarball "vgda.tar.bz2" created with
> 
> for d in md0 hdg hde
> do
>    dd if=/dev/$d of=$d.vgda bs=1k count=4k
> done
> tar Icf vgda.tar.bz2 *.vgda
> 
> to that?

I've created this tarball and put it up as well.

<URL: http://www.progsoc.org/~wildfire/lvm/>

Thanks,
Anand

-- 
 `` We are shaped by our thoughts, we become what we think.
 When the mind is pure, joy follows like a shadow that never
 leaves. '' -- Buddha, The Dhammapada
