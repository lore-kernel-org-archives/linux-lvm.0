Date: Tue, 22 Sep 2009 14:40:17 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problems at cross-compiling LVM2-2.02.52
Message-ID: <20090922134017.GP1210@agk-dp.fab.redhat.com>
References: <c9048c0a0909220516o23075a6h88111b4f42df3039@mail.gmail.com>
	<20090922124714.GM1210@agk-dp.fab.redhat.com>
	<4AB8CB49.2050409@gmail.com>
	<20090922131100.GN1210@agk-dp.fab.redhat.com>
	<4AB8CFB6.5090000@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4AB8CFB6.5090000@gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Taylor <pi00100100@gmail.com>
Cc: linux-lvm@redhat.com

On Tue, Sep 22, 2009 at 03:23:02PM +0200, John Taylor wrote:
> I hope it is clear now.

Well it works for me, in that it only gives me the rpl_malloc error, not
the path problem.  

I can see some potential bugs with srcdir in the Makefiles for example,
but can't work out how you would be hitting them with the command lines 
that have posted so far.

Alasdair
