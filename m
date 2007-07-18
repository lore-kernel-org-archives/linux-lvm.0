Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6I1fhxc000906
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2007 21:41:44 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.250])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6I1fghm011458
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2007 21:41:42 -0400
Received: by an-out-0708.google.com with SMTP id c31so5555ana
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2007 18:41:41 -0700 (PDT)
Message-ID: <ca3f4a240707171841w626b2a41o7cc07d14111ebea9@mail.gmail.com>
Date: Tue, 17 Jul 2007 20:41:41 -0500
From: "Allan Wolfe" <allan.wolfe@gmail.com>
Subject: Re: [linux-lvm] disk recovery - mounting external USB lvm2 volume
In-Reply-To: <20070717031215.GB24644@bdmcc-us.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_90096_23132968.1184722901336"
References: <ca3f4a240707151830q4cd06100hbaea5969e4589258@mail.gmail.com>
	<20070716014007.GA31102@bdmcc-us.com>
	<ca3f4a240707161928y94deabr15839a6b6eb554ef@mail.gmail.com>
	<20070717031215.GB24644@bdmcc-us.com>
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

------=_Part_90096_23132968.1184722901336
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Yes.  The grub.conf does refer to the logical volume.  I also see
/etc/blkid/blkid.tab which looks like it is built at boot time (kudzu?).

Thanks for the advise.  Before doing anything, I'll back up what is
sacred;-)

On 7/16/07, Brian McCullough <bdmc@bdmcc-us.com> wrote:
>
> On Mon, Jul 16, 2007 at 09:28:01PM -0500, Allan Wolfe wrote:
> > Thanks Brian.  This is starting to make sense.  The Fedora 7 and the old
> FC6
> > both are named the defaults.  Here is the result from the vgchange:
> >
> > $ sudo vgchange -a y
> >  2 logical volume(s) in volume group "VolGroup00" now active
> >  2 logical volume(s) in volume group "VolGroup00" now active
> >
> > Digging around in the man pages, it looks to me as though I will need to
> > rename the active/current volume using vgrename command, change the
> > /etc/fstab to the new name and then follow on with mounting the old
> volume
> > using the old default volume.
> >
> > Am I on the right track?  Thanks for your help.
>
> Yes, you are.  However, I recommend that you plan every step carefully,
> so that you don't wind up with an unbootable system.  Make sure that you
> have renamed the "local" LVM volumes, the fstab entries and anything
> that might depend on those names. ( some things can break, but you had
> better make sure that you can boot -- by the way, what do the entries in
> grub.conf refer to? )
>
>
>
> Brian
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_90096_23132968.1184722901336
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Yes.&nbsp; The grub.conf does refer to the logical volume.&nbsp; I also see /etc/blkid/blkid.tab which looks like it is built at boot time (kudzu?).<br><br>Thanks for the advise.&nbsp; Before doing anything, I&#39;ll back up what is sacred;-)
<br><br><div><span class="gmail_quote">On 7/16/07, <b class="gmail_sendername">Brian McCullough</b> &lt;<a href="mailto:bdmc@bdmcc-us.com">bdmc@bdmcc-us.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On Mon, Jul 16, 2007 at 09:28:01PM -0500, Allan Wolfe wrote:<br>&gt; Thanks Brian.&nbsp;&nbsp;This is starting to make sense.&nbsp;&nbsp;The Fedora 7 and the old FC6<br>&gt; both are named the defaults.&nbsp;&nbsp;Here is the result from the vgchange:
<br>&gt;<br>&gt; $ sudo vgchange -a y<br>&gt;&nbsp;&nbsp;2 logical volume(s) in volume group &quot;VolGroup00&quot; now active<br>&gt;&nbsp;&nbsp;2 logical volume(s) in volume group &quot;VolGroup00&quot; now active<br>&gt;<br>&gt; Digging around in the man pages, it looks to me as though I will need to
<br>&gt; rename the active/current volume using vgrename command, change the<br>&gt; /etc/fstab to the new name and then follow on with mounting the old volume<br>&gt; using the old default volume.<br>&gt;<br>&gt; Am I on the right track?&nbsp;&nbsp;Thanks for your help.
<br><br>Yes, you are.&nbsp;&nbsp;However, I recommend that you plan every step carefully,<br>so that you don&#39;t wind up with an unbootable system.&nbsp;&nbsp;Make sure that you<br>have renamed the &quot;local&quot; LVM volumes, the fstab entries and anything
<br>that might depend on those names. ( some things can break, but you had<br>better make sure that you can boot -- by the way, what do the entries in<br>grub.conf refer to? )<br><br><br><br>Brian<br><br><br>_______________________________________________
<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at 
<a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_90096_23132968.1184722901336--
