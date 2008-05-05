Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m45EUodZ002050
	for <linux-lvm@redhat.com>; Mon, 5 May 2008 10:30:50 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.153])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m45EUL8c021590
	for <linux-lvm@redhat.com>; Mon, 5 May 2008 10:30:22 -0400
Received: by fg-out-1718.google.com with SMTP id e21so468024fga.7
	for <linux-lvm@redhat.com>; Mon, 05 May 2008 07:30:21 -0700 (PDT)
Message-ID: <1c748a490805050730w3c303bf4y77c624ab0669641a@mail.gmail.com>
Date: Mon, 5 May 2008 07:30:21 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] Temporary shapshots
In-Reply-To: <Pine.LNX.4.44.0805032037140.6617-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3773_20437253.1209997821248"
References: <Pine.LNX.4.64.0805022200280.13318@engineering.redhat.com>
	<Pine.LNX.4.44.0805032037140.6617-100000@bmsred.bmsi.com>
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

------=_Part_3773_20437253.1209997821248
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I love this idea because it nicely covers one of the main purposes of
snapshotting, namely, making backups at a well-defined time point. Would
there ever be any use of a temporary read-write snapshot? If not, perhaps
making it read-only would simplify the design.

Larry Dickson
Cutting Edge Networked Storage

On 5/3/08, Stuart D. Gathman <stuart@bmsi.com> wrote:
>
> On Fri, 2 May 2008, Mikulas Patocka wrote:
>
> > To use temporary storage for snapshot, a special command for lvm would be
> > more appropriate --- a command that would setup snapshot and write
> nothing
> > about it to metadata, so that the snapshot would be forgotten on next
> > reboot --- then, you can setup the snapshot on any device outside the
> > volume group. You can already do this with dmsetup.
>
> This is an excellent idea - and not just for ramdisks.  The hardest part
> of using snapshots for backups is making sure they are deleted afterward.
> Not having to check at reboot would be one less 'i' to dot.
>
> Now supposing this feature is added to lvm - what if an enterprising
> admin decides to create *two* snapshots using the same block device?
> This could be a caveat emptor - or it could check that the block device
> was not in use by anything else, like another snapshot.
>
> Couldn't a LV be used for a temporary snapshot also?  It would just
> look like the COW instead of the snapshot image.  I could allocate
> a backup_cow LV for backup use only.
>
> The only problem I see is newbies getting very confused wondering why
> their "snapshot" won't mount.  That's why I suggest *not* calling the
> examples (of the temporary snapshot feature) in the docs anything with
> "snap"
> in the name.  I suggest "cow" as above.
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_3773_20437253.1209997821248
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>I love this idea because it nicely covers one of the main purposes of snapshotting, namely, making backups at a&nbsp;well-defined time point. Would there ever be any use of a temporary read-write snapshot? If not, perhaps making it read-only would simplify the design.</div>

<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br>&nbsp;</div>
<div><span class="gmail_quote">On 5/3/08, <b class="gmail_sendername">Stuart D. Gathman</b> &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Fri, 2 May 2008, Mikulas Patocka wrote:<br><br>&gt; To use temporary storage for snapshot, a special command for lvm would be<br>
&gt; more appropriate --- a command that would setup snapshot and write nothing<br>&gt; about it to metadata, so that the snapshot would be forgotten on next<br>&gt; reboot --- then, you can setup the snapshot on any device outside the<br>
&gt; volume group. You can already do this with dmsetup.<br><br>This is an excellent idea - and not just for ramdisks.&nbsp;&nbsp;The hardest part<br>of using snapshots for backups is making sure they are deleted afterward.<br>Not having to check at reboot would be one less &#39;i&#39; to dot.<br>
<br>Now supposing this feature is added to lvm - what if an enterprising<br>admin decides to create *two* snapshots using the same block device?<br>This could be a caveat emptor - or it could check that the block device<br>
was not in use by anything else, like another snapshot.<br><br>Couldn&#39;t a LV be used for a temporary snapshot also?&nbsp;&nbsp;It would just<br>look like the COW instead of the snapshot image.&nbsp;&nbsp;I could allocate<br>a backup_cow LV for backup use only.<br>
<br>The only problem I see is newbies getting very confused wondering why<br>their &quot;snapshot&quot; won&#39;t mount.&nbsp;&nbsp;That&#39;s why I suggest *not* calling the<br>examples (of the temporary snapshot feature) in the docs anything with &quot;snap&quot;<br>
in the name.&nbsp;&nbsp;I suggest &quot;cow&quot; as above.<br><br>--<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stuart D. Gathman &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;<br>&nbsp;&nbsp; Business Management Systems Inc.&nbsp;&nbsp;Phone: 703 591-0911 Fax: 703 591-6154<br>
&quot;Confutatis maledictis, flammis acribus addictis&quot; - background song for<br>a Microsoft sponsored &quot;Where do you want to go from here?&quot; commercial.<br><br>_______________________________________________<br>
linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_3773_20437253.1209997821248--
