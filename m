From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] No Subject
Message-ID: <20040115074215.GB19923@percy.comedia.it>
References: <6413350.1074097638140.JavaMail.Administrator@atp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6413350.1074097638140.JavaMail.Administrator@atp>
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
Date: Thu Jan 15 08:54:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 14, 2004 at 08:27:18AM -0800, trylinux wrote:
>Activating logical volumes
>vgchange -- volume group "rootvg" successfully activated
>
>Mounting root filesystem
>mount: error 2 mounting ext3
>pivotroot: pivot_root(/sysroot,/sysroot/initrt) failed: 2
>umount /initrd/proc failed: 2
>Freeing unused kernel memory: 136k freed
>Kernel panic: No init found. Try passing init= option to kernel.
>
it is possible that initrd has hardcoded the device name for the root
fs? i do not know what exactly is the code in fedora's initrd.
try remaking the initrd (and be sure the fstab is correct before that)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
