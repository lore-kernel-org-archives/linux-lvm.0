Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6H2S352009107
	for <linux-lvm@redhat.com>; Mon, 16 Jul 2007 22:28:03 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.242])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6H2S1c3013172
	for <linux-lvm@redhat.com>; Mon, 16 Jul 2007 22:28:01 -0400
Received: by an-out-0708.google.com with SMTP id c31so323249ana
	for <linux-lvm@redhat.com>; Mon, 16 Jul 2007 19:28:01 -0700 (PDT)
Message-ID: <ca3f4a240707161928y94deabr15839a6b6eb554ef@mail.gmail.com>
Date: Mon, 16 Jul 2007 21:28:01 -0500
From: "Allan Wolfe" <allan.wolfe@gmail.com>
Subject: Re: [linux-lvm] disk recovery - mounting external USB lvm2 volume
In-Reply-To: <20070716014007.GA31102@bdmcc-us.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_71106_29614400.1184639281039"
References: <ca3f4a240707151830q4cd06100hbaea5969e4589258@mail.gmail.com>
	<20070716014007.GA31102@bdmcc-us.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_71106_29614400.1184639281039
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks Brian.  This is starting to make sense.  The Fedora 7 and the old FC6
both are named the defaults.  Here is the result from the vgchange:

$ sudo vgchange -a y
  2 logical volume(s) in volume group "VolGroup00" now active
  2 logical volume(s) in volume group "VolGroup00" now active

Digging around in the man pages, it looks to me as though I will need to
rename the active/current volume using vgrename command, change the
/etc/fstab to the new name and then follow on with mounting the old volume
using the old default volume.

Am I on the right track?  Thanks for your help.

On 7/15/07, Brian McCullough <bdmc@bdmcc-us.com> wrote:
>
> On Sun, Jul 15, 2007 at 08:30:40PM -0500, Allan Wolfe wrote:
> >
> > $ sudo mount -t ext3 /dev/sdb2 /media/other
> > mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
> >       missing codepage or other error
> >       In some cases useful info is found in syslog - try
> >       dmesg | tail  or so
> >
> > Disk /dev/sdb: 40.0 GB, 40007761920 bytes
> > 255 heads, 63 sectors/track, 4864 cylinders, total 78140160 sectors
> > Units = sectors of 1 * 512 = 512 bytes
> >
> >   Device Boot      Start         End      Blocks   Id  System
> > /dev/sdb1   *          63      208844      104391   83  Linux
> > /dev/sdb2          208845    78140159    38965657+  8e  Linux LVM
> >
> >
> > I could use some help in understanding how to get the drive mounted
> since
> > it was originally an lvm2 volume with ext3 filesystem laid on top of it.
>
>
> Allan,
>
> You said it right there.  Also, the fdisk output shows you something
> too.
>
> As you can see, the disk partition type is "LVM" and, in fact, when
> mount looks at that partition to try and determine what file system type
> to mount, all it sees is LVM, which mount doesn't understand.
>
> Just before I give you the answer, what were the names of your VG and LV
> in the old system?  If they conflict with the present system, does it
> run LVM disks as well, you will have problems mounting even with what I
> tell you.
>
> In any case, if you issue "vgchange -a y" at your command line, the LVM2
> system in your current machine will rescan all attached disk-like
> devices and find your USB disk's LVM partition.  If the name doesn't
> conflict with something in your system already, you can then go ahead
> and mount the Logical Volumes that are found, just as you tried with the
> Physical Volume, /dev/sdb2.
>
> That is a rather short version of the explanation, so if it is "clear as
> mud," feel free to ask again, and several people here will be able to
> help you with your FC6 system.
>
>
> Hope that helps,
> Brian
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_71106_29614400.1184639281039
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks Brian.&nbsp; This is starting to make sense.&nbsp; The Fedora 7 and the old FC6 both are named the defaults.&nbsp; Here is the result from the vgchange:<br><br>$ sudo vgchange -a y<br>&nbsp; 2 logical volume(s) in volume group &quot;VolGroup00&quot; now active
<br>&nbsp; 2 logical volume(s) in volume group &quot;VolGroup00&quot; now active<br><br>Digging around in the man pages, it looks to me as though I will need to rename the active/current volume using vgrename command, change the /etc/fstab to the new name and then follow on with mounting the old volume using the old default volume.
<br><br>Am I on the right track?&nbsp; Thanks for your help.<br><br><div><span class="gmail_quote">On 7/15/07, <b class="gmail_sendername">Brian McCullough</b> &lt;<a href="mailto:bdmc@bdmcc-us.com">bdmc@bdmcc-us.com</a>&gt; wrote:
</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">On Sun, Jul 15, 2007 at 08:30:40PM -0500, Allan Wolfe wrote:<br>&gt;<br>&gt; $ sudo mount -t ext3 /dev/sdb2 /media/other
<br>&gt; mount: wrong fs type, bad option, bad superblock on /dev/sdb2,<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; missing codepage or other error<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In some cases useful info is found in syslog - try<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dmesg | tail&nbsp;&nbsp;or so<br>&gt;
<br>&gt; Disk /dev/sdb: 40.0 GB, 40007761920 bytes<br>&gt; 255 heads, 63 sectors/track, 4864 cylinders, total 78140160 sectors<br>&gt; Units = sectors of 1 * 512 = 512 bytes<br>&gt;<br>&gt;&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Blocks&nbsp;&nbsp; Id&nbsp;&nbsp;System
<br>&gt; /dev/sdb1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;63&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;208844&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;104391&nbsp;&nbsp; 83&nbsp;&nbsp;Linux<br>&gt; /dev/sdb2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;208845&nbsp;&nbsp;&nbsp;&nbsp;78140159&nbsp;&nbsp;&nbsp;&nbsp;38965657+&nbsp;&nbsp;8e&nbsp;&nbsp;Linux LVM<br>&gt;<br>&gt;<br>&gt; I could use some help in understanding how to get the drive mounted since
<br>&gt; it was originally an lvm2 volume with ext3 filesystem laid on top of it.<br><br><br>Allan,<br><br>You said it right there.&nbsp;&nbsp;Also, the fdisk output shows you something<br>too.<br><br>As you can see, the disk partition type is &quot;LVM&quot; and, in fact, when
<br>mount looks at that partition to try and determine what file system type<br>to mount, all it sees is LVM, which mount doesn&#39;t understand.<br><br>Just before I give you the answer, what were the names of your VG and LV
<br>in the old system?&nbsp;&nbsp;If they conflict with the present system, does it<br>run LVM disks as well, you will have problems mounting even with what I<br>tell you.<br><br>In any case, if you issue &quot;vgchange -a y&quot; at your command line, the LVM2
<br>system in your current machine will rescan all attached disk-like<br>devices and find your USB disk&#39;s LVM partition.&nbsp;&nbsp;If the name doesn&#39;t<br>conflict with something in your system already, you can then go ahead
<br>and mount the Logical Volumes that are found, just as you tried with the<br>Physical Volume, /dev/sdb2.<br><br>That is a rather short version of the explanation, so if it is &quot;clear as<br>mud,&quot; feel free to ask again, and several people here will be able to
<br>help you with your FC6 system.<br><br><br>Hope that helps,<br>Brian<br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_71106_29614400.1184639281039--
