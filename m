Return-Path: <riel@conectiva.com.br>
Date: Mon, 26 Feb 2001 18:38:46 -0300 (BRST)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
In-Reply-To: <3A9AC4B7.FFA4C0B4@ida.xs4all.nl>
Message-ID: <Pine.LNX.4.33.0102261837430.5502-100000@duckman.distro.conectiva>
MIME-Version: 1.0
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
To: linux-lvm@sistina.com

On Mon, 26 Feb 2001, Jorg de Jong wrote:

> here are my stats... (be your owen judge....)

> [root] /root > time dd if=/dev/hde of=/dev/null count=100000
> 100000+0 records in
> 100000+0 records out
> 0.200u 1.050s 0:03.95 31.6%	0+0k 0+0io 116pf+0w
>
> [root] /root > time dd if=/dev/vg00/vm of=/dev/null count=100000
> 100000+0 records in
> 100000+0 records out
> 0.160u 0.860s 0:02.92 34.9%	0+0k 0+0io 116pf+0w

Interesting, so LVM actually takes a full second LESS to
read in the same data ...

Maybe LVM does some device-level readahead to speed things
up ?

regards,

Rik
--
Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml

Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
