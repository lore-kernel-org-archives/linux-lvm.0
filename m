From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Dual Boot with LVM
Message-ID: <20031201225129.GJ23702@percy.comedia.it>
References: <1070314787.10000.4.camel@gecko.indygecko.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1070314787.10000.4.camel@gecko.indygecko.com>
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
Date: Mon Dec  1 16:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 01, 2003 at 01:39:48PM -0800, Jord Tanner wrote:
>root@gecko root # pvscan
>pvscan -- reading all physical volumes (this may take a while...)
>pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part2" of VG
>"Volume00" [53.71 GB / 33.32 GB free]
>pvscan -- total: 1 [53.71 GB] / in use: 1 [53.71 GB] / in no VG: 0 [0]
>
uhm
redhat 9 does not use devfs,
gentoo does,
good luck :))
try removing devfs from gentoo kernel

no "devfs=nomount" won't do.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
