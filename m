Subject: Re: [linux-lvm] Root on LV
Message-ID: <OFE0B97CD3.C5A33405-ON85256ACA.004E9D80@raleigh.ibm.com>
From: "Steve Pratt" <slpratt@us.ibm.com>
Date: Mon, 17 Sep 2001 09:26:12 -0500
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

>> > dobos_s@IBCnet.hu wrote:
>> > >My kernel has no modules.
>> > >Why should I create an ext2 partition for holding an initrd which is
not
>> > >doing any essential things except vgscan and vgchange -ay ?
>>
>> You don't need vgscan at boot time unless the disks have moved around.
>> You DO need "vgchange -a y" in order to load the LVM data into the
kernel.

> If you are running EVMS you don't need that.

>But you need EVMS tools which are not available fo far :-(

Actually that is not entirely true.  All of the volume group and physical
volumes tools are done.  We have started on all of the logical volume
commands.  We have stand alone utilities which minic the LVM ones, as well
as a GUI which integrates LVM function with other volume management
functions such as partitioning.


EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM
