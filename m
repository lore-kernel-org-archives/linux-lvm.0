From: Spam <spam@tnonline.net>
Message-ID: <3252989968.20031117183528@tnonline.net>
Subject: Re: [linux-lvm] Performance problem.
In-Reply-To: <20031117181007.00e15a29.neuron@hollowtube.mine.nu>
References: <3FB8F8A1.1060004@clin.ucl.ac.be>
 <1069087854.2408.0.camel@localhost.localdomain>
 <20031117181007.00e15a29.neuron@hollowtube.mine.nu>
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
Date: Mon Nov 17 11:36:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

 TCQ  is  in  2.6  kernels  though.  But not all IDE drives support it
 (Mainly  IBM/Hitachi  does).  Kernel  will  find out and enable it if
 drive  support  it.  I have not had any problems with it enabled, nor
 had it solved any harddisk related problems I have had.

 Howerver  unmask  IRQ  or  to  high  UDMA  transfer  mode have caused
 interruptions.  Usually if there is much electrical noise or you have
 bad  cabling  it  is enough to lower UDMA transfer mode to UDMA 66 or
 UDMA 33.

 (more comments below)
 

> seems I was a bit quick on that reply, I remember hearing about
> TCQ a while ago.  Is it considered stable atm?  Noticed it wasn't
> even in my make menuconfig, which makes me very sceptical (it is
> unset in .config though, so the patches are there), running
> mm-sources, well, considering to run it.

>> Thought about trying TCQ for the IDE disks?
>> 
>> On Mon, 2003-11-17 at 10:34, Jean-louis MATTON wrote:
>> > what is your hardware config, mainly for disks ?
>> > in the if I use LVM on top of ide disks some big file transfert, like
>> > ftp tar ..., the system hang  during the file manipulation.
>> > when moving the same config on SCSI disk I never see this situation.
>> > 
>> > My config is soft raid1 + lvm + ext3 fs
>> > 
>> > JL
>> > 
>> > neuron wrote:
>> > 
>> > >I've had lvm running on my server for quite a while now, not sure if
>> > this problem has always been there, or if it just occured.
>> > 
>> > >
>> > >If I through smb listen to music, and then on the server rm a file
>> > about 500mb in size, the music will stop.  Now this is just an
>> > example, it's like the entire filesystem stops while removing the
>> > file.  Running reiserfs ontop of lvm.  Also, when copying through
>> > ftp/smb from the server, I max on about 6mb/sec, which is far from the
>> > 12.1mb/sec avrange I've gotten out of that network card before (on a
>> > slower computer).

     Actually.  SMB  never gives optimal transfer speeds. On a HUB you
     can  expect  not  much more than 6-7MB/S on a 100mbit connection.
     With  a  Switch  you can get higher, up to 12.5MB/s over FTP (but
     never with SMB due to protocol overhead etc).

     Secondly,   SMB/Samba   is  not  very  nice  when  it  comes  to
     multitasking  from the same client. Doing several operations from
     same client can often cause temp interruptions to streaming audio
     etc...

>> > 
>> > >
>> > >Any suggestions on how to improve performance?
>> > >
>> > >(I realize more information is probably preferable, so just tell me
>> > what info you would need, as I'm not really skilled with lvm (= I also
>> > don't have anything fancy like a fake raid running)).
>> > 
>> > >
>> > >neuron
>> > >
>> > >_______________________________________________
