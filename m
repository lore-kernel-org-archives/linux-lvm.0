From: Frank Joerdens <frank@joerdens.de>
Subject: Re: [linux-lvm] compile error with lvm_1.1-rc2
Message-ID: <20020831212421.C17207@superfly.archi-me-des.de>
References: <20020831201710.B17207@superfly.archi-me-des.de>
Mime-Version: 1.0
In-Reply-To: <20020831201710.B17207@superfly.archi-me-des.de>; from frank@joerdens.de on Sat, Aug 31, 2002 at 08:17:10PM +0200
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
Date: Sat Aug 31 14:26:15 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Aug 31, 2002 at 08:17:10PM +0200, Frank Joerdens wrote:
> These are the errors I get:
> 
> In file included from basename.c:36:
> ../../tools/lib/liblvm.h:61: linux/autoconf.h: No such file or directory

I probably forgot to mention: /usr/src/linux/include/linux/autoconf.h
*does* exist.

Regards, Frank
