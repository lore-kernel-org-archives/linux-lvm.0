Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] Changing device numbers.
References: <001601c0ac41$fc35a640$0f01a8c0@myplace.net> <20010313211749.B18064@cistron.nl> <003301c0ac47$0ed576e0$0f01a8c0@myplace.net>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 13 Mar 2001 21:44:18 +0100
In-Reply-To: "Bas"'s message of "Tue, 13 Mar 2001 21:24:35 -0800"
Message-ID: <wxxbsr5e6vx.fsf@fjorir.ifi.uio.no>
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

"Bas" <list@showme.wox.org> writes:

> Because since I removed a couple of LVs and created a few, lilo
> seems to have some trouble when it's told that
> root=/dev/rootvg/root. (this number has changed). 

  and rerunning lilo doesn't help? if it doesn't you could try playing
  with the "disk"-settings in lilo?

> Plus I think it looks a lot "nicer" ...

  yes, well, you have to break a few eggs to make an omelet. or
  something. YMMV.

-- 
Terje - who has / as a normal partition mostly because he got a new
        disk to install LVM on, and didn't bother moving /.
