Return-Path: <hmilz@linux-magazin.de>
From: Harald Milz <hmilz@linux-magazin.de>
Subject: Re: [linux-lvm] LVM 1.0 release decision
References: <20010511155311.A17689@sistina.com> <wxxoft055j0.fsf@fjorir.ifi.uio.no>
Date: Thu, 17 May 2001 10:08:58 +0200 (CEST)
Message-Id: <20010517080900.5240B15CB6@mail.linux-new-media.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In article <wxxoft055j0.fsf@fjorir.ifi.uio.no>, Terje Kvernes <terjekv@math.uio.no> wrote:
>   this reminds me of XFS to be honest -- and that annoys me a great
>   deal. I want to test XFS, but currently I can't. because after LVM
>   and ReiserFS are patched (they pull rank :), the XFS-patches botch
>   badly. and they're far from in sync with current kernels.

That seems to depend. I recently patched 2.4.2-SuSE (not famous for being a
vanilla kernel, and containing LVM and Reiserfs) with the 2.4.2 XFS patch,
and just got 1 reject in a Makefile which I could safely ignore because the
SuSE kernel already contained that patch. And guess what: XFS and Reiserfs
work nicely together with LVM on the same machine!

-- 
Harald Milz           |     hm@linux-magazin.de     | All generalizations
Linux Magazin         | phone  +49 (0) 89 993411-20 | are shit!
Stefan-George-Ring 24 | fax    +49 (0) 89 993411-99 | 
D-81929 Muenchen      | http://www.linux-magazin.de | 
