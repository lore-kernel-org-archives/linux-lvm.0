From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] lvcreate with a 52 drive volume
Message-ID: <20030816175046.A25758@uk.sistina.com>
References: <20030815213131.G12107@uk.sistina.com> <200308152304.h7FN4eo12611@mail.osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200308152304.h7FN4eo12611@mail.osdl.org>; from markw@osdl.org on Fri, Aug 15, 2003 at 04:04:37PM -0700
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
Date: Sat Aug 16 11:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 15, 2003 at 04:04:37PM -0700, markw@osdl.org wrote:
> http://developer.osdl.org/markw/lvm2.log.gz
Thanks.
 
The line of interest is:

  0 3694559232 striped 52 8 /dev/rd/c0d0 384 /dev/rd/c0d1 384 /dev/rd/c0d2
  384 /dev/rd/c0d3 384 /dev/rd/c0d4 384 /dev/rd/c0d5 384 /dev/rd/c0d6 384
  /dev/rd/c0d7 384 /dev/rd/c0d8 384 /dev/rd/c0d9 384 /dev/rd/c0d10 384
  /dev/rd/c0d11 384 /dev/rd/c0d12 384 /dev/rd/c0d14 384 /dev/rd/c0d15 384
  /dev/rd/c0d16 384 /dev/rd/c0d17 384 /dev/rd/c0d18 384 /dev/rd/c0d19 384
  /dev/rd/c0d20 384 /dev/rd/c0d21 384 /dev/rd/c0d22 384 /dev/rd/c0d23 384
  /dev/rd/c0d24 384 /dev/rd/c0d25 384 /dev/rd/c0d26 384 /dev/rd/c1d0 384
  /dev/rd/c1d1 384 /dev/rd/c1d2 384 /dev/rd/c1d3 384 /dev/rd/c1d4 384
  /dev/rd/c1d5 384 /dev/rd/c1d6 384 /dev/rd/c1d7 384 /dev/rd/c1d8 384
  /dev/rd/c1d9 384 /dev/rd/c1d10 384 /dev/rd/c1d11 384 /dev/rd/c1d12 384
  /dev/rd/c1d14 384 /dev/rd/c1d15 384 /dev/rd/c1d16 384 /dev/rd/c1d17 384
  /dev/rd/c1d18 384 /dev/rd/c1d19 384 /dev/rd/c1d20 384 /dev/rd/c1d21 384
  /dev/rd/c1d22 384 /dev/rd/c1d23 384 /dev/rd/c1d24 384 /dev/rd/c1d25 384
  /dev/rd/c1d26 384

The error you got was:
  device-mapper: couldn't split parameters

Look at dm-table.c:498,
  char *argv[32];
which suggests a hard-coded limit of 32 [tokens after "striped"?]
slipped into the code:-(

Try recompiling with a larger number there.

Alasdair
-- 
agk@uk.sistina.com
