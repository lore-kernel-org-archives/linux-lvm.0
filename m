From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] root on LVM error message
Message-ID: <20031112084907.GA2169@tykepenguin.com>
References: <20031111211146.5e619f90.jan@rhebergen.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031111211146.5e619f90.jan@rhebergen.net>
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
Date: Wed Nov 12 02:50:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 11, 2003 at 09:11:46PM +0100, Jan Rhebergen wrote:
> Hi there,
> 
> Trying to construct a Debian (Sarge) root-on-LVM system I get the following error message:
> 
>    lvmiopversion -- Exec of vgscan failed
> 
>    lvmiopversion: No such file or directory
> 
> does this indicate lvm-mod was not loaded or what?

It could do. Generally it probably means that lvmiopversion could not determine
which version of lvm (1 or 2) you have. This could be caused by the module not
being loaded.

There was also a bug in older Debian packages that caused this problem so it's
worth making sure that you have the latest version:

lvm-common: 1.5.9.3
lvm10:      1:1.0.7-8

Both of which I think are in "testing" now.
-- 

patrick
