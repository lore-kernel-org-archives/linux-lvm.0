From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Devices seen twice - how does LVM handle ?
Message-ID: <20030910132010.GC10632@percy.comedia.it>
References: <20030910114840.13991.qmail@web42002.mail.yahoo.com> <E19x4eC-0008Oa-VB@server2.hostpoint.ch>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E19x4eC-0008Oa-VB@server2.hostpoint.ch>
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
Date: Wed Sep 10 08:21:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 10, 2003 at 03:04:25PM +0200, Markus Baertschi wrote:
>For reasons too complicate to explain here our SAN configuration is
>broken. The effect is that linux sees the san disks twice. The originally

>However, does LVM handles this situation (disks visible twice) nicely ?
does not seem broken to me if you have two hba.
lvm does not support multipath

>or should I continue to use my workaround (pull a fiber) to make sure
>the disks are visible only once ?
it is not a nice workaround.
>- Are there risks of corruption ?
i don't think so.
>- What happens if the path the LVM happens to use breaks, but the other
>is still up. Will LVM handle fail-over ?
lvm does not support multipath

at the moment your best chance is setting up an md multipath
and building your lvm over the md devices. be sure to use mdadm instead
of raidtools to manage the md.

i have this setup (2 hbas to same storage with lvm over md multipath) in
production, and it works fine.

another option could be if your hba driver handles multipath. i know
some qlogic boards do.

regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
