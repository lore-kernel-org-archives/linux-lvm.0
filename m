Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Fri, 9 Feb 2001 09:24:20 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] vgscan ?
Message-ID: <20010209092420.A790@66bassett.freeserve.co.uk>
References: <006d01c09269$79b4fe60$56dc10c3@tal.org>
Mime-Version: 1.0
In-Reply-To: <006d01c09269$79b4fe60$56dc10c3@tal.org>; from milang@tal.org on Fri, Feb 09, 2001 at 09:25:25AM +0200
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

On Fri, Feb 09, 2001 at 09:25:25AM +0200, Kaj-Michael Lang wrote:
> Everytime I run vgscan I get this:
> vgscan -- WARNING: you may not have an actual VGDA backup of your volume
> groups
> 
> Everything works ok, but is that important ?

This is a slightly misleading message that has been changed in recent
releases to:

vgscan -- WARNING: This program does not do a VGDA backup of your volume group

- Joe

> 
> Kaj-Michael Lang
> milang@tal.org
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
