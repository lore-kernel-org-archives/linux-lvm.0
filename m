Message-Id: <199906231110.AA22585@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Compiling LVM 0.6 on Redhat 6.0
Date: Wed, 23 Jun 1999 13:09:00 METDST
In-Reply-To: <ENJGHHKIMLNCBAAA@my-deja.com>; from "George Nicolaou" at Jun 22, 99 5:22 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gnicolao@my-deja.com
Cc: linux-lvm@msede.com, mge@u9ete.ez-darmstadt.telekom.de


Hi there!

Looks like you had a compile problem in the LVM lib which caused
the library _not_ to be build.

Could you please have a look at the library build output an tell me?

Regards,
Heinz

>
> Hi all,
>   I have just found LVM and attempting to install it on a newly installed headhat 6 box. When compiling I get the following error:
> 
> Using the static LVM Library
> make[2]: *** No rule to make target `/usr/local/src/LVM/0.6/tools/lib/liblvm.a', needed by `e2fsadm'.  Stop.
> make[2]: Leaving directory /usr/local/src/LVM/0.6/tools'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory '/usr/local/src/LVM/0.6/tools'
> make: *** [all] Error 2
>
> Using XLINKER
> make[1]: Entering directory `/usr/local/src/LVM/0.6/tools'
> cc  -L/usr/local/src/LVM/0.6/tools/lib -Xlinker -rpath /usr/local/src/LVM/0.6/to
> ols/lib -Xlinker -rpath /lib -Xlinker -rpath /usr/lib -llvm -o e2fsadm e2fsadm.o
> 
> /usr/bin/ld: cannot open -llvm: No such file or directory
> collect2: ld returned 1 exit status
> make[1]: *** [e2fsadm] Error 1
> make[1]: Leaving directory `/usr/local/src/LVM/0.6/tools'
> make: *** [all] Error 2
> 
> 
> Can someone please shead some light on this error.
> 
> Cheers
> George
> 
> 
> 
> --== Sent via Deja.com http://www.deja.com/ ==--
> Share what you know. Learn what you don't.
> 


--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
