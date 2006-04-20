Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3KKo91o006734
	for <linux-lvm@redhat.com>; Thu, 20 Apr 2006 16:50:09 -0400
Received: from smtp-out2.email.it (smtp-out2.email.it [80.247.70.37])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3KKo3Fw014347
	for <linux-lvm@redhat.com>; Thu, 20 Apr 2006 16:50:03 -0400
Received: from [192.168.2.2] (host210-57.pool8711.interbusiness.it
	[87.11.57.210])by smtp-out2.email.it (Email.it) with ESMTP id
	877BE1BC5F5for <linux-lvm@redhat.com>;
	Thu, 20 Apr 2006 22:50:04 +0200 (CEST)
Subject: Re: [linux-lvm] dmeventd_mirror problem and some questions.
From: Simone Gotti <simone.gotti@email.it>
In-Reply-To: <c05cb1b2cd4b2d1ca1fb7b62b0ee6e5e@redhat.com>
References: <1145364034.3003.55.camel@localhost><c05cb1b2cd4b2d1ca1fb7b62b0ee6e5e@redhat.com>
Date: Thu, 20 Apr 2006 22:50:06 +0200
Message-Id: <1145566206.2658.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2006-04-19 at 09:00 -0500, Jonathan E Brassow wrote: 

> Kernel patches are located at http://www.brassow.com/mirroring.  Last 
> updated on April 3rd... I'll be updating those either today or tomorrow 
> as well.

Thanks, 
I tried the version of the 3 April and the new version of yesterday.
I applied the patches in the order provided by the "series" file, used
the standard fedora .config, but on both the versions I got this
compilation error:

  CC [M]  drivers/md/dm-log.o
drivers/md/dm-log.c: In function ‘dm_register_dirty_log_type’:
drivers/md/dm-log.c:19: error: ‘_lock’ undeclared (first use in this
function)
drivers/md/dm-log.c:19: error: (Each undeclared identifier is reported
only once
drivers/md/dm-log.c:19: error: for each function it appears in.)
drivers/md/dm-log.c: In function ‘dm_unregister_dirty_log_type’:
drivers/md/dm-log.c:29: error: ‘_lock’ undeclared (first use in this
function)
drivers/md/dm-log.c: In function ‘get_type’:
drivers/md/dm-log.c:46: error: ‘_lock’ undeclared (first use in this
function)
drivers/md/dm-log.c: In function ‘put_type’:
drivers/md/dm-log.c:64: error: ‘_lock’ undeclared (first use in this
function)
make[2]: *** [drivers/md/dm-log.o] Error 1
make[1]: *** [drivers/md] Error 2
make: *** [drivers] Error 2

I am missing something?


> There are some kernel patches that you need.  Either way, the DSO 
> shouldn't be crashing, so I'll look into that.

My temporary workaround was to check the number of returned arguments:

Index: dmeventd_mirror.c
===================================================================
RCS file: /cvs/lvm2/LVM2/dmeventd/mirror/dmeventd_mirror.c,v
retrieving revision 1.5
diff -u -b -B -p -r1.5 dmeventd_mirror.c
--- dmeventd_mirror.c   6 Feb 2006 19:34:45 -0000       1.5
+++ dmeventd_mirror.c   20 Apr 2006 20:42:18 -0000
@@ -39,6 +39,7 @@ static int _get_mirror_event(char *param
 {
        int i, rtn = ME_INSYNC;
        int max_args = 30;  /* should support at least 8-way mirrors */
+       int output_args;
        char *args[max_args];
        char *dev_status_str;
        char *log_status_str;
@@ -46,11 +47,17 @@ static int _get_mirror_event(char *param
        char *p;
        int log_argc, num_devs, num_failures=0;

-       if (max_args <= split_words(params, max_args, args)) {
+       output_args = split_words(params, max_args, args);
+       if (max_args <= output_args) {
                syslog(LOG_ERR, "Unable to split mirror parameters: Arg
list too long");
                return -E2BIG;
        }

+       if (output_args <= 4) {
+               syslog(LOG_ERR, "Mirror status not provided by the
kernel module");
+               return ME_IGNORE;
+       };
+
        /*
         * Unused:  0 409600 mirror
         * Used  :  2 253:4 253:5 400/400 1 AA 3 cluster 253:3 A


Thanks!

Bye!
>   brassow
> 
> On Apr 18, 2006, at 7:40 AM, Simone Gotti wrote:
> 
> > Hi All,
> >
> > I was curious to try the experimental dmeventd + the mirror checking
> > dso.
> > Everytime I created a mirror volume, dmeventd was crashing when the
> > mirror finished the syncing process.
> > I tracked it down to _get_mirror_event that is expeting a return string
> > from the status ioctl to dm like "2 253:4 253:5 400/400 1 AA 3 cluster
> > 253:3 A" but it gets only "2 253:4 253:5 400/400" so it SIGSEGV when is
> > going to read over the number of returned arguments in the "args" array
> > from split_words.
> >
> > The same string is returned by "dmsetup status".
> >
> > Do these informations aren't already implemented in the ioctl, or are
> > there some patches around that I can try? (my kernel is the latest
> > available in fedora rawhide: 2.6.16-1.2131_FC6)
> >
> > Another question, If I understand it correctly, the mirror library for
> > dmeventd will look to possible problems (eg the lost of a PV containing
> > a mirror), and it will call the right lvm command to fix it?
> > For example, if a PV containing a side of a 2 way mirrored volume is
> > lost, what are the various actions that it will do (I noticed an
> > lvreduce --removemissing, but my fear is that this command will also
> > remove unmirrored volumes)?
> >
> > Thanks!
> >
> > Bye!
> >
> > Simone Gotti.
> >
> >
> >
> >
> >  --
> >  Email.it, the professional e-mail, gratis per te: 
> > http://www.email.it/f
> >
> >  Sponsor:
> >  Problemi di Liquidità? Con Logos Finanziaria 30.000 € in 24 ore a 
> > dipendenti e lavoratori autonomi con rimborsi fino a 120 mesi, clicca 
> > qui
> > *
> >  Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=2911&d=18-4
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

 
 
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
 
 Sponsor:
 Telefonare all'estero risparmiando fino all'80%? Con Email.it Phone Card puoi, clicca e scopri tutti i vantaggi
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=2683&d=20-4
