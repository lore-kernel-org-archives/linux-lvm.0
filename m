Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] LVM 1.0 release decision
References: <20010511155311.A17689@sistina.com>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 11 May 2001 16:22:59 +0200
In-Reply-To: "Heinz J. Mauelshagen"'s message of "Fri, 11 May 2001 15:53:11 +0000"
Message-ID: <wxxoft055j0.fsf@fjorir.ifi.uio.no>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: linux-kernel@sistina.com, mge@sistina.com

"Heinz J. Mauelshagen" <Mauelshagen@sistina.com> writes:

> This leads to the dilemma, that trying to avoid further differences
> between our LVM releases and the stock kernel code would force us
> into postponing the pending LVM 1.0 release accordingly which OTOH
> is incovenient for the LVM user base.

  why is postponing LVM 1.0 inconvenient for the LVM user base? the
  people using it now won't feel the difference, and people not using
  it will be delayed some time. as much as I love LVM, I don't see the
  problem. release 1.0 when things fall into place.

> In regard to this situation we'ld like to know about your oppinion
> on the following request: is it acceptable to release 1.0 soon
> *before* all patches to reach the 1.0 code status are in vanilla
> (presumed that we provide them with our release as we always did
> before)?

  I'm not sure there's a point to it. what will happen is just that
  people will yet again have to come get apparently external patches
  for something already in the kernel. I think marking the end of that
  with 1.0 would be nice.

  this reminds me of XFS to be honest -- and that annoys me a great
  deal. I want to test XFS, but currently I can't. because after LVM
  and ReiserFS are patched (they pull rank :), the XFS-patches botch
  badly. and they're far from in sync with current kernels.

  IMHO: getting all the patches into the kernel, makes it a _lot_
  easier for the LVM user base. because they can _then_ apply other
  patches for other projects of they want to. it's also easier on
  other developers of the same reason.

> We'll gather your answers for some days and will send the conclusion
> to the lists.

  okies :)

-- 
Terje - a very happy LVM user.
