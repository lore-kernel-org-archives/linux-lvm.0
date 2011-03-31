Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2VF6AB3002057
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2011 11:06:10 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2VF622i027439
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2011 11:06:03 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	(Authenticated sender: ba9826)
	by smtp.bredband2.com (Postfix) with ESMTPA id B8D97A11E3
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2011 17:06:01 +0200 (CEST)
Message-ID: <8D6C975F95144BEBB5084D6B86B210E6@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <DE6049702F6A4634890B18D047C27E03@caramon><20110329124434.3cf62c3e@bettercgi.com><CE3415B4EB40445F8F294A52BC905070@caramon><alpine.LRH.2.00.1103291804330.23827@bmsred.bmsi.com><5A7D1164A7AD4CA292C1E5176D286D23@caramon>
	<20110330100423.7a9e3100@bettercgi.com>
Date: Thu, 31 Mar 2011 17:06:39 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

If I ever get all this data back I will definitely try to either RAID it or 
make a backup of the most importatnt stuff on the volume.

I have now run e2fsck -n -t -v /dev/vgftp/lvftp successfully. It gave me the 
following output. I'm not really sure what it means, but I think it looks 
pretty ok. Do you think it's ok to do this for real now?

################
# e2fsck -n -t -v /dev/vgftp/lvftp
e2fsck 1.41.10 (10-Feb-2009)
/dev/vgftp/lvftp contains a file system with errors, check forced.
Pass 1: Checking inodes, blocks, and sizes

Running additional passes to resolve blocks claimed by more than one 
inode...
Pass 1B: Rescanning for multiply-claimed blocks
Multiply-claimed block(s) in inode 51036510: 102452460
Multiply-claimed block(s) in inode 96436268: 203786736
Multiply-claimed block(s) in inode 122208259: 244427502
Multiply-claimed block(s) in inode 195693509: 396636221
Multiply-claimed block(s) in inode 331595778: 665071629
Pass 1C: Scanning directories for inodes with multiply-claimed blocks
Pass 1D: Reconciling multiply-claimed blocks
(There are 5 inodes containing multiply-claimed blocks.)

