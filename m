Message-ID: <20011113043112.78140.qmail@web10401.mail.yahoo.com>
From: BOIK MOON <mooasun@yahoo.com>
Subject: Re: [linux-lvm] Help on LVM/SW-RAID build problems
In-Reply-To: <3BEDB4B6.4040402@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-224796404-1005625872=:77856"
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
Date: Mon Nov 12 22:29:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--0-224796404-1005625872=:77856
Content-Type: text/plain; charset=us-ascii


 Hi,
> >Is it OK to use the partition type "0x8e" for
>>LVM/SW-RAID? How about "0xfd"?
>>
>you can not create LVM/SW-RAID
>you can make LVM over SW-RAID or SW-RAID over LVM
Why am I getting an error on the partition when I use 0x8e as type?
Yes, I did not have any error when I used 0xfd as partition type.
To make SW-RAID over LVM, Should I create the partition using 0x8e(LVM) type?
Thanks for your kind answer
Bo
  svetljo <galia@st-peter.stw.uni-erlangen.de> wrote: Hi
you shouldn't change the softRAID partition id to lvm
you had to create the lvm over the RAID

>1) fdisk error
>
>Disk /dev/hdb: 255 heads, 63 sectors, 2434 cylinders
>Units = cylinders of 16065 * 512 bytes
> 
> Device Boot Start End Blocks Id 
>System
>/dev/hdb1 1 64 514048+ 8e 
>Linux LVM
>/dev/hdb2 65 702 5124735 8e 
>Linux LVM
>/dev/hdb3 703 1340 5124735 8e 
>Linux LVM
> 
>
you have destroyed the RAID

>
>Command (m for help): w
>The partition table has been altered!
>
>
>2) No such file error
> 
>
you have no the raid devices hdb[1-3]

>
>root@bo:~ > raidstop --all
>cannot determine md version: No such file or directory
> 
>kingate@bo:~ > /sbin/mkraid
>cannot determine md version: No such file or directory
> 
>kingate@bo:~ > /sbin/mkraid --really-force /dev/md1
>cannot determine md version: No such file or directory
>
>3) Partiton type
>
> Is it OK to use the partition type "0x8e" for
>LVM/SW-RAID? How about "0xfd"?
>
you can not create LVM/SW-RAID
you can make LVM over SW-RAID or SW-RAID over LVM

>
>Thanks in advance,
>
>Bo
>
>-----------------raidtab------------
>raiddev /dev/md0
> raid-level 0
> nr-raid-disks 2
> nr-spare-disks 0
> chunk-size 4
> persistent-superblock 1
> device /dev/hdb1
> raid-disk 0
> device /dev/hdc1
> raid-disk 1
> 
>raiddev /dev/md1
> raid-level 1
> nr-raid-disks 2
> nr-spare-disks 0
> chunk-size 4
> persistent-superblock 1
> device /dev/hdb2
> raid-disk 0
> device /dev/hdc2
> raid-disk 1
>
>raiddev /dev/md2
> raid-level 1
> nr-raid-disks 2
> nr-spare-disks 0
> chunk-size 4
> persistent-superblock 1
> device /dev/hdb3
> raid-disk 0
> device /dev/hdc3
> raid-disk 1
>
that is OK
but /dev/hda[1-3] and /dev/hdb[1-3] should be SW-RAID ( partition id)

and then
pvcreate /dev/md0 /dev/md1 /dev/md2
vgcreate
.........

good luck



_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html





---------------------------------
Do You Yahoo!?
Find the one for you at Yahoo! Personals.
--0-224796404-1005625872=:77856
Content-Type: text/html; charset=us-ascii

