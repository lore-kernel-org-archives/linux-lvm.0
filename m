From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] Insufficient allocatable extents suitable for striping for logical volume
Message-ID: <20031201194911.GA4846@localhost>
References: <34504.192.168.0.2.1069892769.squirrel@meuh.dyndns.org> <20031128095658.GA2263@tykepenguin.com> <35752.192.168.0.2.1070237300.squirrel@meuh.dyndns.org> <20031201010902.L16901@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031201010902.L16901@uk.sistina.com>
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
Date: Mon Dec  1 13:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Monday, 01 December 2003, at 01:09:02 +0000,
Alasdair G Kergon wrote:

> Otherwise forget the striping, and create or extend LVs on the other
> disk - LVM2 will let you specify a different number of stripes
> when you extend an LV (e.g. lvextend -i1).
>  
Any idea about when "pvmove" for linux kernels 2.6.x could be ready for
wider testing ?

Greetings.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.6.0-test10-mm1)
