From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
Message-Id: <20020207225807.GA24019@tiger.bigcats.invalid>
References: <3C625CCE.1A213D80@lmco.com>
    <Pine.LNX.4.10.10202071056180.8754-100000@pzat.meep.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.10.10202071056180.8754-100000@pzat.meep.org>
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
Date: Thu Feb  7 17:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, James!

James Hawtin (oolon@ankh.org) wrote 45 lines:

> The reasons resize scares me, is all in needs is someone to define MB or
> GB differently and your up S..T creek, is the block could 1k or 512
> bytes... Was that M option MiB or MB most people say MB whent hey mean
> MiB. Was there and "overhead" of a few blocks magically required when i
> asked for a 1GiB filesystem... etc.

If you are using ext2 or ext3, you might want to look at
e2fsadm...

-Wolfgang
