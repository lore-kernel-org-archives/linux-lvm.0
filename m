Return-Path: <root@srv.sistina.com>
Date: Fri, 13 Jul 2001 13:03:08 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] beta7 does not work with 2.4.5
Message-ID: <20010713130308.A32198@sistina.com>
References: <OF745D105C.375AB25C-ONC1256A88.002DF96C@de.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <OF745D105C.375AB25C-ONC1256A88.002DF96C@de.ibm.com>; from maxim.shchetynin@de.ibm.com on Fri, Jul 13, 2001 at 10:27:57AM +0200
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

Maxim,

you need to backup to 0.9.1 Beta 2 tools (which is not recommended because of
later bug fixes) *or* (wich is recommended ;-) patch the kernel up to
0.9.1 Beta 7 as well.

Be warned that there's a misalignment bug we are fixing right now, which *can*
cause problems with LVM snapshots.

Regards,
Heinz    -- The LVM Guy --


On Fri, Jul 13, 2001 at 10:27:57AM +0200, Maxim Shchetynin wrote:
> Hello,
> 
> I cannot let beta7 work on my system. Interesting thing I have found is
> that lvm-mod.o file,
> which lives in a kernel stuff has a version beta2. My pinguin is as of
> version 2.4.5.
> But beta3 works fine in the same environment.
> Any idea? :(
> 
> Mit freundlichen Gr��en / Best regards
> 
> Maxim V. Shchetynin
> IBM Deutschland Entwicklung GmbH
> Linux S/390 Architecture & Perfomance
> Schoenaicher Strasse 220
> D-71032 Boeblingen, Deutschland
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
