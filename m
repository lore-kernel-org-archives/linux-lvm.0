From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 13 Sep 2001 14:39:19 -0600
Subject: Re: [linux-lvm] changing LE / PE table
Message-ID: <20010913143919.M1541@turbolinux.com>
References: <3636.213.191.82.129.1000409919.squirrel@hactar.dnsalias.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3636.213.191.82.129.1000409919.squirrel@hactar.dnsalias.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sep 13, 2001  21:38 +0200, Julian Glashoff wrote:
> As I already said, my volume group is not accessible because of a crash
> while trying to extend a logical volume. 'vgscan' says 'only found 768 of
> 769 LEs for LV /dev/vg00/lvol1' and does not find my volume group.
> I have not been able to restore the backups with _any_ version of LVM.
> So now I am wondering if it is possible to change the 'LE' table while the
> volume group is offline.

Please read my description posted a couple of days ago to fix a similar
problem (subject: only 626 of 625 PEs available).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
