From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] Can not boot: unable to mount root fs:
Message-ID: <20030903191745.GA3717@DUK2.13thfloor.at>
References: <3F54CEFE.2080203@redshift.com> <20030902224216.GB9145@DUK2.13thfloor.at> <3F5626D7.3070405@redshift.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F5626D7.3070405@redshift.com>
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
Date: Wed Sep  3 14:18:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Samuel A. Rogers" <srogers@redshift.com>
Cc: linux-lvm@sistina.com

On Wed, Sep 03, 2003 at 10:37:27AM -0700, Samuel A. Rogers wrote:
> 	root (hd0,0)
> 	kernel /vmlinuz-2.4.21 ro root=/dev/Volume00/LogVol00
> 	initrd /initrd-2.4.21.img
> title Red Hat Linux (2.4.20-20.9)
> 	root (hd0,0)
> 	kernel /vmlinuz-2.4.20-20.9 ro root=/dev/Volume00/LogVol00
> 	initrd /initrd-2.4.20-20.9.img
> title Red Hat Linux (2.4.20-19.9)

aha, now we are getting closer, you are obsviously
using some LVM (volume manager) for your devices, and
especially for your root device ...

have you (re) created the initrd for your new kernel?
you'll probably need to do some vgscan/lvscan in the
initial ram disk ... so this is important ...

HTH,
Herbert
