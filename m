Message-Id: <200308181827.h7IIRTo19585@mail.osdl.org>
From: markw@osdl.org
Subject: Re: [linux-lvm] lvcreate with a 52 drive volume
In-Reply-To: <20030818185934.D29420@uk.sistina.com>
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
Date: Mon Aug 18 13:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 18 Aug, Alasdair G Kergon wrote:
> On Mon, Aug 18, 2003 at 10:32:42AM -0700, markw@osdl.org wrote:
>> Hmmm, I changed the number, but when I do a 'make clean' and a 'make',
>> I don't see dm-table.c compiled anywhere in the device-mapper tree or
>> the LVM2 tools.  Am I neglecting something obvious?
> 
> It's hard-coded into the kernel I'm afraid, not the tools:
> 
> Are you editing <your_kernel_source_dir>/drivers/md/dm-table.c then
> rebuilding the kernel (or module, if it's a module)?

Aha, no I'm not.  I will try that now.  :)

Thanks,
Mark
