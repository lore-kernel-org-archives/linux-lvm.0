Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011290701.eAT71p902650@webber.adilger.net>
Subject: Re: [linux-lvm] LVM 0.9 snapshot and ext3
In-Reply-To: <Pine.OSF.4.21.0011290023290.14720-100000@lazy.accessus.net>
 "from Jay Weber at Nov 29, 2000 00:24:54 am"
Date: Wed, 29 Nov 2000 00:01:51 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: jweber@valinux.com, "Stephen C. Tweedie" <sct@redhat.com>

Jay Weber writes:
> Proper OOPS output below, sorry, pasted useless one in prior message.

Basically, the oops is from an assertion (debugging check) in the ext3
journal code testing for a condition that _shouldn't_ happen.  In this case
"!buffer_locked(bh_in)", so it is getting a locked buffer (in the middle of
I/O) when it doesn't expect it.  The ext3 0.0.5b code (which you are using)
should have been able to handle basic I/O failures and such, but this
looks a bit unusual.

Maybe LVM isn't cleaning up the buffer properly when it runs out of space
in the snapshot...  Also, I haven't really dug into LVM snapshots much,
but shouldn't all the remapping be done on the read-only copy?  Do LVM
snapshots store the modified blocks in the original LV, and the old (frozen)
blocks in the snapshot LV, or vice versa?  If ext3 is writing to the
original LV, it should never run out of space.  At most, the read-only
copy (which will not be ext3) should disappear - I'm not sure what LVM
does in this case.

Note also that 0.0.5b with writeback mode is still fairly untested,
so there is some chance it is an ext3 issue.  Stephen previously wrote
that data=ordered may actually be faster than data=writeback.

I've CC'd this to Stephen in case he has any ideas.

Cheers, Andreas

> Nov 28 22:12:52 slippey kernel: Bad lvm_map in ll_rw_block 
> Nov 28 22:12:52 slippey kernel: Assertion failure in
> journal_write_metadata_buffer() at journal.c line
> 302: "!buffer_locked(bh_in)" 
> Nov 28 22:12:52 slippey kernel: Unable to handle kernel NULL pointer
> dereference at virtual address 00000000 
> Nov 28 22:12:52 slippey kernel: current->tss.cr3 = 00101000, %cr3 =
> 00101000 
> Nov 28 22:12:52 slippey kernel: *pde = 00000000 
> Nov 28 22:12:52 slippey kernel: Oops: 0002 
> Nov 28 22:12:52 slippey kernel: CPU:    0 
> Nov 28 22:12:52 slippey
> kernel: EIP:    0010:[journal_write_metadata_buffer+60/436] 
> Nov 28 22:12:52 slippey kernel: EFLAGS: 00010282 
> Nov 28 22:12:52 slippey kernel: eax: 00000067   ebx: 00000000
> ecx: 000000d4   edx: c6da6000 
> Nov 28 22:12:52 slippey kernel: esi: c3b85c60   edi: c3b85c60
> ebp: 00000000   esp: c3ac7e64 
> Nov 28 22:12:53 slippey kernel: ds: 0018   es: 0018   ss: 0018 
> Nov 28 22:12:53 slippey kernel: Process kjournald (pid: 968, process
> nr: 60, stackpage=c3ac7000) 
> Nov 28 22:12:53 slippey kernel: Stack: c01e2c20 0000012e c01e2c7a c3ac7fc4
> c3b85c60 c7e3aac0 c3ac7fc8 00000000  
> Nov 28 22:12:53 slippey kernel:        c015851c c7e3aac0 c3b85c60 c3ac7fc4
> 00000427 c6161a40 c5d9c8c0 c3aed3c0  
> Nov 28 22:12:53 slippey kernel:        c5ae82a0 c5ae85a0 c5ae86a0 c6fb3560
> c6fb3de0 c6fb3ee0 c10114a0 c7b89b20  
> Nov 28 22:12:53 slippey kernel: Call Trace: [cprt+21728/40165]
> [cprt+21818/40165] [journal_commit_transaction+1356/3588]
> [kjournald+257/424] [commit_timeout+0/12] [kernel_thread+35/48]  
> Nov 28 22:12:53 slippey kernel: Code: c6 05 00 00 00 00 00 83 c4 14 89 f6
> 8b 7c 24 1c 8b 47 18 a8  
> 
> 
> On Wed, 29 Nov 2000, Jay Weber wrote:
> 
> > Hi,
> > 
> > I'm getting an oops while using ext3 and lvm snapshot (in the case where
> > snapshot runs out of space).  I'm thinking if the snapshot is out of space
> > it should disable and ext3 probably shouldn't oops since the journal is
> > being written to the active source and not the snapshot.
> > 
> > This is using lvm 0.9 and ext3 0.05b using the writeback data journaling
> > mode.
> > 
> > I've included the output below for any interested.
> > 
> > ----
> > EXT3-fs: recovery complete.
> > EXT3-fs: mounted filesystem with writeback data mode.
> > lvm -- giving up to snapshot /dev/vol/foo on /dev/vol/snap due out of
> > space
> > Bad lvm_map in ll_rw_block
> > Assertion failure in journal_write_metadata_buffer() at journal.c line
> > 302: "!buffer_locked(bh_in)"
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 00000000
> > current->tss.cr3 = 00101000, %cr3 = 00101000
> > *pde = 00000000
> > Oops: 0002
> > CPU:    0
> > EIP:    0010:[<c0155540>]
> > EFLAGS: 00010282
> > eax: 00000067   ebx: 00000000   ecx: 000000d4   edx: c6da6000
> > esi: c3b85c60   edi: c3b85c60   ebp: 00000000   esp: c3ac7e64
> > ds: 0018   es: 0018   ss: 0018
> > Process kjournald (pid: 968, process nr: 60, stackpage=c3ac7000)
> > Stack: c01e2c20 0000012e c01e2c7a c3ac7fc4 c3b85c60 c7e3aac0 c3ac7fc8
> > 00000000 
> >        c015851c c7e3aac0 c3b85c60 c3ac7fc4 00000427 c6161a40 c5d9c8c0
> > c3aed3c0 
> >        c5ae82a0 c5ae85a0 c5ae86a0 c6fb3560 c6fb3de0 c6fb3ee0 c10114a0
> > c7b89b20 
> > Call Trace: [<c01e2c20>] [<c01e2c7a>] [<c015851c>] [<c0155341>]
> > [<c0155230>] [<c0108c5f>] 
> > Code: c6 05 00 00 00 00 00 83 c4 14 89 f6 8b 7c 24 1c 8b 47 18 a8 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 


-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
