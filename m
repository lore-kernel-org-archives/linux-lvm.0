Return-Path: <riel@conectiva.com.br>
Date: Sat, 21 Apr 2001 17:45:18 -0300 (BRST)
From: Rik van Riel <riel@conectiva.com.br>
In-Reply-To: <20010421015555.L805@mea-ext.zmailer.org>
Message-ID: <Pine.LNX.4.21.0104211743440.1685-100000@imladris.rielhome.conectiva>
MIME-Version: 1.0
Subject: [linux-lvm] Re: [repost] Announce: Linux-OpenLVM mailing list
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: Doug McNaught <doug@wireboard.com>, Miles Lane <miles@megapathdsl.net>, linux-kernel@vger.kernel.org, linux-openlvm@nl.linux.org, linux-lvm@sistina.com

On Sat, 21 Apr 2001, Matti Aarnio wrote:

>   If you are PERL speaker (or can at least comprehend perl's
>   m(atch) expressions), here is URL to info about it, plus
>   the actual live running filter-set:
> 
>     http://vger.kernel.org/majordomo-info.html
> 
>   Go to the end of the page, and you see link for the actual
>   filter code used at the VGER's Majordomo.

To get the filter set used by NL.linux.org:

cvs -d :pserver:cvs@nl.linux.org:/home/CVS login
password: cvs
cvs -d :pserver:cvs@nl.linux.org:/home/CVS checkout spamfilter

You can also use the regexps and the script in this CVS tree to
build your own majordomo.cf automatically whenever new regexps
get added.

regards,

Rik
--
Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com.br/
