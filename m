From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] summary of what I need to do to mount snapshot on XFS
Message-Id: <20020109130259.GC744@tykepenguin.com>
References: <1010503449.28039.5.camel@cali.nesnahhouse.com>
    <E16OHUh-0004tv-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16OHUh-0004tv-00@hermes.sistina.com>
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
Date: Wed Jan  9 07:04:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 09, 2002 at 10:06:04PM +1000, Adrian Head wrote:
> The basic concept is you create a snapshot LV
> lvcreate -L1G -s -n snap /dev/vg/lv1
> 
> This will create a 1G snapshot logical volume called snap for the original 
> logical volume /dev/vg/lv1
> 
> If this has completed successfully then you can mount it.
> 
> mount -t xfs -o nouuid /dev/vg/snap /mnt/snapshot

You may also need -o norecovery too.

patrick
