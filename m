Return-Path: <dice@mfa.kfki.hu>
Date: Thu, 31 May 2001 18:08:50 +0200 (CEST)
From: Gergely Tamas <dice@mfa.kfki.hu>
Subject: Re: [linux-lvm] Severe bug in kernel-2.4.4 lvm
In-Reply-To: <20010531161155.A1352@66bassett.freeserve.co.uk>
Message-ID: <Pine.LNX.4.32.0105311801120.28366-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Thornber <thornber@btconnect.com>
Cc: linux-lvm@sistina.com, Tamas Gergely <dice@mfa.kfki.hu>

Hi!

 > > ps: just ask because Andrea has a patch with the comment
 > >     'it has some other tons of fixes' for lvm 0.9.1b7 on the
 > >     ftp.kernel.org.
 >
 > I presume he means that beta7 has tons of fixes for the vanilla
 > kernel.  I just had a look at his code and the differences are very
 > small compared to our CVS code (I haven't listed them all here):

Thanks.

Another question, is it safe to use LVM 0.9.1b7 on a production
server. Just thought about this because you are speaking about your CVS
version. And because of the postponing of release 1.0 after the kernel
inclusion.

Are there all nessesary patches listed in the appropriate fragments file?
Just ask because I saw you inserted some additional into the CVS version.

And as far as I remeber, there were some additional patches for the
snapshoot feature (needed to be patched manually against the kernel).

Can you tell me which one(s) these are?

Thanks in advance,
Gergely
