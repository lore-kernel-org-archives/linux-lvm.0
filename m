Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3AB8F353.6E324EC7@in.tum.de>
Date: Wed, 21 Mar 2001 19:30:43 +0100
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan won't recognize my VG
References: <200103202021.f2KKLR902727@webber.adilger.int> <3AB7BF33.CBCFAEA7@in.tum.de> <20010321002957.A25309@prodding>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

That's exactly what I'm looking for 'cause it seems that there's not LVM without
correct uuids.
Andreas Dilger said before that
>You should be able to do "vgcfgrestore" and it will write the UUIDs to
> disk correctly (creating new ones if needed).


My problem is that I get compile errors when building the kernel + beta6-patch
(I've followed the steps in the PATCHES directory). It says something about
LVM-symbols... I will post them if someone knows what could be the reason.

--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod@in.tum.de)