File /XX/XXXXXXXX.XXX (inode #51036510, mod time Sun Apr 30 03:39:57 2006)
  has 1 multiply-claimed block(s), shared with 0 file(s):
Multiply-claimed blocks already reassigned or cloned.

File /XXXX/XXXXXXX.XXX (inode #96436268, mod time Sun Feb 25 19:15:11 2007)
  has 1 multiply-claimed block(s), shared with 0 file(s):
Multiply-claimed blocks already reassigned or cloned.

File /XXXX/XXXX/XX.XXX (inode #122208259, mod time Sun Jul 15 18:37:56 2007)
  has 1 multiply-claimed block(s), shared with 0 file(s):
Multiply-claimed blocks already reassigned or cloned.

File /XXX/XXXX.XXX (inode #195693509, mod time Sat Oct 18 01:00:53 2008)
  has 1 multiply-claimed block(s), shared with 0 file(s):
Multiply-claimed blocks already reassigned or cloned.

File /XX/XXX.XXX (inode #331595778, mod time Thu Mar 19 00:51:54 2009)
  has 1 multiply-claimed block(s), shared with 0 file(s):
Multiply-claimed blocks already reassigned or cloned.

Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
Block bitmap 
differences:  -(244--268) -(98548--98572) -(164084--164108) -(229620--229644) 
 -(295156--295180) -(819444--819468) -(884980--885004) -(1605876--1605900) -(2654452--2654476) 
 -(4096244--4096268) -(7962868--7962892) -(11239668--11239692) 
+(14601899--14601923) 
+(14601949--14602273) -(20480244--20480268) -(23888116--23888140) -472222192 
 -512862958 -639323372 -933507085 -933507133
Fix? no


/dev/vgftp/lvftp: ********** WARNING: Filesystem still has errors **********


  308343 inodes used (0.06%)
   56220 non-contiguous files (18.2%)
     206 non-contiguous directories (0.1%)
         # of inodes with ind/dind/tind blocks: 247855/206685/61
1006593162 blocks used (99.57%)
       0 bad blocks
      82 large files

  290797 regular files
   17537 directories
       0 character device files
       0 block device files
       0 fifos
       0 links
       0 symbolic links (0 fast symbolic links)
       0 sockets
--------
  308334 files
Memory used: 736k/309504k (407k/330k), time: 20076.40/1223.57/795.83
I/O read: 133788MB, write: 0MB, rate: 6.66MB/s
######################

I will try to copy the most important stuff off of the volume before i try 
this though.

Before running resize2fs later, how do I figure the right size of the 
filesystem out? Without risking shrinking it too much.

Thanks
/Fredrik Skog


----- Original Message ----- 
From: "Ray Morris" <support@bettercgi.com>
To: <linux-lvm@redhat.com>
Sent: Wednesday, March 30, 2011 5:04 PM
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?


>  Yes i sounds like it's time to fsck, then if needed
> resize2fs to the proper size.  It would be best to
> mount it read only only and copy whatever data copies
> to be safe.  4TB is a lot of data, but then again it's
> only $130 worth of consumer drives to back it up.
> -- 
> Ray Morris
> support@bettercgi.com
>
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
>
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
>
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
>
>
>
>
> On Wed, 30 Mar 2011 02:27:49 +0200
> "Fredrik Skog" <fredrik.skog@rodang.se> wrote:
>
>>
>> ----- Original Message ----- 
>> From: "Stuart D. Gathman" <stuart@bmsi.com>
>> To: "LVM general discussion and development" <linux-lvm@redhat.com>
>> Sent: Wednesday, March 30, 2011 12:14 AM
>> Subject: Re: [linux-lvm] How to fix missmatch between VG-size and
>> LV-size?
>>
>> >SNIP>
>>
>> >> I can run LVM commands fine now after the reboot and the output
>> >> from pvdisplay and lvdisplay is like i posted earlier.
>> >> How can i revert this in a safe way? I was thinking of just
>> >> removing the PV and do a vgcfgrestore to "before" the lvextend.
>> >> But since lvdisplay says the volume is 4.16TiB and pvdisplay says
>> >> 5.59TiB something is wrong? Or am I missing something?
>>
>> >SNIP>
>>
>> >> Is it better to do a e2fsck now?
>>
>> > That is probably the only way to salvage what is left of your
>> > filesystem, but don't do it until we find out whether the LV is the
>> > old or the new size.
>> > I suspect the LV will be the new size, but the filesystem may still
>> > show the old size.  Since the resize2fs should be just adding free
>> > space, there may not be any data loss.  e2fsck would fix the (now
>> > corrupt) free space, and you can extend again.
>>
>> I just added all the segments of the LV from an old backed up config
>> file. It adds up to 3,856TB, so I guess  you were right and i assumed
>> wrong. The old LV was about 3,8TB and the new is about 4,16TB or
>> about 400GB bigger than before as expected by lvextend -L+400G.
>>
>> Also it tells me I have 1,43TiB free wich is 5,59TiB - 4,16TiB. It
>> also looks right.
>>
>> maybe I should try an e2fsck now?
>>
>> again, thanks for your time
>>
>> /Fredrik Skog
>>
>> >
>> > --
>> >        Stuart D. Gathman <stuart@bmsi.com>
>> >     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
>> > 591-6154
>> > "Confutatis maledictis, flammis acribus addictis" - background song
>> > for a Microsoft sponsored "Where do you want to go from here?"
>> > commercial.
>> >
>> > _______________________________________________
>> > linux-lvm mailing list
>> > linux-lvm@redhat.com
>> > https://www.redhat.com/mailman/listinfo/linux-lvm
>> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
