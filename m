Return-Path: <wish@dumain.com>
Message-ID: <20010821192307.2864.qmail@dumain.com>
From: wish-lvm@dumain.com
Subject: Re: [linux-lvm] Building outside source tree 
In-reply-to: Your message of "Tue, 21 Aug 2001 12:12:29 CDT."
             <20010821121229.A4661@sistina.com> 
Date: Tue, 21 Aug 2001 20:23:07 +0100
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
MIME-Version: 1.0
Content-Type: text; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> > The following patch allows building the lvm utilities in a=20
> > seperate directory from the source.  It is a patch agains 1.0.1rc1
> > and has been tested with linux 2.2.18.
> 
> Committed, with the following changes to make everything work:
>
Probably better to back both patches out.

My original patch works only if given an absolute path to the source.
Your patch works only if the path to source is precisely ..
Incidentally it would appear that relative paths to the kernel
source don't work either.  
I'll fix the patch and resubmit it.
