Return-Path: <jan@moria.gondor.com>
Date: Tue, 9 Jan 2001 01:02:25 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] mke2fs problem
Message-ID: <20010109010224.A7636@gondor.com>
References: <4.3.1.2.20010108164145.00c9f3e0@pop.nyx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4.3.1.2.20010108164145.00c9f3e0@pop.nyx.net>; from whiplash@pobox.com on Mon, Jan 08, 2001 at 04:53:42PM -0700
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

On Mon, Jan 08, 2001 at 04:53:42PM -0700, Gordon Schumacher wrote:
>    lvcreate -i 2 -L 52M -n lv1 mygrp
>    lvcreate -i 2 -L 12M -n lv2 mygrp
[...]
>    So, everything *looks* like it's the right size; but mke2fs seems to
>    think that it's talking to a ~57MB and ~16MB disk, respectively!  What
>    am I doing wrong here? 

Well, you actually told lvcreate to create volumes of 52MB and 12MB. lvcreate
had to round them up to multiples of 8, so you got 56MB and 16MB. What's
wrong about that? 

If you want gigabytes instead of megabytes, use G and not M ;-)

Jan
