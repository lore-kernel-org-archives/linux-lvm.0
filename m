From: Pantaleimon <pantaleimon@home.no>
Subject: Re: [linux-lvm] I'm confused
References: <BDEMIPDEGABMNEFIHCPDEECAEEAA.bill+f.9sfuw6uo@tao-group.com>
In-Reply-To: <BDEMIPDEGABMNEFIHCPDEECAEEAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200212091512.49269.pantaleimon@home.no>
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
Date: Mon Dec  9 08:13:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Monday 09 December 2002 11:29, William Blunn wrote:
> > I think hardisk manufacturers use base 10, rather than base 2,
> > when they speak of "mega" and "giga", ie. mega = 1000K and not
> > 1024K. That means that a 120G hardisk is only 114.4G.
>
> No.
>
> You are right in that "mega = 1000K", but from your figure of 114.4, you
> still appear to have "K = 1024" and "G = 1024M", both of which are
> wrong.
>

I had G=1000, M=1000 and K=1024 which would give 120 x 10^6 x 1024 =114.4KiB. 
I stand corrected on the matter of me saying/implying K=1024.

I am glad to hear that symbols have been defined for the base 2 multipliers. I 
shall try to use them. I seem to remember reading somthing about it sometime 
ago. Didn't someone propose to use something like KK, MM and GG, too. When I 
tell some people that, even when it comes to computers, the multiplier "kilo" 
formally, if not in practice, means "x 1000" they just won't believe me.


> Hard disk manufacturers use SI defined multipliers, i.e. they use a
> documented standard.
>
>   K = 10^3
>   M = 10^6
>   G = 10^9
>
>   120 GB = 120 000 000 000 B
>
> Computer people have traditionally abused these symbols to mean
> multipliers with similar values, but based on powers of two.
>
> Symbols have been defined for these multipliers, but some people still
> haven't caught up to them.
>
>   Ki = 2^10 = 1024
>   Mi = 2^20 = 1048576
>   Gi = 2^30 = 1073741824
>
> So
>
>   120 GB ~= 111.8 GiB
>
> Interestingly, LVM1's vgdisplay incorrectly uses "GB" in its output
> where it should say "GiB".
>
> Bill
