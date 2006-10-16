Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id k9GJHeSf003261
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 15:17:40 -0400
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <4533ABCD.8030502@ibt.unam.mx>
References: <452EEB6C.9040701@ibt.unam.mx> <4533ABCD.8030502@ibt.unam.mx>
Message-Id: <01dbd6887fd9d439599e31bda27f3883@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] How to restore a PV ??
Date: Mon, 16 Oct 2006 14:20:14 -0500
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On each disk in the volume group is a record of the changes that have 
been made to the volume group.  The last item in the record is the 
current lvm meta-data.  If you can retrieve that, it is the same as 
having the backup file which would normally be found in 
/etc/lvm/backup.

You could use hexdump, but I find it much simpler to use 'less -f 
<device>'.  You should see something like:

<crap>
principal {
...
}
<comments>
<crap>
principal {
...
}
<comments>
<crap>

You should be able to search for 'principal' (the name of your volume 
group) to locate the first record.  As I said, this "meta data area" of 
the disk keeps a history of your volume group changes.  That is, rather 
than overwriting the record, it writes the new metadata format after 
the last one (in a circular buffer fashion).  You can use the 'seqno' 
field to determine the newest one.  Also, the metadata is written in 
text to the disk, so it should be simple enough to read it and 
determine if everything looks fine.

Once you've found the latest copy of the metadata, copy it - including 
comments - to a file and use 'vgcfgrestore -t -f <file> <vgname>' to 
test it.  Once satisfied, perform the 'vgcfgrestore -f <file> 
<vgname>'.

If all else fails, you can use dd to grab me the first chunk of the 
disk, and I'll recreate the backup file for you.  ('dd if=<one of the 
good devs> of=<output file> bs=1M count=1;  bzip2 <output file>; send 
me <output file>.bz2')

  brassow

On Oct 16, 2006, at 10:57 AM, Jerome wrote:

> jbrassow wrote:
> >does 'vgcfgrestore principal' work?
> >
> > brassow
> >
> Hi Jonathan,
> i try to use this command, and i've received this error mesage:
>
> /etc/lvm/backup/principal: stat failed: No such file or directory
> Couldn't read volume group metadata.
> Restore failed.
>
> I mean that i've lost the /etc/lv/ directory lost. I've read some 
> information about how to construct the Metadata file with hexdump 
> command (cf : 
> https://www.redhat.com/archives/linux-lvm/2006-June/msg00049.html).
> But i not sure how to do this yet.
>
> Thank's a lot.
>
>
>
>
> -- 
> -- J�r�me
> Il n'y a point de g�nie sans un grain de folie.
> 	(Aristote)
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
