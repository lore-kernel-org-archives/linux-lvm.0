From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Kernel 2.6.1 and LVM2
Message-ID: <20040125213120.GA32013@redhat.com>
References: <000801c3e25b$a509cc90$9722fea9@terence>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000801c3e25b$a509cc90$9722fea9@terence>
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
Date: Tue Jan 27 00:02:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi John,

you can essentially reuse the /etc/rc.d/rc.sysinit startup
of Red Hat Linux for LVM1.
Maybe you can feed that back to Fedora development ?

Regards,
Heinz    -- The LVM Guy --


en Sat, Jan 24, 2004 at 10:22:51AM +0100, John Cassidy wrote:
> Heinz,
> 
>  
> 
>         on the above kernel, all of the necessary steps have been taken to
> get LVM2 to function.
> 
>  
> 
> My problem is I want an appropriate startup script to initiate and halt
> LVM2 at startup and shutdown.
> 
>  
> 
> Distribution is RH Fedora with kernel 2.6.1.
> 
>  
> 
> Any ideas?
> 
>  
> 
> Im voraus..    
> 
>  
> 
> Regards/Cordialement/Gruss/Saludos 
> 
> John Cassidy Dipl.-Ing (Informatique)
> 
> S390 & zSeries Systems Engineering
> 
> Schleswigstr. 7
> 
> D-51065 Cologne
> 
> EU
> 
> Tel: +49  (0) 221 61 60 777 . GSM: +49  (0) 177 799 58 56 
> 
> E-Mail: Sean@JDCassidy.net  <mailto:Sean@JDCassidy.net> 
> 
> HTTP :
> <file:///H:\Documents%20and%20Settings\Horace\Application%20Data\Microsoft\S
> ignatures\www.jdcassidy.net> www.jdcassidy.net 
> 
>    
> 
>  
> 

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat, Inc.
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
