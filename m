From: Spam <spam@tnonline.net>
Message-ID: <35114864625.20031104092116@tnonline.net>
Subject: Re[2]: [linux-lvm] Re: One PV destroyed - now the whole VG isn't working anymore
In-Reply-To: <3FA7591C.2080105@webhackande.se>
References: <000001c3a255$1f5f3940$7801a8c0@asuncion>
 <3FA7591C.2080105@webhackande.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Nov  4 02:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Rickard Olsson <richie@webhackande.se>
Cc: linux-lvm@sistina.com


> Samuel Leuthold wrote:

>> So can i release the third disk from the LV, reformat and rebind into it
>> without loosing the data on disk1 and 2?? 

> Yes. But, if you are using striping instead of simple concatenation, you
> are, as the saying goes, toast.

> However, it may be possible to salvage most of the data from the third
> disk too.

> Method #1.
> Use   dd conv=noerror   to raw copy data off the bad disk to a fourth,
> good disk. Swap the bad disk for the new one.

  I  would  use  dd_rescue  instead  of dd. dd_rescure is specifically
  made  for copying data off broken disks. If you have bad sectors you
  will  be  much  better  off with dd_rescue. IF the disk stalls while
  copying  you  can  tell dd_rescue to copy backwards to avoid reading
  from that sector again.

  If  you  do  not have to much bad sectors you should be able to save
  most data from your filesystem.

> Method #2.
> If there's free space on the other two disks (or you can add a fourth
> disk), you can try   pvmove --ignore_read_errors   to move as many 
> extents as possible off the bad disk onto the good ones.

>> And what about the reiser? Is it
>> consistent after this "hack"??

> No, in all cases you will need to run reiserfsck, most likely with the
> -rebuild-tree option. But seeing as your disk has badblocks, your FS is
> already in a bad state.

  Be  sure to use most current reiserfsck. Latest is 3.6.11 and can be
  downloaded from: ftp://ftp.namesys.com/pub/reiserfsprogs/

 >> Can i do it with these commands??

> If your metadata is intact, you won't need most of that example. You can
> search the list archive for my conversation with Heinz a little over a
> month or so ago, we went through this exact thing. :-)

>> Whats the meaning of
>> the "0" in storage\0 ??

> Think of it as an end-of-line character (it's a null-terminated string).
