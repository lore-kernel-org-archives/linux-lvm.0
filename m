Message-ID: <3C1501AD.4030605@kenamea.com>
From: Kenny Gorman <kenny@kenamea.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] You must specify a filesystem type error
References: <3C115049.90403@kenamea.com> <20011208154443.E4792@tiger.bigcats.invalid>
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
Date: Mon Dec 10 12:58:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

See below:

Wolfgang Weisselberg wrote:

> Hi, Kenny!
> 
> Kenny Gorman (kenny@kenamea.com) wrote 33 lines:
> 
> 
>>I am utilizing LVM snapshots, and every once in a while I get this 'you 
>>must specify the filesystem type' error when trying to mount the volume:
>>
> 
>>mount: you must specify the filesystem type
>>
> 
> Mount could not mount the FS.  
> 
> 
>>But it only happens once in a while.
>>
> 
> So it's probably not an journalled FS (which needs a
> kernel-patch for online snapshots).  What does the system
> log say?  (dmesg, /var/log/messages or whereever)


It's ReiserFS so it's journaled. Only once in a while to I get the 
error.  Var log messages gives this error when I snapshot:

Dec 10 10:57:43 ino kernel: fatfs: bogus logical sector size 0
Dec 10 10:57:43 ino kernel: VFS: Can't find a valid MSDOS filesystem on 
dev 3a:01.
Dec 10 10:57:44 ino kernel: reiserfs: checking transaction log (device 
3a:01) ...
Dec 10 10:57:44 ino kernel: Using r5 hash to sort names
Dec 10 10:57:44 ino kernel: reiserfs: using 3.5.x disk format
Dec 10 10:57:44 ino kernel: ReiserFS version 3.6.25

funny thing tho, it works just fine most of the time.


> 
> 
>>How can I rid myself of this 
>>issue?  I am on SuSE Linux 7.2 (2.4.7-64GB-smp) with lvm 0.9.1 beta7.
>>
> 
> You may want to upgrade your Kernel and LVM-Tools to 1.0.1...
> No guarantee that the snapshots will be any better, though.


Yea, I should.  thx.
