Return-Path: <root@srv.sistina.com>
Date: Fri, 1 Jun 2001 13:47:54 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Some questions!
Message-ID: <20010601134754.A9156@sistina.com>
References: <005501c0ea41$c4096de0$d37e85c8@cefetal.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <005501c0ea41$c4096de0$d37e85c8@cefetal.br>; from leandro@cefet-al.br on Thu, May 31, 2001 at 11:22:51PM -0300
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Thu, May 31, 2001 at 11:22:51PM -0300, Leandro Sales wrote:
> Hi folks...
>   If I built the 2.4.4 Kernel, Do I need to patch anyway to use LVM? I have a SCSI and a IDE disk, when I install LVM, Am I going to
> have boot problems 'cause of LVM?

You should do it in order to get rid of a couple of flaws.

Get the LVM 0.9.1 software from top of CVS at www.sistina.com/lvm and follow
the instruction in the INSTALL and PATCHES/README files in order to patch
your kernel and build/install it and the tools/library.


> 
>                           Leandro Melo de Sales.
> CEFET/AL - Centro Federal de Educa��o Tecnol�gica de Alagoas
>             GTI - Ger�ncia de Tecnologia da Informa��o
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
