From: Lance Dillon <ldillon@sk-tech.com>
Subject: Re: [linux-lvm] Totally confused
In-Reply-To: <20031231121144.9792.qmail@web13507.mail.yahoo.com>
Message-ID: <Pine.LNX.4.44.0312311102580.32046-100000@www.sk-tech.com>
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
Date: Wed Dec 31 11:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 31 Dec 2003, Stuart Felenstein wrote:

> I thought I understood LVM and set it up correctly on
> my /dev/hda3.  Somethings is wrong though.  Here is
> the output from lvdisplay:
> 
> LV Name              /dev/Volume00/videos
> VG Name              Volume00
> LV Write Access      read/write
> LV Status            available
> LV#                  1
> #open                1
> LV Size              68.67 GB
> Current LE           17579
> Allocated LE         17579
> Allocation           next free
> Read ahead sectors   1024
> Block device         58:0 
> 
> After the LV was created I did
> mkfs ext3 -m 0 -T largefile /dev/Volume00/videos
> 
> Oddities (to me), I try to cd /dev/Volume00/videos - I
> get a no directory.  cd to /dev/Volume00 is
> acccessible and can be written to.  
> I assumed that i was going to have a videos partition
> with 68.67 GB available.  It looks like I have about
> 10 megs or something like that as 5 minutes of mpgeg
> gave me a "device out of space".
> 
> This is lvm 1.08 , straight from kernel 2.4.23
> builtin.
> 
> Am I just not doing something correct here?
> 
> Thanks
> Stuart
> 

The problem is that /dev/Volume00/videos is not the directory, but the 
device that you mount onto a directory.  Try this instead:

mke2fs -j -T largefile -m 0 /dev/Volume000/videos
mkdir /videos
mount -t ext3 /dev/Volume00/videos /videos

This mounts the /dev/Volume00/videos lv onto the location /videos.  You 
can mount it anywhere you like, of course.

Now you can write your files under /videos.

l
