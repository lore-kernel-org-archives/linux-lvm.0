Return-Path: <riel@conectiva.com.br>
Date: Tue, 6 Feb 2001 18:09:15 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot.
In-Reply-To: <20010206132240.E3376@sistina.com>
Message-ID: <Pine.LNX.4.21.0102061806370.1535-100000@duckman.distro.conectiva>
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

On Tue, 6 Feb 2001, AJ Lewis wrote:

> The problem with your bug report on Bugzilla is that it is
> confusing.  You added to a bug that complained about vgscan
> seg-faulting.  That bug is obviously fixed. 

It still segfaults ... ;)

> The problem now is that vgscan no longer finds proper data in
> the volume group.  This should be posted as a separate bug
> report, not tacked onto the end of the old one.

It's still vg_read_with_pv_and_le() that's spitting out
errors and causing vgscan to segfault. The error I am
seeing here hasn't changed in the last month...

regards,

Rik
--
Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml

Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
