Return-Path: <tgs@iafrica.com>
Date: Tue, 17 Jul 2001 11:26:50 +0000 (GMT)
From: tgs@iafrica.com
Subject: Re: [linux-lvm] Strtup probs !
Message-id: <0GGM00EWJ7ZIWI@smtp08.iafrica.com>
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, ahiam@hotmail.com
Cc: tgs@iafrica.com

I had the same experience. The lvm-how to needs to be updated (changes in the 
boot scripts for slackware). You going to have to change the rc.S file. I will 
prepare a patch for this tonight and post on the mail list, as well email it to 
you.

In the mean time I can explain the problem to you. Currently the rc.S in 
slackware (I'm using version 8.0) does the following:
1. Mount to root partition as ro (read-only).
2. fsck all the filesystems in /etc/fstab. If one of them are a LVM partition 
fsck can't talk to that  then it can't fsck that filesystem and exits with an 
error - you then go into admin mode. In order for fsck to be able to check 
those filesystem you have to activate the volumes (i.e. vgchange -ay). To the 
problem is that you can only run vgchange -ya if the root partition is mounted 
rw. So you have a chicken-egg situation here.

My solution is: 
1. mount the root partition as read-only.
2. run fsck -a /  
3. remount the root partition as read-write 
4. run vgscan and vgchange -ay
5. run fsck -A -a -R     (will check all the fs but not the root, because it is 
already been checked and mounted read-write)


I havnn't converted my root partition on a LVM yet. I don't intent to do that 
not before I very sure that LVM 1.0 is released and stable. 

I'm sure quota should work. I might be under correction but quota will work for 
the filesystem, in your case /home is ext2 and should work.

Theo


> hi all,
> 
> i need help with the following probs 'm facing.....
> my system is--->  512MB, 500Mhz, 3 scsi, Compaq server with 7.0 Slackware
> upgradded packages with latest from Slackware & kernel 2.4.6 ( with LVM as
> module)
> 1) could not start LVM with /etc/fstab entries !   ;-(
>     i have created initrd.gz & have done exactly as stated in HOW-TO to
> start LVM at startup ( i'm doing it only on my /home ).
>     if i dont put entries on my /etc/fstab ( for home & LVM) then it works
> ok, but sooner i put it there on boot there is an error of  something swap
> disk which takes me to administrative mode !!!!.. my /etc/fstab enrty is
> /dev/VGmail/LVmail    /home    ext2    defaults    1    1
> 
> 2) can quota be implimented with LVM  for eg on my /home .. ??
> 
> 3) how to have root partion on LVM.
>     i tried to do that too like in the HOW-TO & did dd on an empty partion.
> but when i tried to convert root partion to LVM  i got errors.. so can
> anyone tell me the actual steps pls !
> 
> pls excuse me for my english
> thanxs in advance...
> arindam haldar
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


---------------------------------------------
This message was sent using M-Web Airmail.
http://airmail.mweb.co.za/
