Date: Sat, 1 Sep 2001 00:32:41 -0500
From: ^chewie <chewie@wookimus.net>
Subject: Re: [linux-lvm] Debian apt-get link problem
Message-ID: <20010901003241.B1210@wookimus.net>
References: <20010827114957.A23458@dmcom.net> <20010830141259.E22755@dmcom.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010830141259.E22755@dmcom.net>; from wtopa@dmcom.net on Thu, Aug 30, 2001 at 02:12:59PM -0400
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 30, 2001 at 02:12:59PM -0400, Wayne Topa wrote:
> >   I just tried the link 
> > ( deb ftp://ftp.sistina.com/pub/LVM/binaries/debian unstable main )

I hate to state the obvious, but apt does not Debian make.  Try
manually downloading the *.deb files and installing them manually with
dpkg -i <pkg.deb>.

I've been out of the loop a little on the Debian LVM packages, but
I've got a few patches to hand in that might be useful.  Problem is
that my workstation is out of commission until I can find the time
next week to reassemble it.

Anyway, good luck!

-- 
Chad "^chewie" Walstrom <chewie@wookimus.net>
        http://wookimus.net/chewie
