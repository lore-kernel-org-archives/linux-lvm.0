From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200004191940.VAA05783@u9etz.ez-darmstadt.telekom.de>
Subject: [linux-lvm] Re: patch for Makefile of LVM 0.8final
In-Reply-To: <20000414163242.A21335@home.ds9a.nl> from bert hubert at "Apr 14, 2000  4:32:43 pm"
Date: Wed, 19 Apr 2000 21:40:33 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bert hubert <ahu@ds9a.nl>
Cc: linux-lvm@msede.com, mge@ez-darmstadt.telekom.de


Applied.

Regards,
Heinz

> Heinz, people,
> 
> With this patch I am able to run 'Make install' on both my Debian and RedHat
> 6.1 boxes without an error when stripping the initrd script. Please apply.
> 
> 
> diff -u -r 0.8final.orig/tools/Makefile 0.8final/tools/Makefile
> --- 0.8final.orig/tools/Makefile	Tue Feb 22 03:09:32 2000
> +++ 0.8final/tools/Makefile	Fri Apr 14 16:22:21 2000
> @@ -63,11 +63,18 @@
>  l:	list
>  
>  install-bin:	$(ALL_TARGETS) $(ALL_SCRIPTS)
> -	@echo "*** Installing $(ALL_TARGETS) $(ALL_SCRIPTS) in $(BINDIR) ***"
> -	@for f in $(ALL_TARGETS) $(ALL_SCRIPTS); \
> +	@echo "*** Installing $(ALL_TARGETS) in $(BINDIR) ***"
> +	@for f in $(ALL_TARGETS) ; \
>  	do \
> -  	   rm -f $(BINDIR)/$$f; \
> +  	   rm -f "$(BINDIR)/$$f"; \
>  	   install -o root -g root -m 555 -s $$f $(BINDIR)/$$f; \
> +	done
> +
> +	@echo "*** Installing $(ALL_SCRIPTS) in $(BINDIR) ***"
> +	@for f in $(ALL_SCRIPTS); \
> +	do \
> +  	   rm -f "$(BINDIR)/$$f"; \
> +	   install -o root -g root -m 555 $$f $(BINDIR)/$$f; \
>  	done
>  
> 
> -- 
>                        |              http://www.rent-a-nerd.nl
>                        |                     - U N I X -
>                        |          Inspice et cautus eris - D11T'95
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
