From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] is devfs required?
Message-Id: <20020223132843.GA1747@colombina.comedia.it>
References: <20020221143602.F328@majestic.ukshells.co.uk>
    <20020222201251.GG30259@colombina.comedia.it>
    <20020222214037.A28086@majestic.ukshells.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020222214037.A28086@majestic.ukshells.co.uk>
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
Date: Sat Feb 23 07:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 22, 2002 at 09:40:37PM +0000, Vincent AE Scott wrote:
> errr, are you saying that it's not possible to switch between devfs and
> non-devfs, as soon as you use the former?
well, the issue is that the lvm device cache does not cope with
variyng device names, as happens when using devfs (i.e. you have both
/dev/scsi/host0/bus0/target0/lun0/part1
and
/dev/sda1
to reference the same partitin

the worst case is when you have devfs compiled in and not mounted,
so /proc/partitions holds the long device name, but /dev contains
only the short one.

> oh, i've just thought of one other thing, that maybe? caused a problem:
> i did create a LV and copied my entire /fs into it, then rebooted into
> it to see if it all worked.  havent used it since tho.
> 
> is it possible that the data in /etc/lvm* on the original and LVM copied
> partitions were not quite in sync with what was on disk?

the data in /etc/lvmtab.d can be recreated by using vgscan
that in /etc/lvmconf by vgcfgbackup

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
