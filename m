Date: Thu, 18 Oct 2001 00:48:27 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] Horrid performance with 2.4.{9,10,12} + LVM + ReiserFS
Message-ID: <20011018004826.A11169@dardhal.mired.net>
References: <20011018000006.A22777@jensbenecke.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20011018000006.A22777@jensbenecke.de>
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
Content-Type: text/plain; charset="utf-8"
To: LVM List <linux-lvm@sistina.com>
Cc: ReiserFS Mailingliste <reiserfs-list@namesys.com>

On Thursday, 18 October 2001, at 00:00:06 +0200,
Jens Benecke wrote:

> Hello,
> [...]
> The LVM volume is about 97% full (7.5GB free). In ext2 the rule was not to
> use the last 5% of a disk because it would be too slow. But I think this
> should not be a problem for ReiserFS, at least not with such big disks (?).
> If it is, this would waste over 10GB disk space which I don't think is
> acceptable.
>
If you mean your ReiserFS partition is 97% full, read:
http://www.namesys.com/faq.html#full-disk

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian Linux Woody (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
