Date: Tue, 18 Sep 2001 12:23:08 -0500
From: lembark@wrkhors.com
Subject: Re: [linux-lvm] Root on LV
Message-ID: <26260000.1000833788@duke.wrkhors.com>
In-Reply-To: <OFE0B97CD3.C5A33405-ON85256ACA.004E9D80@raleigh.ibm.com>
References: <OFE0B97CD3.C5A33405-ON85256ACA.004E9D80@raleigh.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


-- Steve Pratt <slpratt@us.ibm.com> on 09/17/01 09:26:12 -0500

>>> > dobos_s@IBCnet.hu wrote:
>>> > > My kernel has no modules.
>>> > > Why should I create an ext2 partition for holding an initrd which is
> not
>>> > > doing any essential things except vgscan and vgchange -ay ?
>>> 
>>> You don't need vgscan at boot time unless the disks have moved around.
>>> You DO need "vgchange -a y" in order to load the LVM data into the
> kernel.
> 
>> If you are running EVMS you don't need that.
> 
>> But you need EVMS tools which are not available fo far :-(
> 
> Actually that is not entirely true.  All of the volume group and physical
> volumes tools are done.  We have started on all of the logical volume
> commands.  We have stand alone utilities which minic the LVM ones, as well
> as a GUI which integrates LVM function with other volume management
> functions such as partitioning.

Q:  Why bother to put 64MB on an LVM?

The root volume doesn't grow much (make it 128MB and it'll never need to
grow).
If you ever have a problem with LVM you'll end up with an unbootable
system...
