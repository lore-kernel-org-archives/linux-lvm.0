From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] vgcreate on 1.5TB volume
Message-ID: <20021014222531.GA1793@localhost>
References: <1034629471.29780.58.camel@UberGeek.coremetrics.com> <20021014222050.GA1773@localhost>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021014222050.GA1773@localhost>
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
Date: Mon Oct 14 17:44:33 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Tuesday, 15 October 2002, at 00:20:50 +0200,
Jos� Luis Domingo L�pez wrote:

> Current unpatched kernels for 32-bit architectures have a hard limit at
> around 2 TB, so maybe you can even try with a PE size of 8 MB. The only
> apparent drawback of a larger PE is LV sizes get rounded to the nearest
> PE-size boundary, so you can "waste" up to PE MB for each LV.
> 
Argh, my brain seems to have been lost somewhere between the two first
paragraphs of my earlier post. Instead of "...you can even try with a PE
size of 8 MB." I should have said "...you can even try with a PE size 8
times the size of the default (32 MB)."

So 65536*32 MB = 2 TB , just what I wanted to mean and was unable to
write in the previous post.

Sorry for the inconvenience.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.18-586tsc)
