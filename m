Message-Id: <20011230081827.54803.qmail@web9503.mail.yahoo.com>
From: SI Reasoning <sczjd@yahoo.com>
In-Reply-To: <20011230073559.76242.qmail@web9506.mail.yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: [Cooker] trying to upgrade from mandrake 8.1 to cooker
 destroyed lvm
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
Date: Sun Dec 30 02:16:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: cooker@linux-mandrake.com, linux-lvm@sistina.com

while attempting 
vgcfgrestore -n mandrake -ll
I got a seg fault. The core file reads:

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^$@#;��[��T
-�T -�

&�������������������������
   %d reads  %d writes

   --- Logical extents ---
   LE    PV                        PE     reads     
writes

--- SI Reasoning <sczjd@yahoo.com> wrote:
> I have had lvm running on a mandrake 8.1 system. 
> When
> I upgraded it to cooker (pre 8.2) it did not read my
> lvm properly (I had /usr, /var and /home pv's in the
> "mandrake" vg. Now it still has the lvmconf file
> mandrake.conf but nothing in /etc/lvmtab.d and
> /etc/lvmtab is a 1 kb file. Since this is a home
> system, I have no backups...but it still has info I
> would like to keep.
> 
> Is there a way to rebuild this? I am pretty new to
> lvm.
> I am running lvm-0.9-3mdk. I have lvm running on a
> fresh install of cooker on my laptop so I know this
> version works.
> 
> I still have /dev/hda3 showing as a lvm partion (8e)
> mandrake had set them up originally as
> /dev/mandrake/1
> /dev/mandrake/2
> /dev/mandrake/3
> 
> /etc/fstab
> /dev/hda1 / reiserfs notail 1 1
> none /dev/pts devpts mode=0620 0 0
> none /dev/shm tmpfs defaults 0 0
> /dev/mandrake/1 /home reiserfs defaults 1 2
> /dev/hdg /mnt/cdrom auto
> user,iocharset=iso8859-1,exec,codepage=850,ro,noauto
> 0$
> /dev/fd0 /mnt/floppy auto
>
user,iocharset=iso8859-1,sync,exec,codepage=850,noaut$none
> /proc proc defaults 0 0
> none /tmp tmpfs defaults 0 0
> /dev/mandrake/2 /usr reiserfs defaults 1 2
> /dev/mandrake/3 /var reiserfs defaults 1 2
> /dev/hda2 swap swap defaults 0 0
> /dev/hda5 swap swap defaults 0 0
> 
> I had to setup /dev/hda2 as swap to enable the
> cooker
> upgrade since it did not recognize /dev/hda5 during
> the install. It still does not recognize /dev/hda5
> 
> 
> 
> 
> =====
> SI Reasoning
> sczjd@yahoo.com
> 
> "They that can give up essential liberty to obtain a
> little temporary safety deserve neither liberty nor
> safety." 
> Benjamin Franklin
> 
> __________________________________________________
> Do You Yahoo!?
> Send your FREE holiday greetings online!
> http://greetings.yahoo.com
> 


=====
SI Reasoning
sczjd@yahoo.com

"They that can give up essential liberty to obtain a little temporary safety deserve neither liberty nor safety." 
Benjamin Franklin

__________________________________________________
Do You Yahoo!?
Send your FREE holiday greetings online!
http://greetings.yahoo.com
