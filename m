Return-Path: <wichert@cistron.nl>
Date: Mon, 13 Aug 2001 21:49:43 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010813214943.A19522@cistron.nl>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010812221650.A6589@vestdata.no> <20010813161301.B6466@uk.sistina.com> <3B782E02.B5DB2FC8@tls.msk.ru>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B782E02.B5DB2FC8@tls.msk.ru>; from mjt@tls.msk.ru on Mon, Aug 13, 2001 at 11:44:02PM +0400
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

Previously Michael Tokarev wrote:
> Wow, great!  No more tons of tiny executables!  Wow!  Looks
> very good.  Just like `cvs' now -- "cvs co", "cvs add" etc...

Compare with: wow! instead of a few simple modular applications we
now get a single one which tries to do everything. I'm not convinced
this is a step forward, the UNIX philosophy of having lots of small
single-purpose tools is a good one.

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
