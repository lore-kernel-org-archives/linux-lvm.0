Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 8 May 2001 10:10:23 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] typo in CVS: LVM/kernel/lvm.c
Message-ID: <20010508101023.F508@tykepenguin.com>
References: <Pine.LNX.4.32.0105052321020.24489-100000@falka.mfa.kfki.hu> <20010506101133.A642@66bassett.freeserve.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010506101133.A642@66bassett.freeserve.co.uk>; from thornber@btconnect.com on Sun, May 06, 2001 at 10:11:33AM +0100
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

On Sun, May 06, 2001 at 10:11:33AM +0100, Joe Thornber wrote:
> 
> lvm.c revision 1.12
> -------------------
> 
> Patrick, you correctly fix most of the remaining mistakes apart from
> the version number.  But what are all the other code changes that have
> slipped in ?  They aren't mentioned in the checkin message, are they
> meant to be there ?

Ah, looked at this properly now I'm "at work" again. This is the fix for the
reading of userspace pointers reported by the S/390 guy from IBM. It's not the
patch he posted but IMHO a slightly neater one.

To be quite honest it wasn't meant to go in yet (I asked on the list for him to
test it but have had no reply), that was an oversight. But now it is in it's
probably not worth removing unless we hear from anyone that it still doesn't
work on S/390. It certainly works fine on my intel (well, it would really) 
and SPARC machines.

patrick
