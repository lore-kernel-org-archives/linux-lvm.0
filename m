Return-Path: <root@srv.sistina.com>
Date: Wed, 30 May 2001 16:49:43 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: Help! Upgrade 2.2.18 -> 2.4.4 killed a PV
Message-ID: <20010530164943.A32434@sistina.com>
References: <20010529010628.E1971@jensbenecke.de> <20010529093436.A792@jensbenecke.de> <20010529211128.B27030@sistina.com> <20010529214021.A1594@jensbenecke.de> <20010530112809.C30938@sistina.com> <20010530092515.B8950@sistina.com>
Mime-Version: 1.0
In-Reply-To: <20010530092515.B8950@sistina.com>; from lewis@sistina.com on Wed, May 30, 2001 at 09:25:15AM -0500
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

AJ,

great! Thanks for the solution.

On Wed, May 30, 2001 at 09:25:15AM -0500, AJ Lewis wrote:
> Just an update on this:
> 
> Jens and I talked on IRC (irc.openprojects.net #lvm) about the problem.
> Turns out it was our old friend the missing UUID again.  We fixed it by
> manually adding the missing UUIDs in using a hexeditor on a copy of the
> metadata, then using dd to copy the metadata back onto the disk.  Nothing
> else seemed to work.

Likely because the backup contained the wrong uuid lists as well :-(

Heinz

> 
> Regards,
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-638-0500
> 1313 5th St SE, Suite 111              Fax:    612-638-0500
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)
> 
> -----Begin Obligatory Humorous Quote----------------------------------------
> Quitters never win, and winners never quit,
> but those who never quit AND never win are idiots.
> -----End Obligatory Humorous Quote------------------------------------------
