Subject: Re: [linux-lvm] summary of what I need to do to mount snapshot on XFS
From: Jeremy Hansen <jeremy@troubletext.com>
In-Reply-To: <20020109130259.GC744@tykepenguin.com>
References: <1010503449.28039.5.camel@cali.nesnahhouse.com>
    <E16OHUh-0004tv-00@hermes.sistina.com>
    <20020109130259.GC744@tykepenguin.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1010607611.15375.24.camel@jeremy-linux.intranet.qualys.com>
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
Date: Wed Jan  9 14:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 2002-01-09 at 05:02, Patrick Caulfield wrote:
> On Wed, Jan 09, 2002 at 10:06:04PM +1000, Adrian Head wrote:
> > The basic concept is you create a snapshot LV
> > lvcreate -L1G -s -n snap /dev/vg/lv1
> > 
> > This will create a 1G snapshot logical volume called snap for the original 
> > logical volume /dev/vg/lv1
> > 
> > If this has completed successfully then you can mount it.
> > 
> > mount -t xfs -o nouuid /dev/vg/snap /mnt/snapshot
> 
> You may also need -o norecovery too.

Ahh, it looks as if this did the trick.  I was able to mount it!

-jeremy
 
> patrick
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
