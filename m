From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm2 pb on hppa-linux
Message-ID: <20030806062934.GC720@tykepenguin.com>
References: <3F2E2C77000006C7@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F2E2C77000006C7@ocpmta2.freegates.net>
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
Date: Wed Aug  6 01:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Aug 05, 2003 at 05:57:10PM +0200, Joel Soete wrote:
> Hi all,
> 
> Since the announce of lvm2 I used succefuly lvm tools (also with evms tools
> before 1.9 ie evms-1.2.1) on my linux hppa box runing a last updated linux-2.4.21-pa8
> (+ a very small hack to use generic_ffs()).
> 
> Now I try to install lvm2 and dm1.
> 
> I so recover last lvm-1.0.7. I configure it and build PATCHES which I apply
> against kernel (without VFS-lock). Then I reboot it and install tools:
> _no pb_ :-)


I've had problems with O_DIRECT on hppa architectures which cause LVM2 to fail.

the workaround is to add the lines:


#undef O_DIRECT
#define O_DIRECT 0


After the batch of ifdefs in lib/device/dev-io.c

-- 

patrick
