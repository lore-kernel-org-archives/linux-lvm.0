Message-ID: <3DAFB713.A2E7FAB3@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] creating a LVM ontop of a cryptated (ppdd) loop back 
 device
References: <3DAEDEE5.4540B954@silicide.dk> <20021017211217.GB4861@localhost>
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
Date: Fri Oct 18 02:24:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Jos=E9 Luis Domingo L=F3pez wrote:
> =

> On Thursday, 17 October 2002, at 18:01:41 +0200,
> Jon Bendtsen wrote:
> =

> > I'm trying to cryptate my filesystems, and be able to take snapshots =
of
> > them.
> > I cannot get a snapshot of a cryptated LV to work (maybe because it i=
s
> > readonly)
> >
> I haven't tried, but wouldn't it be possible to just take a snapshots
> from a LV containing an encrypted filesystem, and then loop-mount it
> (assuming encrypted via the loop device), give the password, and then
> backup ?

maybe, but i cant losetup it, possibly because snapshots are readonly.
Further more i would like noninteraktive backup's. So, i _WANT_ to put
LVM ontop of a encrypted filesystem.

 =

> I think from the loop-aes type of filesystem encryption point of view.
> But as I have said previously, I haven't tried if this works, although
> if my understanding of all these things is OK, should work.

i havent tried with loop-aes either, but with loop-ppdd, and ppdd didnt
work.


> I will try to test this setup tomorrow when I get to work :-)

cool, me too :)




JonB
