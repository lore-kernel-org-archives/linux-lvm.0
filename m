Return-Path: <bluca@comedia.it>
Date: Sun, 17 Dec 2000 11:01:47 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Make doesn't abort on error
Message-ID: <20001217110147.B9917@colombina.comedia.it>
References: <00121616190202.10070@lyta>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00121616190202.10070@lyta>; from russell@coker.com.au on Sat, Dec 16, 2000 at 04:19:02PM +0100
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

On Sat, Dec 16, 2000 at 04:19:02PM +0100, Russell Coker wrote:
> Above is the error condition that make isn't detecting.  I've changed the 
> makefiles to use sonames so I can have multiple versions installed with ease 
> (I'll send the patch here when it's working - hopefully within 24 hours 
> otherwise maybe after Christmas).

i already posted such a patch

> Below is the code from make.tmpl.  For some reason when the "make -c 
> tools/lib all" fails it doesn't result in compilation aborting.  Perhaps 
> someone who knows make and shell scripting better than I can advise...
> 
> all:
>         @for d in $(SUBDIRS); \
>          do \
>             if [ "$$d" = "." ]; \
>             then \
>                $(MAKE) all_this; \
>             else \
>                $(MAKE) -C $$d all; \
>             fi; \
>          done

make checks output of the command it issues, in this case the shell that runs
the for loop, since the for loop has no error checking make does not complain.
If you want make to exit you should either recode the for loop or do something
like this:

--- --- --- --- --- ---
all: $(SUBDIRS)

$(SUBDIRS): dummy
    $(MAKE) -C $@

dummy:
--- --- --- --- --- ---

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
