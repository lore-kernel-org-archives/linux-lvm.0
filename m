Return-Path: <thornber@btconnect.com>
Date: Mon, 30 Jul 2001 15:50:30 +0100
Subject: Re: [linux-lvm] Changing partition names?
Message-ID: <20010730155030.A1004@btconnect.com>
References: <0GHA00192I321U@smtp07.iafrica.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0GHA00192I321U@smtp07.iafrica.com>; from tgs@iafrica.com on Mon, Jul 30, 2001 at 02:05:35PM +0000
From: Joe Thornber <thornber@btconnect.com>
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

On Mon, Jul 30, 2001 at 02:05:35PM +0000, Theo wrote:
> > 
> > Also, is there any way to point vgscan in the general direction of the
> > block devices where PVs are to be found?  It takes quite some time to scan
> > *everything* on my p75 :(
> > 
> 
> That would be real cool ! 
> 
> It takes a while on my 486 to scan everything.

This is also on the list.  The idea is to have a config file where you
can specify which devices can be scanned.

- Joe
