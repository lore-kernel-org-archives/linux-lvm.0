From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm 1.05 does not compile
Message-ID: <20020812082625.GB7670@tykepenguin.com>
References: <Pine.LNX.4.21.0208121055400.28279-100000@pluto.mscc.huji.ac.il>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0208121055400.28279-100000@pluto.mscc.huji.ac.il>
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
Date: Mon Aug 12 03:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 12, 2002 at 11:04:32AM +0300, VLADIMIR DUBNIKOV wrote:
> Hi.
> I received next errors in the time of compilation of LVM 1.0.5
> 
> make[1]: Entering directory `/usr/src/LVM/1.0.5/tools'
> make[2]: Entering directory `/usr/src/LVM/1.0.5/tools/lib'
> make[3]: Entering directory `/usr/src/LVM/1.0.5/tools/lib'
> gcc -c -pipe -g -O0 -Wall -DDEBUG -I../../tools/lib -I../../tools
> -I/usr/src/LVM
> /1.0.5/tools/lib -o basename.o basename.c
> In file included from ../../tools/lib/liblvm.h:59,
>                  from basename.c:34:
> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included

let me guess...Redhat.

Remove the #include <linux/autoconf.h> from tools/lib/liblvm.h

patrick
