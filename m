Subject: Re: [linux-lvm] Is there a LVM(2?) patch for 2.5.x yet?
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20020930221930.GA15549@localhost>
References: <20020930221930.GA15549@localhost>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1033424879.30743.2.camel@UberGeek.coremetrics.com>
Mime-Version: 1.0
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
Date: Mon Sep 30 17:28:54 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, 2002-09-30 at 17:19, Jos=E9 Luis Domingo L=F3pez wrote:
> On Monday, 30 September 2002, at 12:05:13 -0500,
> Austin Gonyou wrote:
>=20
> > I really need to test 2.5.x and I can't ATM because of LVM patch
> > problems. Can someone tell me what's going on with LVM and 2.5?
> >=20
> In the course of a long thread on linux-kernel mailing list (thread
> called "Re: v2.6 vs. v3.0") someone said that lack of a working LVM in
> 2.5.x was keeping away a lot of potential kernel testers.
>=20

Thanks much for replying. I actually wrote Heinz directly as well, but
it appears those mails  bounced, he's got too much in his in-box.=20

> Someone said there have been seen patches to update LVM1 in 2.5.x to a
> working state, but the consensus seem to be that 2.5.x will include
> LVM2
> instead. Someone on the list offered to check for the availability of
> current LVM2 patches against 2.5.x and begin the "transition". This
> person is also subscribed to this list, IIRC.

As was my understanding from just a few months ago when the kernel
feature list was created.

> So in the following days someone should say something specific in that
> respect (at least, many people hope so, Halloween feature freeze is
> jsuta a month away :)


Yes..I know..and now it's time to start testing for functionality Lo and
behold, LVM doesn't work on 2.5.39. Last time it did, Rik estimated,
around 2.5.7 or so. :(



> Hope this helps.
>=20
> --=20
> Jose Luis Domingo Lopez
> Linux Registered User #189436     Debian Linux Woody (Linux
> 2.4.19-pre6aa1)
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--=20
Austin Gonyou <austin@coremetrics.com>
Coremetrics, Inc.
