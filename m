Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] XFS and LVM
Date: Wed, 23 May 2001 11:17:14 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJOEMIIOAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010523010640.C2933@vestdata.no>
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

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Ragnar Kj=EF=BF=BDrstad
> On Wed, May 23, 2001 at 10:50:27AM +1200, Steve Wray wrote:
> > > > Mind you, reiserfs is supposed to be shrinkable but, ahem, it didn't
> > > > work...
> > >
> > >   ouch. what happened?
> >
> > It wouldn't mount afterward... It was only on /usr/local
> > whuch was backed up.
>
> Did you report it to reiserfs-list@namesys.com?

nooo, I'm not really using reiserfs in a serious way.
I only tried it out because XFS isn't shrinkable,
so I wondered how reiserfs would perform on a shrink.

I'm going to try ext3 sometime soon...
