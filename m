Return-Path: <riel@conectiva.com.br>
Date: Mon, 26 Feb 2001 18:41:37 -0300 (BRST)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
In-Reply-To: <m2snl1phy5.fsf@isnogud.escape.de>
Message-ID: <Pine.LNX.4.33.0102261839460.5502-100000@duckman.distro.conectiva>
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

On 26 Feb 2001, Urs Thuermann wrote:

>     isnogud:/root# time dd if=/dev/sda5 of=/dev/null count=100000
>     100000+0 records in
>     real    0m6.720s

>     isnogud:/root# time dd if=/dev/vg0/test of=/dev/null count=100000
>     100000+0 records in
>     real    0m41.851s

> When making an ext2 filesystem on /dev/sda5 or /dev/vg0/test
> respectivley, the performance of cp'ing, grep'ing all files and rm'ing
> all files, seems to be comparable.  But why is the performance of
> reading the block device with dd so bad?

Maybe dd is reading in 512 byte blocks on /dev/sda5 and
4096 bytes on /dev/vg0/test ?

(I'm not sure if it is, but these blocksizes are the
default blocksize on each device and you only told dd
to "read 100000 blocks" ... this ratio also explains
the time difference of 8 times)

regards,

Rik
--
Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml

Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
