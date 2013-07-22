Date: Mon, 22 Jul 2013 06:57:42 -0400
From: Kumar amit mehta <gmate.amit@gmail.com>
Message-ID: <20130722105712.GA1570@gmail.com>
References: <20130722051502.GA5685@gmail.com>
 <51ED2268.7030702@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51ED2268.7030702@redhat.com>
Subject: Re: [linux-lvm] lvcreate --thin gives "unknown segment type" error
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@redhat.com

On Mon, Jul 22, 2013 at 02:15:36PM +0200, Zdenek Kabelac wrote:
> configure --with-thin=internal
> 
> (and you will likely miss  '--enable-udev_sync'
Thank you, it worked!

However, It seems that "discards" behavior for thin pool is not
supported on RHEL 6.4. Please confirm. 
# ./configure --with-thin=internal --enable-debug

# make; make install

# lvcreate --discards passdown -L 1G -T thinvg1/thinlv1
  Logical volume "thinlv1" created

# lvs -o +devices|grep -i thinlv1
  thinlv1       thinvg1       twi-a-tz-   1.00g               0.00
thinlv1_tdata(0)

# dmesg
device-mapper: thin: Data device (dm-3) discard unsupported: Disabling
discard passdown.

<snip>
        if (reason) {
                DMWARN("Data device (%s) %s: Disabling discard
passdown.", bdevname(data_bdev, buf), reason);
                pt->adjusted_pf.discard_passdown = false;
        } 
<snip>

Seems that we'll reach here if QUEUE_FLAG_DISCARD flag in the request
queue is not set.

!!amit
