From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM2 CVS access?
Message-Id: <20020131131510.D9764@sistina.com>
References: <1012476509.3c592a5de7bab@webmail.tiscalinet.be>
MIME-Version: 1.0
In-Reply-To: <1012476509.3c592a5de7bab@webmail.tiscalinet.be>;
    from joel.soete@freebel.net on Thu, Jan 31, 2002 at 12:28:29PM +0100
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
Date: Thu Jan 31 06:20:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 31, 2002 at 12:28:29PM +0100, joel.soete@freebel.net wrote:
> Hi all,
> 
> Can you let me know if there will be created new cvs modules to co lvm2 as well
> as device-mapper (I do not yet find a relevant way to list available modules
> from a cvs server) ?

Please follow the instructions for "CVS Repository" you'll find following
the LVM link at www.sistina.com and run:

cvs -d :pserver:cvs@tech.sistina.com:/data/cvs checkout LVM2

and 

cvs -d :pserver:cvs@tech.sistina.com:/data/cvs checkout device-mapper

We'll update that information soon.

In addition to this we offer CVSWeb as well (you find that link on
the CVS Repository page) to browse all available public
repositoris at Sistina.

Comlete link chain is

www.sistina.com ->
Products&Support ->
Logical Volume Manager ->
CVS Repository -> (stay here to checkout LVM2 and/or device-mapper
                   using the above hints)
CVSWeb (if you like to browse)

> 
> Thanks in advance for info,
>         Joel
> 
> 
> -------------------------------------------------
> This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
