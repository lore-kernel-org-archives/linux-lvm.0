Return-Path: <jay@lazy.accessus.net>
Date: Wed, 29 Nov 2000 00:21:57 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Subject: Re: [linux-lvm] LVM 0.9 snapshot and ext3
In-Reply-To: <Pine.OSF.4.21.0011290004310.19912-100000@lazy.accessus.net>
Message-ID: <Pine.OSF.4.21.0011290020380.11459-100000@lazy.accessus.net>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Using ext2 I don't oops, so maybe it is an ext3 issue.  I still do get the
Bad lvm_map in ll_rw_block though.  I don't recall that in 0.8, but then
again maybe I never filled a snapshot's reserved space. :)

On Wed, 29 Nov 2000, Jay Weber wrote:

> Hi,
> 
> I'm getting an oops while using ext3 and lvm snapshot (in the case where
> snapshot runs out of space).  I'm thinking if the snapshot is out of space
> it should disable and ext3 probably shouldn't oops since the journal is
> being written to the active source and not the snapshot.
> 
> This is using lvm 0.9 and ext3 0.05b using the writeback data journaling
> mode.
> 
> I've included the output below for any interested.
> 
> ----
> EXT3-fs: recovery complete.
> EXT3-fs: mounted filesystem with writeback data mode.
> lvm -- giving up to snapshot /dev/vol/foo on /dev/vol/snap due out of
> space
> Bad lvm_map in ll_rw_block
> Assertion failure in journal_write_metadata_buffer() at journal.c line
> 302: "!buffer_locked(bh_in)"
> Unable to handle kernel NULL pointer dereference at virtual address
> 00000000
> current->tss.cr3 = 00101000, %cr3 = 00101000
> *pde = 00000000
> Oops: 0002
> CPU:    0
> EIP:    0010:[<c0155540>]
> EFLAGS: 00010282
> eax: 00000067   ebx: 00000000   ecx: 000000d4   edx: c6da6000
> esi: c3b85c60   edi: c3b85c60   ebp: 00000000   esp: c3ac7e64
> ds: 0018   es: 0018   ss: 0018
> Process kjournald (pid: 968, process nr: 60, stackpage=c3ac7000)
> Stack: c01e2c20 0000012e c01e2c7a c3ac7fc4 c3b85c60 c7e3aac0 c3ac7fc8
> 00000000 
>        c015851c c7e3aac0 c3b85c60 c3ac7fc4 00000427 c6161a40 c5d9c8c0
> c3aed3c0 
>        c5ae82a0 c5ae85a0 c5ae86a0 c6fb3560 c6fb3de0 c6fb3ee0 c10114a0
> c7b89b20 
> Call Trace: [<c01e2c20>] [<c01e2c7a>] [<c015851c>] [<c0155341>]
> [<c0155230>] [<c0108c5f>] 
> Code: c6 05 00 00 00 00 00 83 c4 14 89 f6 8b 7c 24 1c 8b 47 18 a8 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
