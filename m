From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Recovering a volume after OS upgrade (lost /etc/lvm*)
Message-ID: <20011119090606.A23006@colombina.comedia.it>
References: <20011119032207.97984.qmail@web12306.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011119032207.97984.qmail@web12306.mail.yahoo.com>; from thelars@yahoo.com on Sun, Nov 18, 2001 at 07:22:07PM -0800
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
Date: Mon Nov 19 02:04:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Nov 18, 2001 at 07:22:07PM -0800, Lars Kellogg-Stedman wrote:
> I just upgraded a system to RedHat 7.2 (+ XFS from SGI) (lvm-1.0.1RC4),
> and I'm trying to mount a LVM-based logical volume created using LVM
> 0.9mumble.  The volume group consisted of a single PV on opt of a
> software RAID5 device.
> 
can you please provide the output of lvmdiskscan?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
