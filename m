Return-Path: <boutilpj@ednet.ns.ca>
Message-ID: <3B1D16EA.3B4954A2@ednet.ns.ca>
Date: Tue, 05 Jun 2001 14:29:14 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How can I change my disk type to 0x8e? -> OK! But How 
 Can I change
References: <991759810.3b1d0dc2b24c1@www.etfal.g12.br> <3B1D12D1.1C292229@ednet.ns.ca> <991761092.3b1d12c44e338@www.etfal.g12.br>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

First of all you want type 8e not 0. That was a mistake I made when i first
set it up. To cahnge a partion type you must use fdisk (eg. fdisk /dev/hda).
Then toggle the partion (use the t command) to type 8e

You mentioned losing data and this being a first time install. You can't ta=
ke
existing partitions and expect them to work inside an LVM setup. You would
create Physical volumes, Volume groups, and Logical volumes using new/empty
disk partitions and then copy existing data onto new filesystems in the LVM
group.





Leandro Sales - EstagiXrio GTI wrote:

> Ok Patrick, thank you! But, How Can I change to type 0? or to 0x8e?
>
> Leandro.
>
> C=EF=BF=BDpia Patrick Boutilier <boutilpj@ednet.ns.ca>:
>
> > I changed from partition type 0 (empty) to 8e about 6 months ago and
> > didn't lose
> > any data. I had type 0 because when I first installed LVM I tried to
> > toggle my
> > partions to 0x8e and it changed it to type 0. LVM worked with type 0 but
> > fdisk -l
> > showed no partitons. :-)
> >
> >
> >
> >
> > Leandro Sales - EstagiXrio GTI wrote:
> >
> > > Hi...
> > >     I'm a new user and I compiled LVM recently. I'd like to know I can
> > I change
> > > my disk type to 0x8e... What does 0x8e type mean?
> > >     If I change to 0x8e, will I have lost data? Please, help me ok?
> > >
> > > Leandro.
> > >
> > > ------------------------------------------------
> > > Mensagem enviada pelo servidor de Webmail www.etfal.g12.br
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
>
> ------------------------------------------------
> Mensagem enviada pelo servidor de Webmail www.etfal.g12.br
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
