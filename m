From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm 1.0.1-rc4 and vgcreate error
Message-Id: <20020116162037.B19969@sistina.com>
References: <3c44c485.4dcb.0@connection.com.br>
MIME-Version: 1.0
In-Reply-To: <3c44c485.4dcb.0@connection.com.br>; from
    cbastos@connection.com.br on Tue, Jan 15, 2002 at 10:08:37PM -0200
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
Date: Wed Jan 16 09:24:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Carlos,

you say you pvcreated /dev/sda[12] successfully, but run
"vgcreate lvmdisk /dev/sda1 /dev/sdb1" which makes vgcreate complain like
you reported below unless /dev/sdb1 is a valid PV too.

On Tue, Jan 15, 2002 at 10:08:37PM -0200, carlos xavier wrote:
> Hi there,
> 
> I'm trying to get LVM working on Linux but is being very frustrating to me.
> 
> I'm running kernel version 2.4.14 and the disks where I'm tryng to do LVM are
> 
> QUANTUM Model: ATLAS10K2-TY367 (scsi)
> I've already tried these versions of LVM: lvm_0.6, lvm_1.0.1 and
> lvm_1.0.1-rc4. All of them give some trouble, but the main problem is that I
> 
> can't create the volume group.
> I followed the howto and partitioned the disks and changed the type to 8e, I
> 
> was able to run pvcreate on the two disks /dev/sda1 and /dev/sda2, but when
> I
> tried to create the volume group I'm getting the following error
> 
> # vgcreate lvmdisk /dev/sda1 /dev/sdb1
> vgcreate -- ERROR "pv_read(): PV identifier invalid" reading physical volumes
> 
> 
> With the version lvm_1.0.1 I was able to create it and mount, but when I
> rebooted the computer I couldn't mount it again, the volume wasn't detected
> 
> and the data tha I put on it was lost.
> 
> I did a trace of the command and I can see that it opens the files
> /etc/lvmtab,
> /etc/lvmtab.d
> /dev/lvm
> /etc/lvmtab
> /proc/partitions and
> /proc/devices
> in that order, and after that it gives me the error.
> 
> Am I missing something?
> Could Somebody tell me how can I get over this trouble?
> 
> Regards.
> 
> Xavier
> <pre>
> ################################
> Connection Web Mail
> http://www.connection.com.br
> Visite http://www.achando.com.br
> ################################
> </pre>
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
