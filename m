From: GCS <gcs@lsc.hu>
Subject: Re: [linux-lvm] Kernel 2.4.12 bug?
Message-ID: <20011024082146.A3130@lsc.hu>
References: <20011020111357.A13288@lsc.hu> <20011022094833.B557@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011022094833.B557@tykepenguin.com>; from caulfield@sistina.com on Mon, Oct 22, 2001 at 09:48:33AM +0100
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
Date: Wed Oct 24 01:08:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

On Mon, Oct 22, 2001 at 09:48:33AM +0100, Patrick Caulfield <caulfield@sistina.com> wrote:
> Not that I've seen. I'm running 2.4.12 ATM quite happily, LVM is a module rather
> than in the kernel though.
 My kernel is still complaining during vgscan, see the syslog:
lvm -- Module successfully initialized
invalidate: busy buffer
last message repeated 8 times

Also at reboot/halt I get:
 printing eip:
c014c022
Oops: 0000
CPU:    0
EIP:    0010:[proc_match+18/56]    Tainted: P
EFLAGS: 00010206
eax: d9fc2609   ebx: 03   ecx: 03   edx: 5a5a5a5a
esi: d9fc2609   edi: d9fc260d   ebp: d65f7d18   esp: d65f7d10
ds: 0018   es: 0018   ss: 0018
Process vgchange (pid: 345, stackpage=d65f7000)
etc...

Eip points inside c014bf4c t meminfo_read_proc. I have even patched it to
2.4.13pre3, but I get the same result. What should I check out? With 2.4.9
everything works normaly.

Cheers, GCS
