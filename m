Return-Path: <timshel@pobox.com>
Date: Sat, 9 Jun 2001 10:38:37 +1000
From: Timshel Knoll <timshel@pobox.com>
Message-ID: <20010609103837.A29022@knoll.ln>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010609004002.B3656@knoll.ln>
Subject: [linux-lvm] Re: pvmove failure ...
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

[Sorry, should have mentioned that I'm not subscribed to get mail from
 this list - I get enough mail already ;-) - please CC all replies to me]

> It appears from the attached file that you have also applied XFS patches
> into the kernel.  Which version of the XFS patches did you apply?  Has
> anyone else tried 'pvmove' with that combination of patches successfully?
> It's possible we're seeing some kind of conflict between the two.
>
> Also, in which order did you patch the kernel, and did you apply any other
> patches?

The first version I tried was a vanilla 2.4.3 with the default LVM in it
(version 0.9.1beta6?) and the XFS 1.0 patch. The last one I tried was
the CVS version of the XFS kernel (from SGI, 2.4.4, dated 15/05/2001)
patched with the CVS version of LVM ...

I'm going to try the latest CVS XFS patched with CVS LVM, but I've got
to wait for the CVS update (which takes ages over my 56K link) :-(

Everything else is working fine, just not pvmove :-(

Thanks,

Timshel

-- 
   Timshel Knoll <timshel@pobox.com>  for Debian email: <timshel@debian.org>
                Geomatics/Computer Science double degree, RMIT
      Debian GNU/Linux developer, see http://people.debian.org/~timshel/
                For GnuPG public key: finger timshel@debian.org
