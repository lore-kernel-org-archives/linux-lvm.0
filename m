From: Spam <spam@tnonline.net>
Message-ID: <1226895046.20031223010608@tnonline.net>
Subject: Re: [linux-lvm] umount returns device is busy
In-Reply-To: <20031222231520.GA31471@MAIL.13thfloor.at>
References: <000701c3c8b7$3190a800$c3507580@atdsputnik>
 <3FE76BD3.13937AA5@uiuc.edu> <20031222231520.GA31471@MAIL.13thfloor.at>
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
Date: Mon Dec 22 18:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Herbert Poetzl <linux-lvm@sistina.com>


> On Mon, Dec 22, 2003 at 04:10:27PM -0600, P. Larry Nelson wrote:
>> I've been using LVM now since sometime this past summer and
>> everything has worked great and as advertised, until I tried
>> to unmount a logical volume.  And this happens on both RedHat
>> 9 and ES_3.
>> 
>> I had occasion the other day to unmount one of the mounted raid 
>> arrays in order to upgrade some firmware.  When I tried to do an
>> unmount command, I got "device is busy".  Ok, I'm cd'd there
>> from one of my windows or something, so I make sure all open
>> terminal windows are *not* cd'd there.  Redo the umount command
>> with same result.  Weird, something's got a file open. So, I did
>> an lsof command and grep for the device (/dev/VG1/LV1).  Nothing.
>> I try greping for the mount name (/scratch/cdf).  Nothing.
>> It will not let me unmount the logical volume.
>> 
>> The system in question is running RedHat 9 w/kernel 2.4.20-24.9smp
>> with RedHat's lvm-1.0.3-12.  I just so happened to have built 
>> another system using RedHat's ES_3 w/kernel 2.4.21-4.0.1.ELsmp and
>> their lvm-1.0.3-15, so I thought I'd try it there.  Built an identical
>> logical volume, mounted it, tested it (works fine), tried to umount
>> the filesystem with identical results: device is busy.  Checked
>> again using lsof.  Nothing open on the mounted filesystem.
>> 
>> I went checking back thru about 4 months of this list and saw
>> (apparently) that no one else has this problem.  At this point
>> I'm a bit baffled why the umount command isn't working.  I've
>> also seen nothing that might address this in the LVM-HOWTO.
>> Then again, I could have missed it.
>> 
>> Ideas?

> maybe some kernel service is holding a reference
> to that device, nfs or samba server comes to mind, 
> just try to disable them one after the other and
> see if umount will work ...

  In  my opinion this is a severe mis-feature (aka: bug) in the Linux
  kernels.  In  some occasions it is impossible to kill an application
  when  unmounting  a filesystem. This leads to problems with shutting
  down  the  system  cleanly.  For  example  a  device might have been
  temporary  offline  when  samba tried to access it. The samba thread
  locks  indefinitely  and  it  is impossible to kill it and thus also
  impossible to unmount the filesystem.

  Not  sure  if LVM guys can do anything about this though. =) Perhaps
  you  can  push  kernel  developers to make it easier to recover from
  these kinds of problems?

> HTH,
> Herbert
