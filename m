From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] vgcreate on 1.5TB volume
Message-ID: <20021014222050.GA1773@localhost>
References: <1034629471.29780.58.camel@UberGeek.coremetrics.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1034629471.29780.58.camel@UberGeek.coremetrics.com>
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
Date: Mon Oct 14 17:26:42 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Monday, 14 October 2002, at 16:04:32 -0500,
Austin Gonyou wrote:

> I want to get as much of this volume useable as possible in one LV. (if
> not all, I thought vgcreate -Ay -s8M would work, but I get 512MB LV max
> message)
> 
A default physical extent (PE) size of 4 MB when creating a VG gives you
a maximun LV size of 65536*4 MB = 256 GB. If you increase your PE size
by a factor of 16 (any factor multiple of two should work) you get a
maximun LV size of 16 times 256 GB, that is, 4 TB.

Current unpatched kernels for 32-bit architectures have a hard limit at
around 2 TB, so maybe you can even try with a PE size of 8 MB. The only
apparent drawback of a larger PE is LV sizes get rounded to the nearest
PE-size boundary, so you can "waste" up to PE MB for each LV.

Hope this helps (and is correct ;-)

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.18-586tsc)
