Subject: Re: [linux-lvm] Dual Boot with LVM
From: Jord Tanner <jord@indygecko.com>
In-Reply-To: <200312171234.34785.mailing-oit@tttech.com>
References: <200312111402.11063.mailing-oit@tttech.com>
	 <200312171234.34785.mailing-oit@tttech.com>
Message-Id: <1071670898.13130.14.camel@gecko.indygecko.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Dec 17 08:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

To get around the devfs/no devfs problem I went with EVMS and
device-mapper in Gentoo (with devfs), and its been running sweet ever
since. EVMS runs in LVM compatibility mode, so I can work with the LVs
in both RedHat and Gentoo.

On Wed, 2003-12-17 at 03:34, Christoph Resch wrote:
> Hi Jord,
> 
> i can see the same behavior on my LVM-Installation, though i dont dual-boot. i 
> get this strange situation after preparing for disaster-recovery with 
> mondo-rescue .. since then my first PV is always inactive, but i can boot 
> from it and work normally ... 
> 
> did you found something ? .. maybe a lvm-version problem -- on debian i use 
> lvm-common	1.5.9.3
> lvm10 		1.0.7-8
> 
> thanks for reply
> 
> -c-
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Jord Tanner <jord@indygecko.com>
