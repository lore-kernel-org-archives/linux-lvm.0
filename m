From: Kyle Hayes <khayes@quicknet.net>
MIME-Version: 1.0
Message-Id: <01110208435117.08803@khayes-lin>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] snapshot questions
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
Date: Fri Nov  2 10:42:03 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

We are considering using LVM to do database snapshots for backups.

I have some questions that the HOWTO's etc. do not seem to answer.
My largest concerns are that we will end up with a read-only corrupt
filesystem.  This seems to be a problem reported in the mailing lists.

1) how does the snapshot actually work?  My understanding is that the
creation of a snapshot partition sets up a new LV on the same VG as
the "source" partition.  This new partition is then used for writes to
the "source" partition.  When the snapshot LV is removed, do I get
a disk IO hit as these changes are copied back to the "source" partition?
Or, does it work more like Veritas where the changed data go to the
"source" and the original values are copied to the snapshot partition?
The Veritas method is nice because dropping the snapshot partition
does not require any data copying.

2) are there any people using LVM for database snapshots?  The
Whitepaper from SuSE has examples for Oracle and the HOWTO's
talk about it, but is it used in production?  If so, what issues have you
found?

3) what is the overall stability of snapshot functions?  I have been following
the pvmove thread with some alarm as I thought that LVM functionality was
stable at this point.  Is there a place that I can see what functionality is
considered stable and what isn't?  The mailing list archives do not paint a rosy
picture of snapshot functionality.

4) It seems that most of the LVM work is going into 2.4.  We have not been
particularly pleased with the stability of 2.4 in general and would like to stay
with 2.2 for a while.  How does the stability of LVM on 2.2 compare to 2.4?

5) I have seen references to the VFS lock patch in the mailing list.  Is this
actually supported by any filesystems yet?  Is it in the kernel proper? 

Thanks.

Best,
Kyle


-- 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
MicroTelco Services saves money on every Fax:
- Fax to email (FREE)
- Fax to PSTN based Fax (Up to 95% Savings)
- Fax Broadcasting: Send 100s of faxes to fax machines
and email addresses in the time it takes to send just one!
===========================================================
    So send a fax today and let us know what you think! 
       For more info. visit: www.internetfaxjack.com
===========================================================
