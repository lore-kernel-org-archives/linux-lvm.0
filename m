From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] lvcreate with a 52 drive volume
Message-ID: <20030818173819.GA19339@gondor.com>
References: <20030816175046.A25758@uk.sistina.com> <200308181732.h7IHWjo05845@mail.osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200308181732.h7IHWjo05845@mail.osdl.org>
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
Date: Mon Aug 18 12:39:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 18, 2003 at 10:32:42AM -0700, markw@osdl.org wrote:
> Hmmm, I changed the number, but when I do a 'make clean' and a 'make',
> I don't see dm-table.c compiled anywhere in the device-mapper tree or
> the LVM2 tools.  Am I neglecting something obvious?

It should get compiled into dm-mod.o, if you compile dm as a module.

Jan
