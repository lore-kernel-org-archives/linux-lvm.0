Message-Id: <200308181732.h7IHWjo05845@mail.osdl.org>
From: markw@osdl.org
Subject: Re: [linux-lvm] lvcreate with a 52 drive volume
In-Reply-To: <20030816175046.A25758@uk.sistina.com>
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
Date: Mon Aug 18 12:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, agk@uk.sistina.com

On 16 Aug, Alasdair G Kergon wrote:
> Look at dm-table.c:498,
>   char *argv[32];
> which suggests a hard-coded limit of 32 [tokens after "striped"?]
> slipped into the code:-(
> 
> Try recompiling with a larger number there.

Hmmm, I changed the number, but when I do a 'make clean' and a 'make',
I don't see dm-table.c compiled anywhere in the device-mapper tree or
the LVM2 tools.  Am I neglecting something obvious?

Thanks,
Mark