<P>&nbsp;Hi,
<P>&gt; &gt;Is it OK to use the partition type "0x8e" for<BR>&gt;&gt;LVM/SW-RAID? How about "0xfd"?<BR>&gt;&gt;<BR>&gt;you can not create LVM/SW-RAID<BR>&gt;you can make LVM over SW-RAID or SW-RAID over LVM
<P>Why am I getting an error on the partition when I use 0x8e as type?
<P>Yes, I did not have any error when I used 0xfd as partition type.
<P>To make SW-RAID over LVM, Should I create the partition using 0x8e(LVM) type?
<P>Thanks for your kind answer
<P>Bo
<P>&nbsp; <B><I>svetljo &lt;galia@st-peter.stw.uni-erlangen.de&gt;</I></B> wrote: 
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">Hi<BR>you shouldn't change the softRAID partition id to lvm<BR>you had to create the lvm over the RAID<BR><BR>&gt;1) fdisk error<BR>&gt;<BR>&gt;Disk /dev/hdb: 255 heads, 63 sectors, 2434 cylinders<BR>&gt;Units = cylinders of 16065 * 512 bytes<BR>&gt; <BR>&gt; Device Boot Start End Blocks Id <BR>&gt;System<BR>&gt;/dev/hdb1 1 64 514048+ 8e <BR>&gt;Linux LVM<BR>&gt;/dev/hdb2 65 702 5124735 8e <BR>&gt;Linux LVM<BR>&gt;/dev/hdb3 703 1340 5124735 8e <BR>&gt;Linux LVM<BR>&gt; <BR>&gt;<BR>you have destroyed the RAID<BR><BR>&gt;<BR>&gt;Command (m for help): w<BR>&gt;The partition table has been altered!<BR>&gt;<BR>&gt;<BR>&gt;2) No such file error<BR>&gt; <BR>&gt;<BR>you have no the raid devices hdb[1-3]<BR><BR>&gt;<BR>&gt;root@bo:~ &gt; raidstop --all<BR>&gt;cannot determine md version: No such file or directory<BR>&gt; <BR>&gt;kingate@bo:~ &gt; /sbin/mkraid<BR>&gt;cannot determine md version: No such file or directory<BR>&gt; <BR>&gt;kingate@bo:~ &gt; /sbin/mkraid --really-force /dev/md1<BR>&gt;cannot determine md version: No such file or directory<BR>&gt;<BR>&gt;3) Partiton type<BR>&gt;<BR>&gt; Is it OK to use the partition type "0x8e" for<BR>&gt;LVM/SW-RAID? How about "0xfd"?<BR>&gt;<BR>you can not create LVM/SW-RAID<BR>you can make LVM over SW-RAID or SW-RAID over LVM<BR><BR>&gt;<BR>&gt;Thanks in advance,<BR>&gt;<BR>&gt;Bo<BR>&gt;<BR>&gt;-----------------raidtab------------<BR>&gt;raiddev /dev/md0<BR>&gt; raid-level 0<BR>&gt; nr-raid-disks 2<BR>&gt; nr-spare-disks 0<BR>&gt; chunk-size 4<BR>&gt; persistent-superblock 1<BR>&gt; device /dev/hdb1<BR>&gt; raid-disk 0<BR>&gt; device /dev/hdc1<BR>&gt; raid-disk 1<BR>&gt; <BR>&gt;raiddev /dev/md1<BR>&gt; raid-level 1<BR>&gt; nr-raid-disks 2<BR>&gt; nr-spare-disks 0<BR>&gt; chunk-size 4<BR>&gt; persistent-superblock 1<BR>&gt; device /dev/hdb2<BR>&gt; raid-disk 0<BR>&gt; device /dev/hdc2<BR>&gt; raid-disk 1<BR>&gt;<BR>&gt;raiddev /dev/md2<BR>&gt; raid-level 1<BR>&gt; nr-raid-disks 2<BR>&gt; nr-spare-disks 0<BR>&gt; chunk-size 4<BR>&gt; persistent-superblock 1<BR>&gt; device /dev/hdb3<BR>&gt; raid-disk 0<BR>&gt; device /dev/hdc3<BR>&gt; raid-disk 1<BR>&gt;<BR>that is OK<BR>but /dev/hda[1-3] and /dev/hdb[1-3] should be SW-RAID ( partition id)<BR><BR>and then<BR>pvcreate /dev/md0 /dev/md1 /dev/md2<BR>vgcreate<BR>.........<BR><BR>good luck<BR><BR><BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@sistina.com<BR>http://lists.sistina.com/mailman/listinfo/linux-lvm<BR>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html<BR><BR><BR></BLOCKQUOTE><p><br><hr size=1><b>Do You Yahoo!?</b><br>
Find the one for you at <a
href="http://rd.yahoo.com/mktg/mail/txt/tagline/?http://personals.yahoo.com" target="_blank">Yahoo! Personals</a>.
--0-224796404-1005625872=:77856--
