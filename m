From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Insufficient allocatable extents suitable for striping for logical volume
Message-ID: <20031201010902.L16901@uk.sistina.com>
References: <34504.192.168.0.2.1069892769.squirrel@meuh.dyndns.org> <20031128095658.GA2263@tykepenguin.com> <35752.192.168.0.2.1070237300.squirrel@meuh.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35752.192.168.0.2.1070237300.squirrel@meuh.dyndns.org>; from cscm@meuh.dyndns.org on Mon, Dec 01, 2003 at 01:08:20AM +0100
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
Date: Sun Nov 30 19:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 01, 2003 at 01:08:20AM +0100, Nowicki Christophe wrote:
> >> System : Linux TuX 2.6.0-test9 #8 SMP Sun Nov 2 10:40:22 CET 2003 i686

>   Insufficient allocatable extents suitable for striping for logical
> volume lv_usr: 32 required
 
> How can I move one logical volume from /dev/hda5 to /dev/hdb5 ?
Using pvmove - but not supported on 2.6 kernels yet.

Otherwise forget the striping, and create or extend LVs on the other
disk - LVM2 will let you specify a different number of stripes
when you extend an LV (e.g. lvextend -i1).
 
Alasdair
