From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] Re-Striping a LV after adding a PV
In-Reply-To: <3.0.6.32.20020403145707.0092ae30@pop3.bmlv.gv.at>
Message-Id: <Pine.LNX.4.44.0204031309390.17100-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Wed Apr  3 07:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 3 Apr 2002, Ph. Marek wrote:

> Hi everybody!
>
> As seen in
> 	http://marc.theaimsgroup.com/?l=linux-lvm&m=99121490215720&w=2
> there is a reference to restriping a LV after adding a disk in may 2001.
> It's mentioned to be "post 1.0" - I currently use 1.0.1-rc2 (suse 7.3) and
> find 1.0.1-rc4 on the 'net - is restriping a LV already done?
>
> I thought about doing it per perl-script or similar - but pvmove does not
> know that the PE it moved are free afterwards.
> So if I have a non-striped LV, with extends (say) 0-9.
> I add a disk and pvmove 1:3:5:7:9 to the new disk - works beautiful.
> Then I want to get part of the LV on the first PV continuous - so I
> pvmove 2:4:7:8 to the same disk as they are on - but they land on
> 1,3,5,7 instead of 1,2,3,4.
>
> But this is maybe too slow anyway (with perl) - I'd need it for several
> tens of GB.
>
>
> Can somebody give me a hint?

If you want use PVmove get 1.0.3 I moved Strips with that one, it has
fixed the free problem.

pvmove .......  /oldpv /newpv

IF you want to tell it where to put it.

I used PV move for a 40 Gb strip... it took about an hour for me.

James
