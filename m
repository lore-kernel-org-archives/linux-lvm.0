Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4JEbUPl010520
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 10:37:30 -0400
Received: from ik-out-1112.google.com (ik-out-1112.google.com [66.249.90.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4JEbF1V020013
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 10:37:15 -0400
Received: by ik-out-1112.google.com with SMTP id c30so527514ika.3
	for <linux-lvm@redhat.com>; Mon, 19 May 2008 07:37:14 -0700 (PDT)
Message-ID: <1c748a490805190737h35a11073le7dede4a98ae78c0@mail.gmail.com>
Date: Mon, 19 May 2008 07:37:13 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] lvm partition on ramdisk
In-Reply-To: <Pine.LNX.4.44.0805131309330.29266-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_13787_5989696.1211207833531"
References: <1c748a490805130716y558520d7i7b2781816bd743e1@mail.gmail.com>
	<Pine.LNX.4.44.0805131309330.29266-100000@bmsred.bmsi.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_13787_5989696.1211207833531
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Final results FYI in this investigation: A recent Ubuntu release gets past
the 1TB limit. I found binaries for dosfstools_2.11-2.1ubuntu3 at

http://packages.ubuntu.com/feisty/otherosfs/dosfstools

and unpacked them with ar -x. The source is in

https://launchpad.net/ubuntu/+source/dosfstools/2.11-2.1ubuntu3

With 4KB sectors, it defaults to 128KB clusters and reaches over 97% write
speed on an 8TB volume. The ramdisk area needed is a little over 512MB, so
if you use 768MB you get quite a bit of room for directories also on
ramdisk, and with a little finesse you can even make the subdirectories lay
themselves down on ramdisk. To be "Windows-legal" you could use 32KB
clusters and a little over 2GB ramdisk (or a little over 1GB with one FAT).
Linux is happy with the big clusters, and according to the design should
actually be willing to go to 16TB.

Larry

On 5/13/08, Stuart D. Gathman <stuart@bmsi.com> wrote:
>
> On Tue, 13 May 2008, Larry Dickson wrote:
>
> > on the full, unpartitioned lv. Then it mounted, with the entire FAT on
> > ramdisk, and wrote very fast because FAT32 (like DOS) lays down data in
> > order from the start of a disk and does not skip around (I'd be
> interested
> > if anyone knows any other file systems with that property).
>
> The SysV filesystem put a fixed size inode table at the beginning of a
> partition.  More modern filesystems from ext to reiser try to distribute
> the meta-data to keep it closer to the data.  This is, of course, counter
> productive when the beginning of a disk is significantly faster and
> seek-free
> as in your setup.
>
> Since ext3 inode placement is table driven (with the table in a magic
> inode),
> there is probably a simple patch to mke2fs to create only one inode table
> at
> the beginning of a drive.  In fact, I wonder if there is already an
> option...
> looks like -g blocks_per_group might do the trick - assuming inodes are
> at the beginning of a block group, rather than the middle.  If not,
> a patch to mke2fs is needed to do what you want.
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_13787_5989696.1211207833531
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Final results FYI&nbsp;in this investigation: A recent Ubuntu release gets past the 1TB limit. I found binaries for dosfstools_2.11-2.1ubuntu3 at<br>&nbsp;<br><a href="http://packages.ubuntu.com/feisty/otherosfs/dosfstools">http://packages.ubuntu.com/feisty/otherosfs/dosfstools</a> <br>
&nbsp;<br>and unpacked them with ar -x. The source is in<br>&nbsp;<br><a href="https://launchpad.net/ubuntu/+source/dosfstools/2.11-2.1ubuntu3">https://launchpad.net/ubuntu/+source/dosfstools/2.11-2.1ubuntu3</a><br>&nbsp;</div>
<div>With 4KB sectors, it defaults to 128KB clusters and reaches over 97% write speed on an 8TB volume. The ramdisk area needed is a little over 512MB, so if you use 768MB&nbsp;you get quite a bit of room for directories also on ramdisk, and with a little finesse you can even make the subdirectories lay themselves down on ramdisk. To be &quot;Windows-legal&quot; you could use 32KB clusters and a little over 2GB ramdisk (or a little over 1GB with one FAT). Linux is happy with the big clusters, and according to the design should actually be willing to go to 16TB.<br>
<br>Larry</div>
<div>&nbsp;</div>
<div><span class="gmail_quote">On 5/13/08, <b class="gmail_sendername">Stuart D. Gathman</b> &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Tue, 13 May 2008, Larry Dickson wrote:<br><br>&gt; on the full, unpartitioned lv. Then it mounted, with the entire FAT on<br>
&gt; ramdisk, and wrote very fast because FAT32 (like DOS) lays down data in<br>&gt; order from the start of a disk and does not skip around (I&#39;d be interested<br>&gt; if anyone knows any other file systems with that property).<br>
<br>The SysV filesystem put a fixed size inode table at the beginning of a<br>partition.&nbsp;&nbsp;More modern filesystems from ext to reiser try to distribute<br>the meta-data to keep it closer to the data.&nbsp;&nbsp;This is, of course, counter<br>
productive when the beginning of a disk is significantly faster and seek-free<br>as in your setup.<br><br>Since ext3 inode placement is table driven (with the table in a magic inode),<br>there is probably a simple patch to mke2fs to create only one inode table at<br>
the beginning of a drive.&nbsp;&nbsp;In fact, I wonder if there is already an option...<br>looks like -g blocks_per_group might do the trick - assuming inodes are<br>at the beginning of a block group, rather than the middle.&nbsp;&nbsp;If not,<br>
a patch to mke2fs is needed to do what you want.<br><br>--<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stuart D. Gathman &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;<br>&nbsp;&nbsp; Business Management Systems Inc.&nbsp;&nbsp;Phone: 703 591-0911 Fax: 703 591-6154<br>
&quot;Confutatis maledictis, flammis acribus addictis&quot; - background song for<br>a Microsoft sponsored &quot;Where do you want to go from here?&quot; commercial.<br><br>_______________________________________________<br>
linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_13787_5989696.1211207833531--
