Return-Path: <bluca@comedia.it>
Date: Wed, 18 Jul 2001 08:08:51 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] how to deactivate vg hosting root filesystem
Message-ID: <20010718080851.A3890@colombina.comedia.it>
References: <3B54F04E.4FEF132@americasm01.nt.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B54F04E.4FEF132@americasm01.nt.com>; from harvell@nortelnetworks.com on Tue, Jul 17, 2001 at 09:11:26PM -0500
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

On Tue, Jul 17, 2001 at 09:11:26PM -0500, Joe Harvell wrote:
> So I set up an initrd that starts raid and lvm before doing a pivot_root
> and execing init.  This has been working fine for a long time.
> 
> The only problem I have is that the only way I know of to free up the vg
> for deactivation is to make init exit, which panics the kernel.  How do
> I do this safely?
At the moment there is no need to deactivate the root VG.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
