Date: Mon, 26 Jul 1999 19:54:27 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] RAID and LVM?
In-Reply-To: <19990726131121.A7263@colombina.comedia.it>
Message-ID: <Pine.LNX.4.10.9907261949360.14960-100000@hibernia.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Berra <bluca@comedia.it>
Cc: linux-lvm@msede.de, bluca@colombina.comedia.it, linux-lvm@msede.com

On Mon, 26 Jul 1999, Luca Berra wrote:


  new way!
  you better check alans patch it is on kernel.org mirrors

great... alan must have exercised his magic coding fingers and
massaged the two patches into their proper places :)  

  we have to set the partition as a raid autodetect partition
  then create an initrd with the command
  insmod lvm.o
  vgscan
  vgchange -a y
  
uhmm.. but i think eventually for LVM on RAID autodetect to work
nicely, LVM is going to have to use some block device contents magic.

or ideally for raid to be fully integrated into LVM, and create
RAID-5 VG's. 

  the problem is that when raid is loaded as a module autodetect
  does not happen than when initrd is finished :(
  
  L.
  
  
i'm downloading your patch now anyway. 

regards,
-- 
Paul Jakma
paul@clubi.ie	http://hibernia.clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
A meeting is an event at which the minutes are kept and the hours are lost.
