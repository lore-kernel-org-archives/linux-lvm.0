Date: Fri, 1 Oct 1999 14:40:03 +0200
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: Re: [linux-lvm] LVM, raw-io, devfs
Message-ID: <19991001144003.B29576@redneck.sk.oracle.com>
Reply-To: freddy@sk.oracle.com
References: <006201bf0bb7$6eae4a60$030116ac@fd1>
Mime-Version: 1.0
In-Reply-To: <006201bf0bb7$6eae4a60$030116ac@fd1>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fernando Dammous <ferdam@internetcom.com.br>
Cc: linux-lvm@msede.com

Fernando Dammous (ferdam@internetcom.com.br) wrote :

> LVM 0.7 is installed (built into the kernel, which is still in the version 2.0.36) and working perfectly, with the root filesystem and swap in a LV (boot with initrd).  
>   
> Now, I would like to install the devfs and mainly the raw-io.   
>   
> Can I install them in a kernel 2.0.36, which is already patched with LVM?  
>   
> Should I apply the patches in which order (first devfs, later the raw-io, or vice versa)?  
>   
> I intend to install Oracle8 using raw-io.   

well, I'm still not sure whether Oracle software is compatible with raw-io patch in linux kernel, please let me know how are you doing with that.

> The devfs isn't so important for me (should it be ?).  

devfs is a very usable patch compatible with most of devices (including LVM) and software (I can only think of vmware that doesn't run with vmware). it saves a lot of inodes in /dev and contains only devices really present in the system and uses intelligent backward-compatible naming scheme (so you can still use inodes like /dev/sda etc) present in many modern UN*X flavors (like Solaris, e.g.). You should give it at lease a chance before saying you use it only because of raw-devices ;)

> If anyone knows about restrictions or some clues I would thank a lot.  

Regards,
-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\___/ /_/\_\  does infinite loops in 5 seconds
